#!/usr/bin/env bash
# Launch a VCD waveform viewer. Use --browser to skip GTKWave and use the web viewer.
VCD="${1:-sim/dump.vcd}"
USE_BROWSER=false
for arg in "$@"; do
  [[ "$arg" == "--browser" ]] && USE_BROWSER=true && break
done
[[ "$1" == "--browser" ]] && VCD="${2:-sim/dump.vcd}"

if [[ ! -f "$VCD" ]]; then
  echo "VCD file not found: $VCD"
  echo "Run simulation first: iverilog -o sim/mu0_sim src/mu0_core.v tb/mu0_tb.v && vvp sim/mu0_sim"
  exit 1
fi

if [[ "$USE_BROWSER" == true ]] || ! command -v gtkwave &>/dev/null; then
  echo "Using browser viewer (no GTKWave needed)."
  echo "1. Browser will open to https://vc.drom.io"
  echo "2. Drag this file onto the page: $(cd "$(dirname "$VCD")" && pwd)/$(basename "$VCD")"
  echo ""
  open "https://vc.drom.io"
else
  open -a gtkwave --args "$VCD" 2>/dev/null || gtkwave "$VCD"
fi
