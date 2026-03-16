# Free disk space on your Mac (for GTKWave install)

Your disk was nearly full (**48 MB free**), so `brew install --HEAD randomplum/gtkwave/gtkwave` failed. Free at least **2–5 GB** before retrying.

Run these in **Terminal** (safe, reversible).

---

## 1. Homebrew cleanup (often frees 1–10 GB)

```bash
# Remove downloaded bottles and old versions
brew cleanup -s

# See how much space Homebrew is using
brew list --versions | wc -l
du -sh $(brew --cache)
```

---

## 2. User caches (you have ~8 GB in Library/Caches)

```bash
# See cache sizes
du -sh ~/Library/Caches/* 2>/dev/null | sort -hr | head -20

# Safe to delete (they rebuild as needed):
rm -rf ~/Library/Caches/Homebrew
rm -rf ~/Library/Caches/pip
rm -rf ~/Library/Caches/Cursor
rm -rf ~/Library/Caches/npm
rm -rf ~/Library/Caches/yarn
```

---

## 3. Xcode / developer (if you use Xcode)

```bash
# Old device support and simulators (can be many GB)
du -sh ~/Library/Developer/Xcode/DerivedData
du -sh ~/Library/Developer/Xcode/iOS\ DeviceSupport

# Remove DerivedData (safe; Xcode will recreate)
rm -rf ~/Library/Developer/Xcode/DerivedData/*
```

---

## 4. Find large folders (see what’s using space)

```bash
# Top 15 largest dirs in your home folder
du -sh ~/* 2>/dev/null | sort -hr | head -15
```

---

## 5. After freeing space, retry GTKWave

```bash
df -h /
brew install --HEAD randomplum/gtkwave/gtkwave
```

---

## Optional: skip native GTKWave

If you prefer not to free space or install more software, use the **browser viewer**:

```bash
./run_gtkwave.sh
```

Then drag `sim/dump.vcd` onto https://vc.drom.io — no disk space or install needed.
