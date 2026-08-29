#!/usr/bin/env bash
# Kimi Pilot runner —— 回合制游玩管线（PLAY.md v0.2）
#
# 用法：
#   run.sh start [proj] [--visible] [--fps N]
#       前台启动常驻回合制游戏进程（调用方用后台任务托管其生命周期）；
#       --visible 窗口不离屏（人要看/要操作时用它），--fps 改录像帧率（默认 30）。
#       注意：--resolution 不能改 MovieWriter 尺寸（实测无效），宣传片画幅用 clip --wide
#   run.sh clip <A> <B> [proj] [--slow N] [--wide]
#       把物理帧区间 [A,B] 从 PNG 序列打包成 mp4；--slow N 慢放；
#       --wide 统一输出 1280x720 16:9（缩放+黑边填充，宣传片画幅用）
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
  -h|--help|"") usage 0 ;;
  *) echo "unknown command: $CMD" >&2; usage 3 ;;
esac

DIR="$PROJ_ARG/.kimi-play"

cmd_start() {
  local proj="." visible=0
  shift  # 去掉 start 本身
  while [ $# -gt 0 ]; do
    case "$1" in
      --visible) visible=1; shift ;;
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
  echo "run.sh: 启动常驻回合制进程（前台；请用后台任务托管）" >&2
  cd "$PROJ_ARG"
  exec godot --path . \
    --write-movie ".kimi-play/out/frames/movie.png" \
    --fixed-fps "$FPS" \
    "${pos_args[@]}" \
    --log-file ".kimi-play/out/godot.log"
}

cmd_clip() {
  local A="$2" B="$3" slow=1 wide=0
  shift 3 || true
  while [ $# -gt 0 ]; do
    case "$1" in
      --slow) slow="$2"; shift 2 ;;
      --wide) wide=1; shift ;;
      *) shift ;;
    esac
  done
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
  local out="$DIR/out/clips/clip_${A}_${B}.mp4"
  local vf="setpts=${slow}*PTS"
  [ "$wide" = 1 ] && vf="scale=1280:720:force_original_aspect_ratio=decrease,pad=1280:720:(ow-iw)/2:(oh-ih)/2:black,setpts=${slow}*PTS"
  ffmpeg -y -framerate "$mfps" -start_number "$i0" \
    -i "$DIR/out/frames/movie%08d.png" -frames:v "$count" \
    -vf "$vf" -c:v libx264 -preset veryfast -crf 20 -pix_fmt yuv420p \
    "$out" >/dev/null 2>&1
  echo "$out"
}

case "$CMD" in
  start) cmd_start "$@" ;;
  clip)  cmd_clip "$@" ;;
esac
