# Plan Index Manager

[English Documentation](./README.md)

> 自动维护 Claude Code 计划文件索引的工具

## 📖 概述

Plan Index Manager 是一个 Claude Code Hook，可以自动扫描 `~/.claude/plans/` 目录中的所有计划文件，并生成可搜索的 `INDEX.md` 索引文件。从此告别手动维护计划索引！

### 它能做什么

- 📂 扫描 `~/.claude/plans/` 中的所有 `.md` 文件
- 📊 提取元数据：日期、标题、优先级（P0/P1/P2）、状态
- 📝 生成清晰、可排序的索引表格
- 🔄 退出 Plan Mode 时自动更新
- 🌍 支持中英文模板

## ✨ 功能特性

| 功能 | 说明 |
|------|------|
| **自动同步** | 退出 Plan Mode 时 INDEX.md 自动更新 |
| **双语支持** | 支持中英文模板切换 |
| **智能提取** | 自动从内容中检测优先级和状态 |
| **优先级分组** | 按 P0（高）、P1（中）、P2（低）组织计划 |
| **快速搜索** | 通过 Claude Code 按关键词查找计划 |
| **手动触发** | 随时手动运行同步脚本 |

## 🚀 安装

### 快速安装

```bash
curl -fsSL https://raw.githubusercontent.com/flyzhenghao/plan-index-manager/main/install.sh | bash
```

### 手动安装

```bash
# 克隆仓库
git clone https://github.com/flyzhenghao/plan-index-manager.git
cd plan-index-manager

# 运行安装脚本
bash install.sh
```

安装程序会：
1. 复制脚本到 `~/.claude/hooks/`
2. 在 `~/.claude/settings.json` 中添加 PlanModeEnd Hook
3. 创建初始 INDEX.md

## 📚 使用方法

### 自动模式（推荐）

安装后，INDEX.md 会在以下情况自动更新：
- 在 Claude Code 中退出 Plan Mode 时
- Hook 在后台运行（超时时间 10 秒）

### 手动模式

```bash
# 同步所有计划
bash ~/.claude/hooks/plans-sync.sh

# 切换到中文
bash ~/.claude/hooks/plans-sync.sh --lang zh

# 切换到英文
bash ~/.claude/hooks/plans-sync.sh --lang en
```

### 在 Claude Code 中查询计划

生成 INDEX.md 后，你可以询问 Claude：

**中文：**
- "查询 Plan: 移动端优化"
- "恢复 Plan: 自动化工作流"
- "显示所有 P0 优先级的计划"

**English:**
- "Find plans about mobile UI"
- "Restore Plan: Authentication System"
- "Show me all P0 priority plans"

## ⚙️ 配置

### 语言设置

编辑 `~/.claude/hooks/plans-sync-config.sh`：

```bash
# 支持: en, zh
PLAN_INDEX_LANG="zh"
```

或使用命令行：
```bash
bash ~/.claude/hooks/plans-sync.sh --lang zh
```

### 元数据检测规则

脚本使用以下模式自动提取元数据：

| 字段 | 检测方法 | 默认值 |
|------|----------|--------|
| **日期** | 文件修改时间 | 当前日期 |
| **标题** | 第一个 `# ` 标题 | "Untitled" |
| **优先级** | 搜索 `P0`、`P1`、`P2` 关键词 | P1 |
| **状态** | 关键词："已完成"、"进行中"、"规划中" | "规划中" |

**优先级检测：**
- 搜索 `**优先级**: P0`、`Priority: P1` 等
- 不区分大小写

**状态检测：**
- "已完成" / "completed" / "done" → 已完成
- "进行中" / "in progress" / "implementing" → 进行中
- "持续更新" / "ongoing" / "continuous" → 持续更新
- 默认 → 规划中

## 📂 生成的 INDEX.md 结构

```markdown
# Plans 索引

> 最后更新: 2026-01-18
> 用途：快速查询和恢复计划文件

## 如何使用

在 Claude Code 中说：
- "查询 Plan: [关键词]" — 搜索相关计划
- "恢复 Plan: [标题]" — 读取完整计划

## 计划列表

| 日期 | 标题 | 文件名 | 优先级 | 状态 |
|------|------|--------|--------|------|
| 2026-01-18 | 移动端 UI 重构 | mobile-ui.md | P1 | 进行中 |
| ... | ... | ... | ... | ... |

## 按优先级查询

### P0（高优）
- 关键计划...

### P1（中优）
- 常规计划...

### P2（低优）
- 可选计划...
```

## 🔧 系统要求

- 已安装 [Claude Code](https://github.com/anthropics/claude-code)
- Bash 4.0+
- macOS 或 Linux

## 🛠️ 故障排查

### INDEX.md 没有更新

1. 检查 PlanModeEnd Hook 是否配置：
   ```bash
   grep -A 5 '"PlanModeEnd"' ~/.claude/settings.json
   ```

2. 手动运行查看错误：
   ```bash
   bash ~/.claude/hooks/plans-sync.sh
   ```

### INDEX.md 语言不对

```bash
# 查看当前语言设置
cat ~/.claude/hooks/plans-sync-config.sh

# 更改语言
bash ~/.claude/hooks/plans-sync.sh --lang zh
```

### 计划文件未被检测

确保你的计划文件：
- 位于 `~/.claude/plans/` 目录
- 文件扩展名为 `.md`
- 包含至少一个 `# 标题` 标题

## 📜 开源协议

MIT License - 详见 [LICENSE](LICENSE)

## 🤝 参与贡献

欢迎贡献！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 开启 Pull Request

## 🙏 致谢

- 为 [Claude Code](https://github.com/anthropics/claude-code) 社区打造
- 灵感来源于更好的计划组织需求

## 📧 支持

- 提交 [issue](https://github.com/flyzhenghao/plan-index-manager/issues)
- 加入 Claude Code 社区讨论

---

由 Claude Code 社区用 ❤️ 打造
