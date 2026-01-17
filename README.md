# Plan Index Manager

[中文文档](./README_ZH.md)

> Automatically maintain an organized index of your Claude Code planning files

## 📖 Overview

Plan Index Manager is a Claude Code hook that automatically scans your `~/.claude/plans/` directory and generates a searchable `INDEX.md` file. Never manually update your plans index again!

### What It Does

- 📂 Scans all `.md` files in `~/.claude/plans/`
- 📊 Extracts metadata: date, title, priority (P0/P1/P2), status
- 📝 Generates a clean, sortable index table
- 🔄 Auto-updates when you exit Plan Mode
- 🌍 Supports English and Chinese templates

## ✨ Features

| Feature | Description |
|---------|-------------|
| **Auto-sync** | INDEX.md updates automatically on PlanModeEnd |
| **Bilingual** | Switch between English and Chinese templates |
| **Smart Extraction** | Auto-detects priority and status from content |
| **Priority Grouping** | Organizes plans by P0 (high), P1 (medium), P2 (low) |
| **Quick Search** | Find plans by keywords via Claude Code |
| **Manual Trigger** | Run sync script anytime manually |

## 🚀 Installation

### Quick Install

```bash
curl -fsSL https://raw.githubusercontent.com/flyzhenghao/plan-index-manager/main/install.sh | bash
```

### Manual Install

```bash
# Clone the repository
git clone https://github.com/flyzhenghao/plan-index-manager.git
cd plan-index-manager

# Run installer
bash install.sh
```

The installer will:
1. Copy scripts to `~/.claude/hooks/`
2. Add PlanModeEnd hook to `~/.claude/settings.json`
3. Create initial INDEX.md

## 📚 Usage

### Automatic Mode (Recommended)

Once installed, INDEX.md automatically updates when you:
- Exit Plan Mode in Claude Code
- The hook runs in the background (10s timeout)

### Manual Mode

```bash
# Sync all plans
bash ~/.claude/hooks/plans-sync.sh

# Switch to Chinese
bash ~/.claude/hooks/plans-sync.sh --lang zh

# Switch to English
bash ~/.claude/hooks/plans-sync.sh --lang en
```

### Querying Plans in Claude Code

After generating INDEX.md, you can ask Claude:

**English:**
- "Find plans about mobile UI"
- "Restore Plan: Authentication System"
- "Show me all P0 priority plans"

**中文:**
- "查询 Plan: 移动端优化"
- "恢复 Plan: 自动化工作流"
- "显示所有 P0 优先级的计划"

## ⚙️ Configuration

### Language Setting

Edit `~/.claude/hooks/plans-sync-config.sh`:

```bash
# Supported: en, zh
PLAN_INDEX_LANG="en"
```

Or use command line:
```bash
bash ~/.claude/hooks/plans-sync.sh --lang zh
```

### Metadata Detection Rules

The script automatically extracts metadata using these patterns:

| Field | Detection Method | Default |
|-------|------------------|---------|
| **Date** | File modification time | Current date |
| **Title** | First `# ` heading | "Untitled" |
| **Priority** | Searches for `P0`, `P1`, `P2` keywords | P1 |
| **Status** | Keywords: "completed", "in progress", "planning" | "Planning" |

**Priority Detection:**
- Searches for `**优先级**: P0`, `Priority: P1`, etc.
- Case-insensitive

**Status Detection:**
- "已完成" / "completed" / "done" → Completed
- "进行中" / "in progress" / "implementing" → In Progress
- "持续更新" / "ongoing" / "continuous" → Ongoing
- Default → Planning

## 📂 Generated INDEX.md Structure

```markdown
# Plans Index

> Last updated: 2026-01-18
> Purpose: Quick search and restore planning files

## How to Use

Ask Claude Code:
- "Find Plan: [keyword]" - Search related plans
- "Restore Plan: [title]" - Load complete plan

## Plan List

| Date | Title | Filename | Priority | Status |
|------|-------|----------|----------|--------|
| 2026-01-18 | Mobile UI Refactor | mobile-ui.md | P1 | In Progress |
| ... | ... | ... | ... | ... |

## By Priority

### P0 (High)
- Critical plans...

### P1 (Medium)
- Regular plans...

### P2 (Low)
- Nice-to-have plans...
```

## 🔧 Requirements

- [Claude Code](https://github.com/anthropics/claude-code) installed
- Bash 4.0+
- macOS or Linux

## 🛠️ Troubleshooting

### INDEX.md not updating

1. Check if PlanModeEnd hook is configured:
   ```bash
   grep -A 5 '"PlanModeEnd"' ~/.claude/settings.json
   ```

2. Run manually to see errors:
   ```bash
   bash ~/.claude/hooks/plans-sync.sh
   ```

### Wrong language in INDEX.md

```bash
# Check current language
cat ~/.claude/hooks/plans-sync-config.sh

# Change language
bash ~/.claude/hooks/plans-sync.sh --lang en
```

### Plans not detected

Ensure your plan files:
- Are located in `~/.claude/plans/`
- Have `.md` extension
- Contain at least one `# Title` heading

## 📜 License

MIT License - see [LICENSE](LICENSE) for details

## 🤝 Contributing

Contributions are welcome!

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 🙏 Acknowledgments

- Built for the [Claude Code](https://github.com/anthropics/claude-code) community
- Inspired by the need for better plan organization

## 📧 Support

- Open an [issue](https://github.com/flyzhenghao/plan-index-manager/issues)
- Join discussions in Claude Code community

---

Made with ❤️ by the Claude Code community
