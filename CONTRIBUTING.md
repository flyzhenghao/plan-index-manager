# Contributing to Plan Index Manager

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

## 🐛 Reporting Bugs

Before creating bug reports, please check the [existing issues](https://github.com/flyzhenghao/plan-index-manager/issues) to avoid duplicates.

When filing a bug report, include:
- Your OS and Bash version
- Claude Code version
- Steps to reproduce
- Expected vs actual behavior
- Relevant logs or screenshots

## 💡 Suggesting Features

Feature suggestions are welcome! Please:
- Check if the feature already exists or has been suggested
- Clearly describe the use case
- Explain how it would benefit users

## 🔧 Development Setup

```bash
# Clone the repo
git clone https://github.com/flyzhenghao/plan-index-manager.git
cd plan-index-manager

# Test the script
bash scripts/plans-sync.sh

# Test installation (use a test directory)
CLAUDE_HOME=/tmp/test-claude bash install.sh
```

## 📝 Code Guidelines

### Shell Scripts

- Use `#!/bin/bash` shebang
- Set `set -eo pipefail` for error handling
- Add comments for complex logic
- Use meaningful variable names
- Quote variables to prevent word splitting

### Testing

Before submitting:
- Test on macOS and Linux if possible
- Test both English and Chinese templates
- Verify install.sh works on a clean system
- Check that hooks are correctly configured

## 🌍 Adding Language Support

To add a new language:

1. Create template: `templates/INDEX.{lang_code}.md`
2. Add localization strings to `scripts/plans-sync.sh`:
   ```bash
   elif [[ "$PLAN_INDEX_LANG" == "fr" ]]; then
       L_PRIORITY_HIGH="P0 (Élevé)"
       # ... other strings
   ```
3. Update documentation in README.md
4. Test the new template

## 📚 Documentation

- Keep README.md and README_ZH.md in sync
- Update SKILL.md if adding new features
- Add examples for complex features

## 🔀 Pull Request Process

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Test thoroughly
5. Commit with clear messages: `git commit -m "Add: amazing feature"`
6. Push to your fork: `git push origin feature/amazing-feature`
7. Open a Pull Request

### Commit Message Format

- `Add: new feature`
- `Fix: bug description`
- `Docs: documentation update`
- `Refactor: code improvement`
- `Test: add tests`

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## ❓ Questions

Feel free to open an issue or discussion if you have questions!
