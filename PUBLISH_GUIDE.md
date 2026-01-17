# Publishing Guide

Step-by-step guide to publish Plan Index Manager to GitHub.

## 📋 Pre-publish Checklist

Run the verification script:
```bash
bash scripts/verify-release.sh
```

Ensure all checks pass before proceeding.

## 🚀 Publishing Steps

### 1. Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `plan-index-manager`
3. Description: `Automatically maintain an organized index of your Claude Code planning files`
4. Public repository
5. **Do NOT** initialize with README (we already have one)
6. Click "Create repository"

### 2. Update Placeholders

Replace all `flyzhenghao` with your actual GitHub username:

```bash
# macOS
find . -type f -not -path "./.git/*" -exec sed -i '' 's/flyzhenghao/your-actual-username/g' {} +

# Linux
find . -type f -not -path "./.git/*" -exec sed -i 's/flyzhenghao/your-actual-username/g' {} +
```

Replace `your-actual-username` with your GitHub username.

### 3. Initialize Git Repository

```bash
cd ~/Documents/GitHub/plan-index-manager

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial release v1.0.0

- Automatic INDEX.md generation
- Bilingual support (EN/ZH)
- Smart metadata extraction
- PlanModeEnd hook integration
- Comprehensive documentation"

# Add remote
git remote add origin https://github.com/flyzhenghao/plan-index-manager.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### 4. Create Release

1. Go to repository page
2. Click "Releases" → "Create a new release"
3. Tag version: `v1.0.0`
4. Release title: `Plan Index Manager v1.0.0`
5. Description:
   ```markdown
   ## 🎉 Initial Release

   Plan Index Manager automatically maintains an organized index of your Claude Code planning files.

   ### ✨ Features
   - 🔄 Auto-sync on PlanModeEnd hook
   - 🌍 Bilingual support (English & Chinese)
   - 📊 Smart metadata extraction (date, title, priority, status)
   - 🎨 Customizable templates
   - ⚡ Easy one-line installation

   ### 📦 Installation

   ```bash
   curl -fsSL https://raw.githubusercontent.com/flyzhenghao/plan-index-manager/main/install.sh | bash
   ```

   ### 📚 Documentation
   - [English README](README.md)
   - [中文文档](README_ZH.md)
   - [Quick Start Guide](QUICKSTART.md)

   ### 🙏 Acknowledgments
   Built for the Claude Code community!
   ```

6. Click "Publish release"

### 5. Add Topics

1. Go to repository main page
2. Click "⚙️ Settings" (gear icon next to About)
3. Add topics:
   - `claude-code`
   - `automation`
   - `planning`
   - `hooks`
   - `bash`
   - `productivity`
   - `developer-tools`

### 6. Configure Repository Settings

**About Section:**
- Description: "Automatically maintain an organized index of your Claude Code planning files"
- Website: (optional) Link to documentation or demo
- Topics: Already added above

**Features:**
- ✅ Issues
- ✅ Discussions (optional, for community Q&A)
- ❌ Wiki (not needed, we have docs)
- ❌ Projects (not needed initially)

**Pages (Optional):**
- Can set up GitHub Pages for nicer documentation
- Settings → Pages → Source: Deploy from branch `main` → `/docs`

## 📢 Promotion

### Share With Community

1. **Claude Code Community**
   - Share in relevant forums/Discord/Slack
   - Mention: "New tool to auto-organize your plans!"

2. **Social Media**
   - Twitter/X with hashtags: #ClaudeCode #Productivity #DevTools
   - LinkedIn for professional network

3. **Reddit**
   - r/ClaudeCode (if exists)
   - r/productivity
   - r/commandline

### Sample Announcement

```markdown
🎉 Introducing Plan Index Manager!

Tired of manually updating your Claude Code plans index?

Plan Index Manager automatically:
✅ Scans your planning files
✅ Extracts metadata (priority, status, dates)
✅ Generates organized INDEX.md
✅ Updates on every Plan Mode exit
✅ Supports English & Chinese

One-line install:
curl -fsSL https://raw.githubusercontent.com/flyzhenghao/plan-index-manager/main/install.sh | bash

GitHub: https://github.com/flyzhenghao/plan-index-manager

Feedback welcome! 🚀
```

## 🔄 Post-Release

### Monitor Feedback

- Watch for issues
- Respond to questions promptly
- Consider feature requests

### First Update

When ready for v1.0.1:
1. Update CHANGELOG.md
2. Fix any reported issues
3. Tag new release: `v1.0.1`
4. Push updates

## 📊 Analytics (Optional)

Track adoption:
- GitHub stars
- Clone count (in Insights)
- Issue/discussion activity
- Fork count

## 🎯 Success Metrics

Consider the release successful when:
- [ ] 10+ stars
- [ ] 5+ successful installations (from issues/discussions)
- [ ] No critical bugs reported
- [ ] Positive community feedback

## 🆘 If Something Goes Wrong

### Broken Installation

1. Fix the issue immediately
2. Push fix to main
3. Update release notes with "Known Issues" section
4. Communicate in Issues

### Security Issue

1. Create security advisory (GitHub Security tab)
2. Fix in private branch
3. Release patch version ASAP
4. Notify users

## ✅ Final Verification

Before announcing:
```bash
# Clone fresh copy
git clone https://github.com/flyzhenghao/plan-index-manager.git /tmp/test-install
cd /tmp/test-install

# Test installation
bash install.sh

# Verify it works
bash ~/.claude/hooks/plans-sync.sh
```

If all works, you're ready to share! 🎉

---

Good luck with your release! 🚀
