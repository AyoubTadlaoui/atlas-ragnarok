#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: 2026 Atlas Kaisar
# atlas-ragnarok screenshot helper — runs a sequence of "badass" terminal
# scenes you can capture for the README. Each scene is its own `clear`-ed
# screen so you can take separate shots without overlap.
#
# Usage:
#   bash scripts/demo.sh           # auto-advance every 4s
#   bash scripts/demo.sh manual    # press <enter> between scenes

set -u

MODE="${1:-auto}"
DELAY=4

step() {
    if [[ "$MODE" == "manual" ]]; then
        read -rp $'\n--- Press <enter> for next scene ---'
    else
        sleep "$DELAY"
    fi
}

# ─── Scene 1: shader source under bat (meta — theme rendering its own code) ──
clear
echo
echo "  ┌─[ scene 1/4 ] atlas-ragnarok.glsl  · rendered in its own palette"
echo
bat --paging=never --style=numbers,changes --theme=base16 atlas-ragnarok.glsl 2>/dev/null \
    || cat -n atlas-ragnarok.glsl
step

# ─── Scene 2: git graph (red/blue/yellow ref noise) ──────────────────────────
clear
echo
echo "  ┌─[ scene 2/4 ] git log --graph"
echo
git log --oneline --graph --all --decorate --color=always | head -40
step

# ─── Scene 3: fake build/test stream (errors + warnings + green pass) ─────────
clear
echo
echo "  ┌─[ scene 3/4 ] cargo-style build output"
echo
printf '\033[2;37m   Compiling\033[0m atlas-ragnarok v1.0.0 (~/atlas-ragnarok)\n'
sleep 0.2
printf '\033[1;34m    Checking\033[0m thunder_blue ... \033[1;32mok\033[0m\n'
sleep 0.1
printf '\033[1;34m    Checking\033[0m crimson_glow ... \033[1;32mok\033[0m\n'
sleep 0.1
printf '\033[1;33mwarning\033[0m: unused variable: `surtr_intensity`\n'
printf '   --> src/shader.glsl:42:9\n'
printf '    |\n'
printf '\033[1;34m 42  |\033[0m         float surtr_intensity = 0.85;\n'
printf '    |         \033[1;33m^^^^^^^^^^^^^^^^\033[0m \033[1;33mhelp:\033[0m if intentional, prefix with `_`\n'
sleep 0.2
printf '\033[1;34m    Checking\033[0m vignette_mask ... \033[1;32mok\033[0m\n'
sleep 0.1
printf '\033[1;31merror[E0308]\033[0m: mismatched types — expected `Fire`, found `Ice`\n'
printf '   --> src/ragnarok.rs:13:5\n'
sleep 0.2
printf '\033[1;32m    Finished\033[0m release [optimized] in 4.21s\n'
printf '\033[1;32m     Running\033[0m unittests src/lib.rs\n'
printf '\n'
printf 'running 5 tests\n'
printf 'test thunder::storm_breaks ... \033[1;32mok\033[0m\n'
printf 'test thunder::sky_cracks   ... \033[1;32mok\033[0m\n'
printf 'test fire::embers_glow     ... \033[1;32mok\033[0m\n'
printf 'test fire::pyre_consumes   ... \033[1;32mok\033[0m\n'
printf 'test core::black_holds     ... \033[1;32mok\033[0m\n'
printf '\n'
printf 'test result: \033[1;32mok\033[0m. 5 passed; 0 failed; 0 ignored\n'
step

# ─── Scene 4: tree + cat of the conf — the whole repo at a glance ────────────
clear
echo
echo "  ┌─[ scene 4/4 ] atlas-ragnarok at a glance"
echo
if command -v tree >/dev/null 2>&1; then
    tree -L 2 -C --noreport .
else
    find . -maxdepth 2 -not -path '*/.git*' | sort
fi
echo
echo "─── atlas-ragnarok.conf (palette section) ───"
grep -E '^(palette|background|foreground|cursor|selection)' atlas-ragnarok.conf
echo
