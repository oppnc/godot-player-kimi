#!/usr/bin/env bash
# Kimi Pilot runner —— 回合制游玩管线（PLAY.md v0.2）
#
# 用法：
#   run.sh start [proj] [--visible] [--fullscreen] [--fps N] [--no-movie]
#       前台启动常驻回合制游戏进程（调用方用后台任务托管其生命周期）；
#       --visible 窗口不离屏，--fullscreen 全屏（人要看/要操作时用它），
#       --fps 改录像帧率（默认 30）。
#       --no-movie 不开 MovieWriter：画面实时流畅（人陪看/陪玩用），
#       代价是没有 PNG 序列——clip 不可用，current.png 改由 pilot 抓视口钉存。
#       （movie 模式下显示节奏被 PNG 编码拖死：2560x1440 时画面远低于实时。）
#       注意：--resolution 不能改 MovieWriter 尺寸（实测无效），宣传片画幅用 clip --wide
#   run.sh clip <A> <B> [proj] [--slow N] [--ff N] [--wide]
#       把物理帧区间 [A,B] 从 PNG 序列打包成 mp4；--slow N 慢放、--ff N 快进
#       （同批帧按 N 倍帧率打包，长块/赶路快扫用）；
#       --wide 统一输出 1280x720 16:9（缩放+黑边填充，宣传片画幅用）
#   run.sh clip-last [proj] [--slow N] [--ff N] [--wide]
#       打包最近一个运行段到固定地址 out/clips/last.mp4（每次覆盖，地址稳定）——
#       每回合看「刚执行的块发生了什么」的默认入口，默认 --slow 2
#
# 结束进程：往 .kimi-play/in/move.json 写 {"command":"quit"}（推荐，进程干净退出并 finalize 录像）。
# 物理帧→PNG 序号：暂停期 PNG 持续重复落盘，无固定比率；映射锚点在 out/framemap.jsonl，
# clip 只支持落在单一运行区间内的 [A,B]（跨段请拆成多条）。
set -euo pipefail

FPS=30
CMD="${1:-}"
PROJ_ARG=""

usage() {
  grep '^#' "$0" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

case "$CMD" in
  start) ;;
  clip)  PROJ_ARG="${4:-.}" ;;
  clip-last) PROJ_ARG="." ;;  # proj 在 cmd_clip_last 内解析（可能与 flag 混排）
  -h|--help|"") usage 0 ;;
  *) echo "unknown command: $CMD" >&2; usage 3 ;;
esac

DIR="$PROJ_ARG/.kimi-play"

cmd_start() {
  local proj="." visible=0 fullscreen=0 no_movie=0
  shift  # 去掉 start 本身
  while [ $# -gt 0 ]; do
    case "$1" in
      --visible) visible=1; shift ;;
      --fullscreen) fullscreen=1; visible=1; shift ;;
      --no-movie) no_movie=1; shift ;;
      --fps) FPS="$2"; shift 2 ;;
      *) proj="$1"; shift ;;
    esac
  done
  PROJ_ARG="$proj"
  DIR="$PROJ_ARG/.kimi-play"
  command -v godot >/dev/null || { echo '{"error":"godot 不在 PATH","hint":"安装 Godot >=4.4 或把 godot 加入 PATH"}' >&2; exit 2; }
  if [ ! -d "$PROJ_ARG/.godot/imported" ]; then
    echo "run.sh: 缺少导入缓存，先跑 godot --headless --import" >&2
    (cd "$PROJ_ARG" && godot --headless --import --path . >/dev/null 2>&1)
  fi
  mkdir -p "$DIR/in" "$DIR/out/frames" "$DIR/out/clips"
  # 会话契约：清掉上一局残留。in/ 的指令与心跳（旧心跳会误触发自毁）；
  # out/ 的 frames/framemap/current.png（旧帧序号与旧段锚点会污染新局的
  # current.png 钉存与 clip 换算——2026-08-29 双路 QA 实测抓获）。
  # telemetry/input_history/obs/state 无害：pilot 启动时自行截断或覆写。
  rm -f "$DIR/in/move.json" "$DIR/in/move.tmp" "$DIR/in/move.json.bad" "$DIR/in/heartbeat"
  rm -f "$DIR/out/framemap.jsonl" "$DIR/out/current.png"
  rm -rf "$DIR/out/frames" && mkdir -p "$DIR/out/frames"
  local pos_args=(--position 5000,5000)
  [ "$visible" = 1 ] && pos_args=()
  [ "$fullscreen" = 1 ] && pos_args+=(--fullscreen)
  local movie_args=(--write-movie ".kimi-play/out/frames/movie.png" --fixed-fps "$FPS")
  [ "$no_movie" = 1 ] && movie_args=()
  echo "run.sh: 启动常驻回合制进程（前台；请用后台任务托管）" >&2
  cd "$PROJ_ARG"
  exec godot --path . \
    ${movie_args[@]+"${movie_args[@]}"} \
    "${pos_args[@]}" \
    --log-file ".kimi-play/out/godot.log" \
    -- --pilot-movie-fps "$FPS"
}

