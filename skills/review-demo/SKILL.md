---
name: review-demo
description: |
  人玩一遍、AI 来分析：用于"我玩给你看，你看看哪不对 / 我演示一下这个问题 / 看我这段操作为什么会死 / 帮我分析这段录像"等场景。真人接管游戏（manual 态），全程录像+遥测+输入日志，事后 AI 逐段复盘。装置细节查 godot-pilot-rig 手册。
metadata:
  version: "0.1.0"
---

# 人玩 AI 看（demo 复盘）

装置协议、命令、格式的细节一律查 **godot-pilot-rig** 手册；本卡只写流程与纪律。

## 流程

1. 确认装置已接入；确认 `.kimi-play/project.json` 的 `input_actions` 覆盖了用户要操作的动作（否则输入日志录不到）。
2. `run.sh start <proj> --visible` 后台启动（**必须 --visible**，用户要看窗口）。
3. 等 `obs.json` 到 `paused` → 写 `{"command":"manual"}` → 告诉用户：「可以玩了，我在录制；想停就说」。
4. 用户玩。期间可定时 `touch in/heartbeat`，并瞥一眼 `state.json` 确认 frame 在增长。
5. 用户说停 → 写 `{"command":"auto"}`（回暂停）→ 开始复盘：
   - `input_history.jsonl`：用户的操作时间线（`src=human` 的行：什么时候按了什么）；
   - `telemetry.jsonl`：数值异常点（位置卡死、血量突变、掉落）；
   - 对异常区间 `run.sh clip A B --slow 4` 慢放，用 ReadMediaFile 看因果。
6. 输出复盘报告：**一切结论引用帧号**（"f=1234 你按跳晚了吗？看遥测其实 f=1230 已经坠崖"——注入延迟与反应时滞都在数据里）。
7. 用户确认完毕 → `{"command":"quit"}`。

## 纪律

- 复盘顺序：先输入日志+遥测定位异常帧段，再剪视频——别上来就看长录像。
  需要通览长段 manual 录像时用 `clip A B --ff 4` 快扫，再对可疑段 `--slow 4` 细查。
- 用户描述的"我感觉"与数据不一致时，以遥测为准，用视频解释。
- 需要原地复现用户操作？input_history 就是一个 `at` 事件表，可作为大动作块回放（见手册）。
