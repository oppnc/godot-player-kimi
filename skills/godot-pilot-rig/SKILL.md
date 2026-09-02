---
name: godot-pilot-rig
description: |
  Godot 试玩装置（pilot）的完整参考手册：文件协议、run.sh 命令、move.json 动作块语法、obs/telemetry/framemap 产物格式、project.json 配置、已知特性与排障。当本仓库的 ai-playtest / review-demo 任一配方卡缺少细节时查阅本手册；当用户问"pilot 怎么用 / .kimi-play 是什么 / 怎么把试玩装置装进我的 Godot 项目"时直接使用本手册。
metadata:
  version: "0.1.0"
---

# Godot Pilot 装置手册

回合制试玩装置：游戏常态暂停等 AI，动作块注入输入，全程 PNG 序列录像 + 逐帧遥测。
装置 = `pilot.gd`（autoload 单文件）+ `run.sh`（运行器）。本文件是唯一权威参考；配方卡只写流程，细节以本手册为准。

## 接入新项目（setup）

1. 把 `pilot.gd` 拷进目标项目根目录（`res://pilot.gd`）。
2. `project.godot` 追加 autoload：
   ```ini
   [autoload]
   Pilot="*res://pilot.gd"
   ```
3. 建 `.kimi-play/project.json`（全部可选）：
   ```json
   {"player_path": "/root/Main/Player",
    "watch": ["position:x", "position:y", "hp"],
    "input_actions": ["move_left", "move_right", "jump", "shoot"]}
   ```
   - `player_path`：watch 字段的求值对象节点路径（用 `get_indexed` 取值，支持 `position:x` 这类子属性）。
   - `watch`：每帧追加进遥测的字段，键名为 `:` 后最后一段。
   - `input_actions`：manual 态要录制进输入日志的动作名；取项目 `project.godot` `[input]` 段里定义的动作。
4. 首次运行先 `godot --headless --import --path .`（run.sh start 会自动补，但手动先跑一次出错信息更清楚）。

**已接入项目升级装置**：用新版 `pilot.gd` 直接覆盖项目里的旧文件即可（配置与 autoload 不变）。
启动后 `godot.log` 第一行 `PILOT v… ready` 即版本号，与手册不一致时说明跑的是旧装置。

## 运行器 run.sh

| 命令 | 说明 |
|---|---|
| `run.sh start [proj] [--visible] [--fps N]` | 前台启动常驻进程（用后台任务托管）。默认窗口离屏（`--position 5000,5000`）；**人要看/要玩时必须 `--visible`**。fps 默认 30。启动清空上一局残留（会话契约：`in/` 指令心跳 + `out/` 的 frames/framemap/current.png——旧帧序号与旧段锚点会污染新局） |
| `run.sh clip <A> <B> [proj] [--slow N] [--ff N] [--wide]` | 把物理帧区间 [A,B] 打包成 mp4 到 `out/clips/`。A,B 必须落在 framemap 的**同一运行段**内，跨段会报错并列出可用段。`--slow N` 慢放 N 倍；`--ff N` 快进 N 倍（同批帧按 N 倍帧率打包，长块/赶路快扫用）；`--wide` 统一输出 1280×720 16:9（缩放+黑边填充，宣传片画幅用；`--resolution` 改不了 MovieWriter 尺寸，实测无效） |
| `run.sh clip-last [proj] [--slow N] [--ff N] [--wide]` | 打包**最近一个运行段**到固定地址 `out/clips/last.mp4`（每次覆盖，地址稳定），默认 `--slow 2`——每回合看「刚执行的块发生了什么」的默认入口，免 framemap 换算。段依据 = obs 的 `last_block` 字段 |

结束进程：写 `{"command":"quit"}` 到 move.json。不要直接杀进程（quit 才能干净 finalize 录像）。

## 状态机

```
warmup(0.5s 等效帧；60tps=30帧，120tps=60帧) → PAUSED ⇄ RUNNING-BLOCK
                  ↕  {"command":"manual"} / {"command":"auto"}
               MANUAL（真人接管：不暂停、遥测照录、输入日志开录、moves 被忽略）
```

任何状态下 `{"command":"quit"}` 都有效（MANUAL 态也能收指令）。

## move.json（动作块 schema v2）

写到 `.kimi-play/in/move.json`。**必须原子写入**：先写 `move.tmp` 再 `mv` 成 `move.json`；
读到半个 JSON 会被隔离为 `move.json.bad` 并在 obs 报错。

