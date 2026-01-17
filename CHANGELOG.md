# Changelog

All notable changes to Plan Index Manager will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Project-based plan grouping
- Keyword quick search section
- Export to JSON/CSV formats
- Web-based INDEX viewer

## [1.0.0] - 2026-01-18

### Added
- Initial release
- Automatic INDEX.md generation from plans directory
- Bilingual support (English and Chinese)
- Smart metadata extraction (date, title, priority, status)
- PlanModeEnd hook integration
- Language switching via `--lang` flag
- Priority-based grouping (P0/P1/P2)
- Status detection (Completed/In Progress/Planning/Ongoing)
- Auto-installation script with prerequisite checks
- Template system for customizable INDEX format
- Configuration file for user preferences
- Comprehensive documentation (EN/ZH)

### Technical
- Bash 4.0+ compatible
- macOS and Linux support
- Error handling with `set -eo pipefail`
- Graceful fallback for missing templates
- Backup creation before modifying settings.json

## Release Notes

### v1.0.0 - Initial Release

This is the first public release of Plan Index Manager. It provides a solid foundation for automatically maintaining an organized index of Claude Code planning files.

**Key Features:**
- 🔄 Auto-sync on PlanModeEnd
- 🌍 Full bilingual support
- 📊 Smart metadata extraction
- 🎨 Customizable templates
- ⚙️ Easy installation

**Tested On:**
- macOS 14.x (Sonoma)
- macOS 13.x (Ventura)
- Bash 5.x

**Known Issues:**
- None reported yet

**Migration Notes:**
- First-time installation only
- No migration needed

---

[Unreleased]: https://github.com/flyzhenghao/plan-index-manager/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/flyzhenghao/plan-index-manager/releases/tag/v1.0.0
