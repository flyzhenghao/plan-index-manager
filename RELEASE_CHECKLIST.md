# Release Checklist

Before publishing to GitHub, ensure all items are checked:

## 📋 Pre-release

- [ ] All files are present and properly organized
- [ ] Scripts have executable permissions (`chmod +x`)
- [ ] README.md and README_ZH.md are in sync
- [ ] SKILL.md contains correct information
- [ ] License file is present (MIT)
- [ ] .gitignore is configured

## 🧪 Testing

- [ ] `install.sh` works on a clean system
- [ ] `plans-sync.sh` runs without errors
- [ ] English template generates correctly
- [ ] Chinese template generates correctly
- [ ] Language switching works (`--lang en/zh`)
- [ ] Hook configuration updates settings.json
- [ ] Metadata extraction works for all plan formats
- [ ] Priority detection (P0/P1/P2) works
- [ ] Status detection works

## 📚 Documentation

- [ ] README.md has correct GitHub URLs
- [ ] Installation instructions are clear
- [ ] Usage examples are accurate
- [ ] Screenshots/GIFs added (optional but recommended)
- [ ] CONTRIBUTING.md is complete
- [ ] All code comments are clear

## 🚀 GitHub Setup

- [ ] Create repository: `plan-index-manager`
- [ ] Add description: "Automatically maintain an organized index of your Claude Code planning files"
- [ ] Add topics: `claude-code`, `automation`, `planning`, `hooks`, `bash`
- [ ] Update all `flyzhenghao` placeholders with actual username
- [ ] Create initial release tag (v1.0.0)

## 📝 Post-release

- [ ] Test installation from GitHub URL
- [ ] Share in Claude Code community
- [ ] Monitor issues and feedback
- [ ] Update documentation based on feedback

## 🔄 Before Each Update

- [ ] Increment version number
- [ ] Update CHANGELOG.md
- [ ] Test on both macOS and Linux
- [ ] Update documentation if needed
- [ ] Create release notes