```json
{"moves": [
  {"hold": "move_right", "frames": 90},
  {"tap": "jump"},
  {"wait": 20},
  {"at": 10, "action": "shoot", "pressed": true}
],
 "speed": 4}
```

- `hold`：按住 frames 帧后松开（推进游标）。
- `tap`：点按（press，覆盖两个输入冲刷周期后 release——帧长按 tps/movie_fps 标定：60tps@30fps=6 帧、120tps@30fps=10 帧；不推进游标）。
- `wait`：什么都不按，推进游标 N 帧。
- `at`：原始相对帧事件（相对本块起点）。**回放整段输入磁带 = 一个大的 at 块**。
- **UI 点击**：`{"at":10,"click":[x,y]}`——在视口坐标 (x,y) 处点按；`"button":2` 右键、4/5 滚轮（默认左键）。
  ⚠️ 坐标空间在有 stretch/override 缩放的项目里与截图像素可能不一致（实测踩坑）——
  **菜单按钮的可靠方式是 `ui_dump` + `call`**，像素点击只用于已验证 1:1 的场景。
  第一人称游戏在 MOUSE_MODE_CAPTURED 下点击位置无关紧要（交互走准星射线），传视口中心即可。
- **物理按键**：`{"at":10,"key":"up"}` 点按（`"pressed":true/false` 可做单边沿）——
  适配 `_unhandled_input(event is InputEventKey)` 路线的游戏（动作系统之外的第三种输入）。
  注入时 keycode/physical_keycode 双写（同真实键盘），动作绑定用哪一种都能命中。
- **视角转动**：`{"at":5,"look":[dx,dy]}`——鼠标相对运动（dx>0 右转，dy>0 下移），
  适配 `MOUSE_MODE_CAPTURED` 读 `event.relative` 的第一人称/沙盒游戏。
- **通用原始事件（封闭类兜底）**：`{"at":0,"event":{"type":..., ...字段}}`。
  Godot 能吃的输入事件是封闭集合，此通道一次覆盖全部：
  `key` / `mouse_button` / `mouse_motion` / `joypad_button` / `joypad_motion` / `action` / `screen_touch` / `screen_drag` / `magnify_gesture` / `pan_gesture`。
  不覆盖 `InputEventMIDI`（音乐设备）与 `InputEventShortcut`（菜单快捷键匹配）——与玩游戏无关，需要时用 call 兜底。
  字段用引擎原生属性名（`pressed`/`button_index`/`axis`/`axis_value`/`relative`/`position`/`strength`…）；
  key 事件的 `keycode`/`physical_keycode` 可写键名串（如 `"w"`），`[x,y]` 数组自动转 Vector2，
  key 事件自动双写 keycode/physical_keycode。**上面的语法糖不够用时用它，不要改 pilot.gd**。
- **直接调用（兜底）**：`{"at":0,"call":"/root/SceneRouter","method":"start_game","args":[]}`——
  绕过 UI 直接触发业务逻辑；配合 ui_dump 的路径可 `method:"emit_signal", args:["pressed"]` 点按钮。
- `speed`（可选）：本块**局内执行倍速** 0.1–10，默认 1；块结束/被接管自动恢复。
  代价：物理 delta 变粗，跳跃/碰撞/卡位会失真——只用于跳过已知枯燥段（赶路、等计时器），
  精细操作验证必须 1x。
- 块长 = 游标终点与最远事件帧+1 的较大者（事件尾巴不会丢）；推进完毕自动暂停并写 obs（turn+1）。

## 新游戏输入适配（读代码，不改装置）

游戏侧消费输入的方式只有四种模式，`grep -rn "Input\.\|_unhandled_input\|_input(" --include="*.gd"` 即可归类，
然后直接选对应通道。**适配新游戏应只需要写 project.json 和动作块，永远不需要给 pilot.gd 加动作类型**
（事件类型已封闭覆盖；若真缺，用 `event` 兜底而不是新增语法糖）。

| 游戏代码长什么样 | 注入通道 |
|---|---|
| `Input.is_action_pressed("x")` / `get_axis` / `get_vector` | `hold`/`tap`/`at+action`（InputEventAction） |
| `Input.is_key_pressed(KEY_W)` / `is_physical_key_pressed` | `at+key`（带边沿的按键状态） |
| `_unhandled_input` / `_input` 里 match InputEventKey/MouseButton/MouseMotion | `at+key` / `click` / `look`（事件流） |
| Control/Button 等 GUI 控件 | `ui_dump` + `call emit_signal("pressed")`；已验证 1:1 时才用 `click` 像素 |

