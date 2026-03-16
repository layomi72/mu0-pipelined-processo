#!/usr/bin/env bash
# Safe cleanup to free ~6–8 GB. Caches rebuild automatically.
# Run from Terminal: bash safe_cleanup_commands.sh

set -e
echo "=== Before ==="
df -h / | grep -E '^/|Filesystem'

echo ""
echo "Cleaning caches (safe – apps will rebuild as needed)..."
# Skip Google if Chrome is running (permission denied); clear it from Chrome: Settings > Privacy > Clear data
rm -rf ~/Library/Caches/vscode-cpptools
rm -rf ~/Library/Caches/com.todesktop.230313mzl4w4u92.ShipIt
rm -rf ~/Library/Caches/ru.keepcoder.Telegram
rm -rf ~/Library/Caches/com.hnc.Discord.ShipIt
rm -rf ~/Library/Caches/pip

echo "Cleaning Xcode DerivedData (safe – Xcode recreates on next build)..."
rm -rf ~/Library/Developer/Xcode/DerivedData/*

echo ""
echo "=== After ==="
df -h / | grep -E '^/|Filesystem'
echo ""
echo "If you have 2–3 GB free, run: brew install --HEAD randomplum/gtkwave/gtkwave"
echo "Optional: remove OLD iOS simulators only: xcrun simctl delete unavailable"
