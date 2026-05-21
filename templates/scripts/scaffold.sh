#!/bin/bash
# OMA Scaffolding Helper Script
set -euo pipefail

TARGET_DIR="${1:-"."}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 Initializing oh-my-antigravity (OMA) in $TARGET_DIR..."

# Check if target directory already has OMA/Antigravity folders
if [ -d "$TARGET_DIR/.antigravity" ] || [ -d "$TARGET_DIR/.agents" ]; then
    echo "⚠️ Warning: .antigravity or .agents already exists in $TARGET_DIR. Aborting to prevent accidental overwrites."
    exit 1
fi

# 1. Create directory structure
mkdir -p "$TARGET_DIR/.antigravity/agents"
mkdir -p "$TARGET_DIR/.agents/skills/deep-interview/references"
mkdir -p "$TARGET_DIR/.agents/skills/deep-interview/templates"

# 2. Copy Agents
cp "$SOURCE_DIR/agents/"*.md "$TARGET_DIR/.antigravity/agents/"

# 3. Copy Deep Interview Skill
cp "$SOURCE_DIR/skills/deep-interview/SKILL.md" "$TARGET_DIR/.agents/skills/deep-interview/"
cp "$SOURCE_DIR/skills/deep-interview/references/"*.md "$TARGET_DIR/.agents/skills/deep-interview/references/"
cp "$SOURCE_DIR/skills/deep-interview/templates/"*.md "$TARGET_DIR/.agents/skills/deep-interview/templates/"

# 4. Copy Documentation Templates to root
cp "$SOURCE_DIR/docs/GEMINI.md" "$TARGET_DIR/.antigravity.md"
cp "$SOURCE_DIR/docs/VISION.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/docs/MEMORY.md" "$TARGET_DIR/"

echo "✅ OMA Infrastructure deployed successfully!"
