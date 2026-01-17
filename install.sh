#!/bin/bash
# Plan Index Manager - Installation Script

set -e

echo "📦 Plan Index Manager - Installation"
echo "===================================="
echo ""

# Detect language preference
detect_language() {
    if [[ "$LANG" == *"zh"* ]] || [[ "$LC_ALL" == *"zh"* ]]; then
        echo "zh"
    else
        echo "en"
    fi
}

DEFAULT_LANG=$(detect_language)

# Check prerequisites
check_prerequisites() {
    echo "🔍 Checking prerequisites..."

    # Check if Claude Code is installed
    if [[ ! -d "$HOME/.claude" ]]; then
        echo "❌ Error: Claude Code not found at ~/.claude/"
        echo "   Please install Claude Code first: https://github.com/anthropics/claude-code"
        exit 1
    fi

    # Check bash version
    if [[ "${BASH_VERSINFO[0]}" -lt 4 ]]; then
        echo "⚠️  Warning: Bash 4.0+ recommended (you have ${BASH_VERSION})"
    fi

    echo "✅ Prerequisites OK"
    echo ""
}

# Create directories
create_directories() {
    echo "📁 Creating directories..."

    mkdir -p "$HOME/.claude/hooks"
    mkdir -p "$HOME/.claude/hooks/templates"
    mkdir -p "$HOME/.claude/plans"

    echo "✅ Directories created"
    echo ""
}

# Copy files
copy_files() {
    echo "📋 Copying files..."

    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    # Copy main script
    cp "$script_dir/scripts/plans-sync.sh" "$HOME/.claude/hooks/plans-sync.sh"
    chmod +x "$HOME/.claude/hooks/plans-sync.sh"
    echo "  ✓ plans-sync.sh"

    # Copy templates
    cp "$script_dir/templates/INDEX.en.md" "$HOME/.claude/hooks/templates/INDEX.en.md"
    cp "$script_dir/templates/INDEX.zh.md" "$HOME/.claude/hooks/templates/INDEX.zh.md"
    echo "  ✓ Templates (en, zh)"

    # Create config file
    if [[ ! -f "$HOME/.claude/hooks/plans-sync-config.sh" ]]; then
        cat > "$HOME/.claude/hooks/plans-sync-config.sh" <<EOF
#!/bin/bash
# Plan Index Manager Configuration
PLAN_INDEX_LANG="$DEFAULT_LANG"
PLANS_DIR="\$HOME/.claude/plans"
EOF
        echo "  ✓ Configuration (language: $DEFAULT_LANG)"
    else
        echo "  ⏭  Configuration exists (skipped)"
    fi

    echo "✅ Files copied"
    echo ""
}

# Configure hook
configure_hook() {
    echo "⚙️  Configuring PlanModeEnd hook..."

    local settings_file="$HOME/.claude/settings.json"

    # Backup settings.json
    if [[ -f "$settings_file" ]]; then
        cp "$settings_file" "$settings_file.backup-$(date +%Y%m%d-%H%M%S)"
        echo "  ✓ Backup created"
    fi

    # Check if PlanModeEnd hook already exists
    if grep -q '"PlanModeEnd"' "$settings_file" 2>/dev/null; then
        # Check if plans-sync.sh is already in the hook
        if grep -q 'plans-sync.sh' "$settings_file"; then
            echo "  ⏭  Hook already configured (skipped)"
            return 0
        else
            echo "  ⚠️  PlanModeEnd hook exists but doesn't include plans-sync.sh"
            echo "  Please manually add to your settings.json:"
            echo '    {"type": "command", "command": "$HOME/.claude/hooks/plans-sync.sh", "timeout": 10000}'
            return 0
        fi
    fi

    # Check if settings.json exists and has hooks section
    if [[ ! -f "$settings_file" ]]; then
        # Create new settings.json
        cat > "$settings_file" <<'EOF'
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
EOF
        echo "  ✓ Created settings.json with PlanModeEnd hook"
    else
        # Add PlanModeEnd hook to existing settings.json
        # This is a simple approach - for complex JSON, consider using jq
        if grep -q '"hooks"' "$settings_file"; then
            # Hooks section exists, add PlanModeEnd
            echo "  ⚠️  Manual configuration required"
            echo "  Please add this to your settings.json hooks section:"
            cat <<'EOF'
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
EOF
        else
            echo "  ⚠️  No hooks section found in settings.json"
            echo "  Please manually add hooks configuration"
        fi
    fi

    echo "✅ Hook configuration completed"
    echo ""
}

# Generate initial INDEX.md
generate_initial_index() {
    echo "🔄 Generating initial INDEX.md..."

    if bash "$HOME/.claude/hooks/plans-sync.sh"; then
        echo "✅ Initial INDEX.md generated"
    else
        echo "⚠️  Failed to generate INDEX.md (you can run it manually later)"
    fi
    echo ""
}

# Print success message
print_success() {
    echo "✨ Installation completed!"
    echo ""
    echo "📚 Usage:"
    echo "  Automatic: INDEX.md updates when you exit Plan Mode"
    echo "  Manual:    bash ~/.claude/hooks/plans-sync.sh"
    echo ""
    echo "🌍 Language:"
    echo "  Current:   $DEFAULT_LANG"
    echo "  Switch:    bash ~/.claude/hooks/plans-sync.sh --lang [en|zh]"
    echo ""
    echo "📖 Documentation:"
    echo "  English:   README.md"
    echo "  中文:      README_ZH.md"
    echo ""
    echo "🎉 Enjoy organized planning with Claude Code!"
}

# Main installation flow
main() {
    check_prerequisites
    create_directories
    copy_files
    configure_hook
    generate_initial_index
    print_success
}

# Execute
main
