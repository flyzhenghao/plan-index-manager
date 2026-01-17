# Quick Start Guide

Get Plan Index Manager up and running in 2 minutes!

## ⚡ 30-Second Install

```bash
curl -fsSL https://raw.githubusercontent.com/flyzhenghao/plan-index-manager/main/install.sh | bash
```

That's it! INDEX.md will now auto-update when you exit Plan Mode.

## 🎯 5-Minute Setup

### Step 1: Install

```bash
# Download
git clone https://github.com/flyzhenghao/plan-index-manager.git
cd plan-index-manager

# Install
bash install.sh
```

### Step 2: Verify

```bash
# Check if installed
ls -l ~/.claude/hooks/plans-sync.sh

# Check configuration
cat ~/.claude/hooks/plans-sync-config.sh
```

### Step 3: First Sync

```bash
# Generate initial INDEX.md
bash ~/.claude/hooks/plans-sync.sh

# View result
cat ~/.claude/plans/INDEX.md
```

### Step 4: Test in Claude Code

Open Claude Code and ask:
```
查询 Plan: [any keyword]
```

## 🌍 Language Switching

### Switch to Chinese
```bash
bash ~/.claude/hooks/plans-sync.sh --lang zh
```

### Switch to English
```bash
bash ~/.claude/hooks/plans-sync.sh --lang en
```

## 📚 Next Steps

1. **Create Plans**: Add `.md` files to `~/.claude/plans/`
2. **Use Plan Mode**: Enter Plan Mode in Claude Code
3. **Auto-Update**: Exit Plan Mode → INDEX.md updates automatically
4. **Search**: Ask Claude to find or restore plans

## 🔧 Customization

### Change Plans Directory

Edit `~/.claude/hooks/plans-sync-config.sh`:
```bash
PLANS_DIR="/path/to/your/plans"
```

### Customize Template

Edit template files:
- English: `~/.claude/hooks/templates/INDEX.en.md`
- Chinese: `~/.claude/hooks/templates/INDEX.zh.md`

## ❓ Troubleshooting

### INDEX.md Not Updating?

```bash
# Test manually
bash ~/.claude/hooks/plans-sync.sh

# Check hook configuration
grep -A 5 '"PlanModeEnd"' ~/.claude/settings.json
```

### Wrong Language?

```bash
# Check current setting
cat ~/.claude/hooks/plans-sync-config.sh

# Force language
bash ~/.claude/hooks/plans-sync.sh --lang en
```

### Plans Not Detected?

Ensure your plan files:
- Are in `~/.claude/plans/` directory
- Have `.md` extension
- Contain a `# Title` heading

## 📖 Full Documentation

- [English README](README.md)
- [中文文档](README_ZH.md)
- [Contributing](CONTRIBUTING.md)

## 💡 Tips

1. **Consistent Naming**: Use descriptive filenames for plans
2. **Add Metadata**: Include priority markers in your plans
3. **Mark Status**: Add "completed" or "in progress" keywords
4. **Regular Sync**: Run manual sync if auto-sync seems slow

## 🎓 Example Plan File

Create `~/.claude/plans/my-project.md`:

```markdown
# My Awesome Project Implementation Plan

**Priority**: P1

## Status

In Progress

## Overview

This plan describes...

## Implementation Steps

1. Setup
2. Development
3. Testing

## Completion

- [ ] Feature A
- [x] Feature B
```

After saving, run:
```bash
bash ~/.claude/hooks/plans-sync.sh
```

Check `~/.claude/plans/INDEX.md` - your plan is now indexed!

---

Happy planning! 🚀
