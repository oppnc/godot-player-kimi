# AGENTS.md

给在本仓库工作的 AI agent 的指南。本仓库是 Kimi Code 的 Godot 插件，主线只有一条：
**让 AI 玩 Godot 游戏**（回合制试玩装置 pilot）；另有一个辅助的离线钉版文档包。
其余目录都是本地工作材料，不进 GitHub（见 `.gitignore`），也不要在它们身上改代码。

设计全貌（本地工作稿，已 gitignore、不进 GitHub；克隆来的仓库没有这三份，以 README 为准）：
`DESIGN.md`（全量设计）/ `PLAY.md`（玩游戏工作稿）/ `ROADMAP.md`（调研与 PoC 证据链）。
本文件只写"动手前必须知道"的部分。

## 目录地图

| 路径 | 是什么 | 进 GitHub |
|---|---|---|
| `kimi.plugin.json` | 插件清单 | ✅ |
| `skills/` | 4 个 skill（下详） | ✅ |
| `assets/pilot/` | 试玩装置：`pilot.gd` + `run.sh` | ✅ |
| `assets/docs/` | 钉版文档包（管线产物） | ✅ |
| `tools/` | 文档管线脚本（盲测题集 `docs_benchmark.md` 本地保留、不进 GitHub） | ✅ |
| `README.md` | 门面与对外叙事 | ✅ |
| `DESIGN.md` `PLAY.md` `ROADMAP.md` | 设计/调研工作稿（实测数字的证据链） | ❌ 本地保留 |
| `demo_project/` | M0 PoC 种子项目（`movie*.avi` 除外） | ✅ |
| `demos/` `experiments/` `showcase/` `test_videos/` | 官方 demo 克隆、实验项目、验证游戏、录像素材 | ❌ 本地 |
| `tools/.cache/` `tools/__pycache__/` | 管线缓存与 Python 缓存 | ❌ 本地 |

## 支柱一：文档包（辅助能力，别过度投入）

引擎 `doc/classes/*.xml` 是唯一权威结构化源，确定性转成 markdown、钉版、离线、Grep 即搜索
（不采 context7/rst/HTML 的实测依据见 ROADMAP §七）。它只是给"写码前查 API"兜底用的。

**铁律与管线**：

- `assets/docs/` 是**生成物，禁止手改**；一切修改改 `tools/convert_docs.py` 后重跑管线。
- 生成/同步：`bash tools/update_docs.sh [分支或tag]`（稀疏克隆缓存 → 转换 → DOCS_VERSION）。
  引擎升级时钉到**与本机引擎相同的 stable tag**（如 `4.7.2-stable`），不跟分支尖端。
- 每次重生成后必跑门禁：`python tools/test_docs.py --xml tools/.cache/godot/doc/classes`
  （结构 + 与源 XML 逐项对等 + 确定性），以及 `python tools/test_docs.py`（仅结构）。
- 换钉版后另跑 L3 盲测回归：题集与 gold 在 `tools/docs_benchmark.md`（本地保留、不进 GitHub；
  gold 从源 XML 独立提取；含负面题，回答"未找到"才算通过）。
- 输出格式约定：每个成员一行 `> ` 前缀签名行（`> method move_and_slide() -> bool`），
  供跨库 Grep；枚举/位域保留标注（`enum=` 剥前缀、`is_bitfield`→`BitField[...]`、
  `T[]`→`Array[T]`）；deprecated/experimental 空消息保留标记并补官方样板文案
  （类级与其他级别措辞不同，见 `convert_docs.py` 的 `_EMPTY_DEPRECATED`）。

## 支柱二：玩游戏（pilot 装置）

**为什么回合制**：通用 VLM 决策频率 0.07–0.3Hz，实时直玩已被业界证伪（差 1–2 个数量级）。
本装置的标准节奏是"游戏常态暂停、每个决策点等 AI"——学界（VideoGameBench-Lite、
Gemini Plays Pokémon）同款做法。AI 的四处先天缺陷各有组件补足：采样稀→慢放/逐帧重打包、
像素不准→逐帧遥测、无时间戳→HUD 帧号烧录、推理慢→暂停等待。亚秒级反应的缺口由
「反射规则」（AI 写条件触发规则、引擎每帧执行）兜底——已立项为解锁上限的关键件，格式后置。

**为什么通用、不用折腾**：输入只走官方可操作通道——`Input.parse_input_event` 注入
action / key（物理键码）/ click 三通道，`call` 兜底直调节点方法，`ui_dump` 内省菜单。
任何用标准输入的 Godot 游戏即插即玩，装置零依赖、单 autoload 文件 + bash 运行器。

**手册与配方卡的分工**：`skills/godot-pilot-rig/SKILL.md` 是唯一权威手册（文件协议、
move.json 语法、产物格式、排障）；`ai-playtest`（含人机一起玩纪律）/ `review-demo` 是薄配方卡，
只写状态流转与纪律，细节一律指向手册。**改协议先改手册**，配方卡跟随。

**实测踩平的坑（不要再踩）**：

- 命令行跑项目前必须 `godot --headless --import`，否则资源未导入、玩家完全冻结（run.sh 已前置）。
- 输入注入必须 `Input.parse_input_event`，不能用 `Input.action_press()`（带窗口录像时会被真实输入流清掉）。
- 输入生效有 ~3 帧延迟：编排以遥测为准，不假设事件精确在第 N 帧生效。
- 物理帧↔PNG 序号无固定比率（暂停期重复帧被裁剪）：一切以 `framemap.jsonl` 与 HUD 烧录为锚。
- `run.sh start` 的会话契约：清理上一局残留——`in/` 指令心跳 + `out/` 的 frames/framemap/current.png
  （旧帧序号与旧段锚点会污染新局，2026-08-29 QA 抓获）。

**明确不做**：实时直玩、编辑器 CRUD/dock UI（生态已有）、持久记忆、通用断言层
（判定由游戏自身机制承载——通关画面/计分板/死亡结算在视频里直接可见）。

## 工作纪律

- 文档与注释用中文，风格跟随现有 DESIGN/PLAY（密、直给、带实测数字）。
- 最小改动：只动任务涉及的文件；`assets/docs/` 例外地永不手改。
- 装置协议改动 = 改 `pilot.gd` + 手册 + 视情况改配方卡，三处同步。
- 验证手段：文档侧 `test_docs.py`；装置侧用 `experiments/` 或 `demo_project/` 实测，
  结论（含数字）回填 PLAY.md 对应小节。
