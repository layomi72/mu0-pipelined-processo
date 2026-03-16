#!/usr/bin/env bash
# Run this to see what's using space in ~/Library (safe, read-only)
echo "=== Top 20 largest folders in ~/Library ==="
du -sh ~/Library/* 2>/dev/null | sort -hr | head -20
echo ""
echo "=== Caches (often safe to delete) ==="
du -sh ~/Library/Caches/* 2>/dev/null | sort -hr | head -15
echo ""
echo "=== Developer (Xcode, simulators) ==="
du -sh ~/Library/Developer/* 2>/dev/null | sort -hr | head -10
echo ""
echo "=== Application Support (app data - be careful) ==="
du -sh ~/Library/Application\ Support/* 2>/dev/null | sort -hr | head -10