# 打包核心：物理帧区间 [A,B] → mp4。slow=慢放倍数，ff=快进倍数（同批帧按 N 倍帧率打包）。
_pack() {
  local A="$1" B="$2" slow="$3" ff="$4" wide="$5" out="$6"
  local obs="$DIR/out/obs.json" fm="$DIR/out/framemap.jsonl"
  [ -f "$obs" ] || { echo '{"error":"obs.json 不存在","hint":"先 run.sh start 并等到 turn>=1"}' >&2; exit 2; }
  [ -f "$fm" ] || { echo '{"error":"framemap.jsonl 不存在","hint":"尚未完成任何运行区间"}' >&2; exit 2; }
  local tps mfps
  tps=$(sed -n 's/.*"tps": *\([0-9][0-9]*\).*/\1/p' "$obs" | head -1)
  mfps=$(sed -n 's/.*"movie_fps": *\([0-9][0-9]*\).*/\1/p' "$obs" | head -1)
  tps="${tps:-60}"; mfps="${mfps:-$FPS}"
  local seg f0 p0 f1
  # 注意：JSON.stringify 按键名字典序输出，实际顺序为 f0,f1,p0
  seg=$(sed -n 's/.*"f0":\([0-9]*\),"f1":\([0-9]*\),"p0":\([0-9]*\).*/\1 \3 \2/p' "$fm" \
        | awk -v a="$A" -v b="$B" '$1<=a && $3>=b {print; exit}')
  if [ -z "$seg" ]; then
    echo '{"error":"区间不在任何单一运行段内","hint":"物理帧区间跨暂停段或超出范围；可用区间如下，请拆分段内区间再试"}' >&2
    cat "$fm" >&2
    exit 1
  fi
  read -r f0 p0 f1 <<< "$seg"
  local i0 i1 count
  i0=$(( p0 + (A - f0) * mfps / tps ))
  i1=$(( p0 + (B - f0) * mfps / tps ))
  count=$(( i1 - i0 + 1 ))
  # 编码器滞后：段尾 PNG 可能尚未落盘，等至多 ~3s（历史段早已冲刷，不会真等）
  local want tries=0
  want=$(printf '%s/out/frames/movie%08d.png' "$DIR" "$i1")
  while [ ! -f "$want" ] && [ "$tries" -lt 30 ]; do sleep 0.1; tries=$((tries+1)); done
  local vf="setpts=${slow}*PTS" fr=$(( mfps * ff ))
  [ "$wide" = 1 ] && vf="scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:black,setpts=${slow}*PTS"
  ffmpeg -y -framerate "$fr" -start_number "$i0" \
    -i "$DIR/out/frames/movie%08d.png" -frames:v "$count" \
    -vf "$vf" -c:v libx264 -preset veryfast -crf 20 -pix_fmt yuv420p \
    "$out" >/dev/null 2>&1
  echo "$out"
}

cmd_clip() {
  local A="$2" B="$3" slow=1 ff=1 wide=0
  shift 3 || true
  while [ $# -gt 0 ]; do
    case "$1" in
      --slow) slow="$2"; shift 2 ;;
      --ff) ff="$2"; shift 2 ;;
      --wide) wide=1; shift ;;
      *) shift ;;
    esac
  done
  _pack "$A" "$B" "$slow" "$ff" "$wide" "$DIR/out/clips/clip_${A}_${B}.mp4"
}

# clip-last：打包最近一个运行段（默认 --slow 2），固定输出地址 out/clips/last.mp4
cmd_clip_last() {
  local slow=2 ff=1 wide=0 proj=""
  shift 1  # 去掉 clip-last 本身
  while [ $# -gt 0 ]; do
    case "$1" in
      --slow) slow="$2"; shift 2 ;;
      --ff) ff="$2"; shift 2 ;;
      --wide) wide=1; shift ;;
      *) proj="$1"; shift ;;
    esac
  done
  if [ -n "$proj" ]; then PROJ_ARG="$proj"; DIR="$PROJ_ARG/.kimi-play"; fi
  local fm="$DIR/out/framemap.jsonl"
  [ -f "$fm" ] || { echo '{"error":"framemap.jsonl 不存在","hint":"先 run.sh start 并完成至少一个运行段"}' >&2; exit 2; }
  local last f0 f1
  last=$(tail -n 1 "$fm")
  f0=$(printf '%s' "$last" | sed -n 's/.*"f0":\([0-9]*\).*/\1/p')
  f1=$(printf '%s' "$last" | sed -n 's/.*"f1":\([0-9]*\).*/\1/p')
  if [ -z "$f0" ] || [ -z "$f1" ] || [ "$f1" -le "$f0" ]; then
    echo '{"error":"最后一个运行段为空或无法解析","hint":"先执行一个动作块再 clip-last"}' >&2
    exit 1
  fi
  _pack "$f0" "$((f1-1))" "$slow" "$ff" "$wide" "$DIR/out/clips/last.mp4"
}

case "$CMD" in
  start) cmd_start "$@" ;;
  clip)  cmd_clip "$@" ;;
  clip-last) cmd_clip_last "$@" ;;
esac
