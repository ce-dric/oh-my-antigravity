#!/bin/bash
# OMA Scaffolding Helper Script
set -euo pipefail

TARGET_DIR="${1:-"."}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(dirname "$SOURCE_DIR")"

echo "🚀 Initializing oh-my-antigravity (OMA) in $TARGET_DIR..."

# Check if target directory already has OMA/Antigravity folders or files
OVERWRITE_DETECTED=0
EXISTING_ITEMS=""

for item in ".antigravity" ".agents" ".antigravity.md" "VISION.md" "MEMORY.md"; do
    if [ -e "$TARGET_DIR/$item" ]; then
        OVERWRITE_DETECTED=1
        EXISTING_ITEMS="$EXISTING_ITEMS $item"
    fi
done

if [ "$OVERWRITE_DETECTED" -eq 1 ]; then
    echo "⚠️ Warning: The following items already exist in $TARGET_DIR: $EXISTING_ITEMS"
    echo "Aborting to prevent accidental overwrites."
    exit 1
fi

# 1. Create directory structure
mkdir -p "$TARGET_DIR/.antigravity"
mkdir -p "$TARGET_DIR/.agents/skills"

# 2. Copy Agents to root (with validation)
if ! ls "$SOURCE_DIR/agents/"*.md >/dev/null 2>&1; then
    echo "❌ Error: No agent .md files found in $SOURCE_DIR/agents/"
    exit 1
fi
cp "$SOURCE_DIR/agents/"*.md "$TARGET_DIR/"

# 3. Copy Skills (with validation)
if [ ! -d "$REPO_ROOT/.agents/skills" ] || [ -z "$(ls -A "$REPO_ROOT/.agents/skills" 2>/dev/null)" ]; then
    echo "❌ Error: Skill source directory $REPO_ROOT/.agents/skills is missing or empty."
    exit 1
fi
cp -r "$REPO_ROOT/.agents/skills/"* "$TARGET_DIR/.agents/skills/"

# 4. Copy Documentation Templates to root
cp "$SOURCE_DIR/docs/GEMINI.md" "$TARGET_DIR/.antigravity.md"
cp "$SOURCE_DIR/docs/VISION.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/docs/MEMORY.md" "$TARGET_DIR/"

echo "✅ OMA Infrastructure deployed successfully!"
