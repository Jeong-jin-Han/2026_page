#!/bin/bash
set -e

VAULT="/media/hanjeongjin/T7/Workspace/Obsidian/2026_vault"
QUARTZ="/home/hanjeongjin/Workspace_ubuntu/Obsidian/2026_page"

echo "==> Pushing vault changes..."
cd "$VAULT"
git add .
git commit -m "update notes $(date '+%Y-%m-%d %H:%M')" || echo "Nothing to commit in vault"
git push

echo "==> Updating submodule in quartz..."
cd "$QUARTZ"
git submodule update --remote content
git add content
git commit -m "update content $(date '+%Y-%m-%d %H:%M')" || echo "Nothing to commit in quartz"
git push origin v4

echo "==> Done! Site will redeploy shortly."
