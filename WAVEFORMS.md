# Viewing simulation waveforms (VCD) on macOS 14+

The default `brew install --cask gtkwave` installs an **old binary that does not run on macOS 14 or later** (“Update Required for gtkwave-bin”). Use one of the options below.

---

## Option A: GTKWave (native app) – macOS 14–compatible build

Uninstall the old cask if you had it, then install from the community tap:

```bash
brew uninstall --cask gtkwave   # if you had the old one
brew tap randomplum/gtkwave
brew install randomplum/gtkwave/gtkwave
```

Then run:

```bash
./run_gtkwave.sh
# or
gtkwave sim/dump.vcd
```

---

## Option B: Browser viewer (no install)

1. Run your simulation so the VCD exists:
   ```bash
   iverilog -o sim/mu0_sim src/mu0_core.v tb/mu0_tb.v && vvp sim/mu0_sim
   ```
2. Open **https://vc.drom.io** in your browser.
3. Drag and drop `sim/dump.vcd` onto the page (or use the site’s file open).
4. View and inspect the waveforms there.

No GTKWave or extra apps required; works on any OS with a browser.
