#!/bin/bash
# OMG Scaffolding Helper Script

TARGET_DIR=${1:-"."}
# The script is expected to be in templates/scripts/
# So templates/ is one level up
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 Initializing oh-my-gemini (OMG) in $TARGET_DIR..."

# 1. Create directory structure
mkdir -p "$TARGET_DIR/.gemini/agents"
mkdir -p "$TARGET_DIR/.gemini/skills/deep-interview/references"
mkdir -p "$TARGET_DIR/.gemini/skills/deep-interview/templates"

# 2. Copy Agents
cp "$SOURCE_DIR/agents/"*.md "$TARGET_DIR/.gemini/agents/"

# 3. Copy Deep Interview Skill
cp "$SOURCE_DIR/skills/deep-interview/SKILL.md" "$TARGET_DIR/.gemini/skills/deep-interview/"
cp "$SOURCE_DIR/skills/deep-interview/references/"*.md "$TARGET_DIR/.gemini/skills/deep-interview/references/"
cp "$SOURCE_DIR/skills/deep-interview/templates/"*.md "$TARGET_DIR/.gemini/skills/deep-interview/templates/"

# 4. Copy Documentation Templates to root
cp "$SOURCE_DIR/docs/GEMINI.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/docs/VISION.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/docs/MEMORY.md" "$TARGET_DIR/"

echo "✅ OMG Infrastructure deployed successfully!"
