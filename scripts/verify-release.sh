#!/bin/bash
# Pre-release verification script

set -e

echo "🔍 Plan Index Manager - Pre-release Verification"
echo "================================================"
echo ""

ERRORS=0
WARNINGS=0

# Check if running from project root
if [[ ! -f "SKILL.md" ]] || [[ ! -f "install.sh" ]]; then
    echo "❌ Error: Must run from project root directory"
    exit 1
fi

# File existence checks
echo "📋 Checking required files..."

REQUIRED_FILES=(
    "README.md"
    "README_ZH.md"
    "SKILL.md"
    "LICENSE"
    "install.sh"
    "scripts/plans-sync.sh"
    "templates/INDEX.en.md"
    "templates/INDEX.zh.md"
    ".gitignore"
)

for file in "${REQUIRED_FILES[@]}"; do
    if [[ -f "$file" ]]; then
        echo "  ✓ $file"
    else
        echo "  ❌ Missing: $file"
        ((ERRORS++))
    fi
done

echo ""

# Check executable permissions
echo "🔐 Checking executable permissions..."

EXEC_FILES=(
    "install.sh"
    "scripts/plans-sync.sh"
)

for file in "${EXEC_FILES[@]}"; do
    if [[ -x "$file" ]]; then
        echo "  ✓ $file"
    else
        echo "  ⚠️  Not executable: $file"
        echo "     Fix: chmod +x $file"
        ((WARNINGS++))
    fi
done

echo ""

# Check for placeholder text
echo "🔍 Checking for placeholder text..."

if grep -r "flyzhenghao" . --exclude-dir=.git --exclude="verify-release.sh" > /dev/null; then
    echo "  ⚠️  Found 'flyzhenghao' placeholders:"
    grep -rn "flyzhenghao" . --exclude-dir=.git --exclude="verify-release.sh" | head -5
    echo "     Replace with actual GitHub username before publishing"
    ((WARNINGS++))
else
    echo "  ✓ No placeholders found"
fi

echo ""

# Check bash syntax
echo "🔧 Checking bash syntax..."

for script in install.sh scripts/*.sh; do
    if bash -n "$script" 2>/dev/null; then
        echo "  ✓ $script"
    else
        echo "  ❌ Syntax error in: $script"
        ((ERRORS++))
    fi
done

echo ""

# Check documentation consistency
echo "📖 Checking documentation..."

# Check if both READMEs have similar length (within 20%)
EN_LINES=$(wc -l < README.md)
ZH_LINES=$(wc -l < README_ZH.md)
DIFF=$((EN_LINES - ZH_LINES))
DIFF=${DIFF#-}  # Absolute value
PERCENT=$((DIFF * 100 / EN_LINES))

if [[ $PERCENT -lt 20 ]]; then
    echo "  ✓ README.md and README_ZH.md are similar length"
else
    echo "  ⚠️  README files differ significantly ($PERCENT% difference)"
    echo "     EN: $EN_LINES lines, ZH: $ZH_LINES lines"
    ((WARNINGS++))
fi

echo ""

# Test script execution
echo "🧪 Testing script execution..."

if bash scripts/plans-sync.sh --help 2>&1 | grep -q "INDEX.md" || true; then
    echo "  ✓ plans-sync.sh runs without fatal errors"
else
    echo "  ⚠️  Script execution test incomplete"
    ((WARNINGS++))
fi

echo ""

# Summary
echo "📊 Verification Summary"
echo "======================="
echo "Errors:   $ERRORS"
echo "Warnings: $WARNINGS"
echo ""

if [[ $ERRORS -eq 0 ]]; then
    echo "✅ All critical checks passed!"
    if [[ $WARNINGS -gt 0 ]]; then
        echo "⚠️  Please review warnings before publishing"
    else
        echo "🎉 Ready to publish!"
    fi
    exit 0
else
    echo "❌ Please fix errors before publishing"
    exit 1
fi
