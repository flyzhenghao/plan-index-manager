# Plan Index Manager - Project Summary

## 📁 Project Structure

```
plan-index-manager/
├── README.md                 # English documentation
├── README_ZH.md              # Chinese documentation
├── SKILL.md                  # Claude Code skill metadata
├── LICENSE                   # MIT License
├── CONTRIBUTING.md           # Contribution guidelines
├── RELEASE_CHECKLIST.md      # Pre-release verification
├── .gitignore               # Git ignore rules
├── install.sh               # Installation script (executable)
│
├── scripts/
│   ├── config.sh            # Default configuration template
│   └── plans-sync.sh        # Core synchronization script (executable)
│
└── templates/
    ├── INDEX.en.md          # English INDEX.md template
    └── INDEX.zh.md          # Chinese INDEX.md template
```

## 🎯 Core Features

### 1. Automatic Synchronization
- Triggered by PlanModeEnd hook
- Scans all `~/.claude/plans/*.md` files
- Generates organized INDEX.md

### 2. Metadata Extraction
- **Date**: File modification time
- **Title**: First `# ` heading (auto-strips "Peer Review Report:")
- **Priority**: Detects P0/P1/P2 from content
- **Status**: Completed / In Progress / Planning / Ongoing

### 3. Bilingual Support
- English and Chinese templates
- Runtime language switching via `--lang` flag
- Auto-detects system language on install
- Localized strings for all UI elements

### 4. Smart Organization
- Chronological table (newest first)
- Priority-based grouping (P0/P1/P2)
- Automatic "More..." truncation for readability

## 🔧 Technical Details

### Language Detection
```bash
# Auto-detects from system locale
if [[ "$LANG" == *"zh"* ]] || [[ "$LC_ALL" == *"zh"* ]]; then
    DEFAULT_LANG="zh"
else
    DEFAULT_LANG="en"
fi
```

### Configuration File
Located at: `~/.claude/hooks/plans-sync-config.sh`
```bash
PLAN_INDEX_LANG="en"  # or "zh"
PLANS_DIR="$HOME/.claude/plans"
```

### Hook Configuration
Added to `~/.claude/settings.json`:
```json
{
  "hooks": {
    "PlanModeEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/plans-sync.sh",
            "timeout": 10000
          }
        ]
      }
    ]
  }
}
```

## 📊 Installation Flow

1. **Check Prerequisites**
   - Verify Claude Code installed
   - Check Bash version (4.0+)

2. **Create Directories**
   - `~/.claude/hooks/`
   - `~/.claude/hooks/templates/`
   - `~/.claude/plans/`

3. **Copy Files**
   - `plans-sync.sh` → `~/.claude/hooks/`
   - Templates → `~/.claude/hooks/templates/`
   - Create config with detected language

4. **Configure Hook**
   - Backup existing settings.json
   - Add PlanModeEnd hook configuration
   - Validate JSON syntax

5. **Generate Initial INDEX**
   - Run sync script once
   - Create initial INDEX.md

## 🌍 Supported Languages

### Current
- **English** (en)
- **Chinese** (zh)

### Adding New Languages

1. Create template: `templates/INDEX.{code}.md`
2. Add strings to `scripts/plans-sync.sh`:
   ```bash
   elif [[ "$PLAN_INDEX_LANG" == "fr" ]]; then
       L_PRIORITY_HIGH="P0 (Élevé)"
       L_PRIORITY_MED="P1 (Moyen)"
       # ... other strings
   ```
3. Update docs

## 🧪 Testing Scenarios

### Basic Functionality
- [x] Extract metadata from standard plan
- [x] Extract metadata from "Peer Review Report"
- [x] Detect P0/P1/P2 priorities
- [x] Detect completion status
- [x] Handle empty plans directory
- [x] Handle malformed plan files

### Language Switching
- [x] English template generation
- [x] Chinese template generation
- [x] Switch en → zh
- [x] Switch zh → en
- [x] Config persistence

### Installation
- [x] Fresh install
- [x] Upgrade existing install
- [x] Hook conflict detection
- [x] Permission issues

## 📈 Future Enhancements

### Potential Features
- [ ] Project-based plan grouping
- [ ] Keyword-based quick search section
- [ ] Timeline visualization
- [ ] Export to other formats (JSON, CSV)
- [ ] Web-based INDEX viewer
- [ ] Integration with GitHub Projects

### Community Contributions
- [ ] Additional language templates
- [ ] Custom metadata fields
- [ ] Alternative sorting options
- [ ] Plan archiving support

## 🐛 Known Limitations

1. **JSON Manipulation**: Uses sed for simple cases; complex settings.json may need manual configuration
2. **macOS-specific**: `stat -f` command differs on Linux (uses `stat -c` instead)
3. **Template Override**: Templates in repo take precedence over user customization

## 📞 Support Channels

- GitHub Issues: Bug reports and feature requests
- Discussions: Questions and community support
- Pull Requests: Code contributions

## 📜 License

MIT License - Free to use, modify, and distribute

## 👥 Target Users

- Claude Code users who create planning documents
- Teams collaborating on plans
- Anyone needing organized plan management
- Developers automating workflows

## 🎓 Learning Resources

For contributors:
- [Bash scripting guide](https://www.gnu.org/software/bash/manual/)
- [Claude Code hooks documentation](https://github.com/anthropics/claude-code)
- [Semantic versioning](https://semver.org/)

---

Created: 2026-01-18
Version: 1.0.0
Maintainer: Claude Code Community
