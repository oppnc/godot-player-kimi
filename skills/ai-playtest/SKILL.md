---
name: ai-playtest
description: |
  AI 自主回合制试玩 Godot 游戏：用于"帮我试玩 / 玩一下我的游戏 / 验证手感、数值、关卡能不能过 / 试玩找 bug"等场景。游戏常态暂停，AI 每回合看刚执行块的回放视频+遥测、写一个动作块推进。装置细节查 godot-pilot-rig 手册。
metadata:
  version: "0.1.0"
---

# AI 自主试玩（回合制）

装置协议、命令、格式的细节一律查 **godot-pilot-rig** 手册；本卡只写流程与纪律。

## 流程

1. 确认装置已接入（项目里有 `pilot.gd` + autoload 注册 + `.kimi-play/project.json`）。没有 → 按手册「接入新项目」先做。
2. `run.sh start <proj>` 用**后台任务**启动；轮询 `out/obs.json` 直到 `status=paused`（热身完毕）。
3. 每回合：
   - `touch .kimi-play/in/heartbeat`；
   - 读 `obs.json`（frame/turn/last_block）+ `telemetry.jsonl` 尾部（数值真值）；
   - **看刚执行的块（默认视频）**：`run.sh clip-last` 打包块回放（默认 --slow 2），用 ReadMediaFile 看 `out/clips/last.mp4`；菜单回合、读小字/精细像素时改看 `current.png`；
   - 决策一个动作块，**原子写入** `in/move.json`（先 `.tmp` 再 `mv`）；
   - 等 obs 的 `turn` 递增，核对实际结果（遥测+回放）与预期。
4. 目标达成或预算用尽 → `{"command":"quit"}`，汇总结论（引用帧号）。

## 人和 AI 一起玩（用户随时可插手）

机制上没有任何新东西，说一声就行：用户说「我来」→ 写 `{"command":"manual"}`
（块执行中也会立即打断）；用户说「你继续」→ 写 `{"command":"auto"}`。纪律只有三条：

- 一起玩时用 `run.sh start --visible` 启动，让用户看得到屏幕。
- 拿回控制权后先读 `input_history.jsonl` 尾部的 `src=human` 段——那些是人的操作，
  据此搞清局面再继续，别当没发生过。
- 这种玩法适合本来就回合制的游戏（棋牌、策略）；实时对战里人得陪着等 AI 思考，不现实。

## 纪律

- **块长即成本**：参考值 0.5–2 秒游戏时间（frames = 秒 × tps）。局面紧张/未知用短块，平淡赶路用长块。
- **观察载体：视频默认，图片看场景**。视频回答「刚才发生了什么」，图片回答「现在是什么状态」。每回合默认 `clip-last` 看块回放；以下场景用 `current.png` 就够：菜单/UI 导航、读小字或精细像素、棋类解谜等状态型游戏的静态局面。状态型游戏可整体降级为图片默认，但下方触发器命中仍要切视频。
- **强制升级视频**（任何场景适用）：遥测突变、死亡、结果与预期不符 → 对该区间 `clip A B --slow 4` 找因果。
- **token 预算**：常规回放 slow ≤2（每回合约 5–10k token）；slow 4–8 只给异常取证；长块 / speed>1 的枯燥块用 `clip-last --ff 4` 快扫（约 2–5k），别原速硬看。
- **遥测是真值，视频找因果**：两者不一致时信遥测，用视频解释为什么。
- 注入延迟 ~3 帧：别抠单帧时序，以遥测实测为准。
- 回合没有推进（turn 不变）→ 看 obs 的 `hint` 与 `godot.log`，不要重复发同一个 move。
- 随机 NPC/敌人：别开环赌行为，用短块+勤观察；记住你看到的是「这一次」的真实结果。
