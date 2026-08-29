---
name: godot-docs
description: |
  查 Godot API / 类参考的本地文档包用法：三级查阅法（index.json 概览 → Grep 签名行 → Read 类文件）、版本不匹配时的在线版本化兜底、教程 how-to 的在线查法。当用户问 Godot API 用法、写 GDScript 需要核对类/方法/信号/常量定义，或需要确认某个属性默认值时使用；也用于写码前的"先查文档再动手"纪律。
metadata:
  version: "0.1.0"
---

# Godot 文档查询手册

内置钉版类参考包：**插件根目录 `assets/docs/`**（Godot 4.7，810 类，与引擎 XML 逐项一致——
方法/信号/常量/枚举/theme 项不缺项，这是与 context7 等 snippet 检索的本质区别）。
离线可用，零运行时依赖：**Grep 即搜索**。

## 三级查阅法（渐进披露，成本纪律）

按顺序升级，能浅不深——每深入一级上下文成本上一个台阶：

1. **概览**：读 `assets/docs/index.json`（类名 / 继承 / 一句话简介），
   或直接 `grep -i <关键词> assets/docs/index.json`。回答"该用哪个类"。
2. **签名**：全类库签名行检索。每个成员有一行 `> ` 前缀的定义行，一条正则命中：
   `grep -rn '^> method .*move' assets/docs/classes/`
   类别词：`class / inherits / property / constructor / method / operator / signal /
   enum / enum_value / constant / annotation / theme_property`。
   回答"有没有这个成员、参数和默认值是什么"。
3. **全文**：`Read assets/docs/classes/<类名小写>.md`（如 `characterbody2d.md`，
   `@GlobalScope` → `@globalscope.md`）。签名行正下方即完整描述。
   回答"语义、边界、注意事项"。

## 纪律

- **写码前先查**：GDScript 训练语料稀薄，凭记忆写 API 易幻觉；核对签名后再写。
- 写完用 `godot --headless --check-only --script x.gd` 自检（引擎自带，不依赖文档包）。
- 引用文档结论时以文档包为准；记忆与文档冲突时信文档。

## 版本不匹配

`index.json` 的 `godot_version`（当前 4.7，钉版见 `DOCS_VERSION`）与目标项目的
`project.godot` 版本差异显著时，类参考降级到在线版本化页面：
`https://docs.godotengine.org/en/<版本>/classes/class_<类名小写>.html`
（FetchURL 正文抽取质量良好）。

## 教程与 how-to（不打包）

类参考之外的教程/指南查询低频，走在线版本化：先 WebSearch
`site:docs.godotengine.org <主题>` 定位页面，再 FetchURL 对应版本路径
（`/en/stable/` 与 `/en/<版本>/` 均可达）。

## context7 / find-docs 等检索工具

检测到可用时可作**示例补充**，但其返回的是 ranked snippets（节选）：
方法/信号/常量可能整体缺失，来源不可核对，版本钉不住，有配额限制。
**不得作为 API 完整性的依据**；完整性问题只能信本文档包或官方版本化页面。