补充：模拟量输入（手柄摇杆 joypad_motion 等）用 `event` 通道；`Input.get_last_mouse_velocity`
等派生态由 motion 事件自然产生，无需特殊处理。

## 命令（任何状态可发）

| 命令 | 语义 |
|---|---|
| `{"command":"quit"}` | 结束进程（干净 finalize 录像） |
| `{"command":"manual"}` | 真人接管；**块执行中发它会立即打断**（松键、复速、解暂停） |
| `{"command":"auto"}` | 交还 AI，回到回合制暂停（manual 态或块执行中均可） |
| `{"command":"ui_dump"}` | UI 内省：可见按钮清单（text/路径/全局矩形）写到 `out/ui.json` |

## 产物（`.kimi-play/out/`）

| 文件 | 内容 |
|---|---|
| `obs.json` | 观察包：`status`（paused/manual/error）、`frame`、`turn`、`tps`、`movie_fps`、`viewport`、`current_frame_png`（**指向 `out/current.png`**：每次暂停钉存的当前画面副本，地址稳定、不随裁剪消失）、`last_block`（最近完成运行段 `{"f0","p0","f1"}`，`clip-last` 的段依据；尚未跑过运行段为 null）、各产物路径、`hint`（错误时的下一步指引） |
| `state.json` | `{frame, turn, status}` 最小状态 |
| `telemetry.jsonl` | 每物理帧一行：`{"f","turn", ...watch 字段}`。**数值真值以它为准** |
| `framemap.jsonl` | 运行段锚点 `{"f0","f1","p0"}`（JSON 键按字典序输出）：物理帧 [f0,f1) 从 PNG 序号 p0 起按 movie_fps/tps 线性映射。**暂停期 PNG 持续重复落盘，物理帧↔PNG 序号无固定比率，剪辑必须走此表**。每局 start 时清空重开（与遥测/磁带同生命周期） |
| `frames/movie%08d.png` | PNG 序列录像，进程存活即可读 |
| `input_history.jsonl` | 全程输入磁带 `{"f","action","pressed","src"}`（src=ai 注入 / human 真人）；**后悔/重开的原料**：quit → 重开 → 滤成大 at 块重放到目标帧 |
| `clips/` | run.sh clip 产物 |
| `godot.log` | 引擎日志（PILOT 前缀的行是装置日志） |

## 已知特性与排障

- **输入注入有 ~3 帧延迟**：不假设事件精确在第 N 帧生效；以遥测验证实际效果。
- 心跳：每回合往 `in/heartbeat` `touch` 一次；30 分钟未触活 pilot 自毁（防孤儿进程）。
- 暂停期 PNG 重复帧持续产生（~30/s），pilot 每 5s 裁剪旧帧只留最新一小窗——**引用画面一律用 `current.png`，不要引用 frames/ 里的具体序号**（可能已被裁掉）。
- **movie_fps 以运行器声明为准**：`--fixed-fps` 不落 ProjectSettings（4.7.2 实测该设置恒为默认 60，与录像实际帧率无关），run.sh start 经用户参数 `--pilot-movie-fps` 把 `--fps` 值显式传给 pilot；手动 godot 启动时以 `editor/movie_writer/fps` 兜底。movie_fps 一旦失真，clip 区间按比例错配（如 2 倍：成片前半运动、后半暂停静止帧）。
- clip / clip-last 内部会等段尾 PNG 冲刷落盘（至多 ~3s），暂停后立即可调，无需手工等待。
- obs 一直不出现/不更新 → 看 `godot.log` 里 PILOT 行；进程没了 → 后台任务日志。
- move.json 长时间不被消费 → 确认状态（paused 或 manual 才消费；running-block 中不消费）。
- 玩家冻结不动 → 多半是导入缓存缺失，重跑 `godot --headless --import --path .`。
- **clip 边界精度**：成片起点可能比请求区间晚 ~2 movie 帧（编码器滞后），不适用于抠单帧边界的场景。
- quit 时引擎可能报 `ObjectDB instances leaked` / `resources still in use` 警告——MovieWriter 收尾的引擎级噪音，exit 0、录像 finalize 完整，忽略即可。
