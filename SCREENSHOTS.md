# Screenshots & Examples

> Note: Add actual screenshots before publishing to GitHub

## 📸 Recommended Screenshots

### 1. Generated INDEX.md (English)
**File**: `screenshots/index-en.png`
- Show the generated INDEX.md in a markdown viewer
- Highlight the table with plans
- Show priority grouping section

### 2. Generated INDEX.md (Chinese)
**File**: `screenshots/index-zh.png`
- Same as above but in Chinese
- Demonstrates bilingual support

### 3. Installation Process
**File**: `screenshots/install.png`
- Terminal showing successful installation
- Highlight the success message

### 4. Claude Code Integration
**File**: `screenshots/claude-integration.png`
- Show Claude Code using the INDEX
- Example query: "Find Plan: mobile UI"

### 5. Settings Configuration
**File**: `screenshots/settings.png`
- Show settings.json with PlanModeEnd hook

## 📝 Example Output

### English INDEX.md

```markdown
# Plans Index

> Last updated: 2026-01-18
> Purpose: Quick search and restore planning files

## Plan List

| Date | Title | Filename | Priority | Status |
|------|------|----------|----------|--------|
| 2026-01-18 | Mobile UI Refactor | mobile-ui.md | P1 | In Progress |
| 2026-01-17 | Authentication System | auth-system.md | P0 | Completed |
| 2026-01-15 | Database Migration | db-migration.md | P2 | Planning |

## By Priority

### P0 (High)
- Authentication System

### P1 (Medium)
- Mobile UI Refactor
- More...

### P2 (Low)
- Database Migration
- More...
```

### Chinese INDEX.md

```markdown
# Plans 索引

> 最后更新: 2026-01-18
> 用途：快速查询和恢复计划文件

## 计划列表

| 日期 | 标题 | 文件名 | 优先级 | 状态 |
|------|------|--------|--------|------|
| 2026-01-18 | 移动端 UI 重构 | mobile-ui.md | P1 | 进行中 |
| 2026-01-17 | 认证系统 | auth-system.md | P0 | 已完成 |
| 2026-01-15 | 数据库迁移 | db-migration.md | P2 | 规划中 |

## 按优先级查询

### P0（高优）
- 认证系统

### P1（中优）
- 移动端 UI 重构
- 更多...

### P2（低优）
- 数据库迁移
- 更多...
```

## 🎬 Demo GIF Ideas

1. **Quick Install**
   - Show: `curl -fsSL ... | bash`
   - Installation progress
   - Success message

2. **Language Switching**
   - Run: `bash ~/.claude/hooks/plans-sync.sh --lang zh`
   - Show INDEX.md updating to Chinese

3. **Auto-Sync Demo**
   - Create a new plan in Plan Mode
   - Exit Plan Mode
   - Show INDEX.md automatically updated

## 📋 How to Capture Screenshots

### macOS
```bash
# Full screen
cmd + shift + 3

# Selected area
cmd + shift + 4

# Window
cmd + shift + 4, then space
```

### Creating GIFs
Tools:
- [Kap](https://getkap.co/) - Free, open-source
- [LICEcap](https://www.cockos.com/licecap/) - Simple and lightweight
- [ScreenToGif](https://www.screentogif.com/) - Windows

## 📐 Image Guidelines

- **Format**: PNG for screenshots, GIF for demos
- **Size**: Max 1920x1080, optimize for GitHub
- **Naming**: Descriptive names (e.g., `index-english-example.png`)
- **Alt text**: Add descriptive alt text in markdown
- **Compression**: Use tools like TinyPNG to reduce size

## 🔗 Adding to README

```markdown
## Screenshots

### English INDEX
![English INDEX example](screenshots/index-en.png)

### Chinese INDEX
![Chinese INDEX example](screenshots/index-zh.png)

### Installation
![Installation demo](screenshots/install.gif)
```
