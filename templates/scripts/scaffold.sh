#!/bin/bash
# OMA Scaffolding Helper Script
set -euo pipefail

TARGET_DIR="${1:-"."}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="$(dirname "$SCRIPT_DIR")"
REPO_ROOT="$(dirname "$SOURCE_DIR")"

echo "🚀 Initializing oh-my-antigravity (OMA) in $TARGET_DIR..."

# Check if target directory already has OMA/Antigravity folders
if [ -d "$TARGET_DIR/.antigravity" ] || [ -d "$TARGET_DIR/.agents" ]; then
    echo "⚠️ Warning: .antigravity or .agents already exists in $TARGET_DIR. Aborting to prevent accidental overwrites."
    exit 1
fi

# 1. Create directory structure
mkdir -p "$TARGET_DIR/.antigravity"
mkdir -p "$TARGET_DIR/.agents/skills"

# 2. Copy Agents to root
cp "$SOURCE_DIR/agents/"*.md "$TARGET_DIR/"

# 3. Copy Skills
cp -r "$REPO_ROOT/.agents/skills/"* "$TARGET_DIR/.agents/skills/"

# 4. Copy Documentation Templates to root
cp "$SOURCE_DIR/docs/GEMINI.md" "$TARGET_DIR/.antigravity.md"
cp "$SOURCE_DIR/docs/VISION.md" "$TARGET_DIR/"
cp "$SOURCE_DIR/docs/MEMORY.md" "$TARGET_DIR/"

echo "✅ OMA Infrastructure deployed successfully!"
