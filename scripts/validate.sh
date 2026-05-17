#!/usr/bin/env bash
# Validate that every theme file declares all 16 ANSI palette slots
# and that every color is a valid 6-digit hex code.
#
# Used by the GitHub Actions workflow at .github/workflows/validate.yml.
# Run locally with `bash scripts/validate.sh`.

set -euo pipefail

fail=0
pass() { printf "  \033[32m✓\033[0m %s\n" "$1"; }
warn() { printf "  \033[31m✗\033[0m %s\n" "$1"; fail=1; }

check_hex() {
    # Accepts #rrggbb or "#rrggbb" (case-insensitive)
    [[ "$1" =~ ^#[0-9a-fA-F]{6}$ ]]
}

# ─── Ghostty conf ────────────────────────────────────────────────
echo "Validating atlas-ragnarok.conf..."
conf="atlas-ragnarok.conf"
[[ -f "$conf" ]] || { warn "$conf missing"; exit 1; }

for i in $(seq 0 15); do
    line=$(grep -E "^palette = ${i}=" "$conf" | head -1 || true)
    if [[ -z "$line" ]]; then
        warn "palette slot ${i} missing in $conf"
        continue
    fi
    hex=$(echo "$line" | sed -E "s/^palette = ${i}=//")
    if check_hex "$hex"; then
        pass "palette ${i} = ${hex}"
    else
        warn "palette ${i} invalid hex: ${hex}"
    fi
done

for key in background foreground cursor-color selection-background; do
    line=$(grep -E "^${key} = " "$conf" | head -1 || true)
    if [[ -z "$line" ]]; then
        warn "${key} missing in $conf"
        continue
    fi
    hex=$(echo "$line" | sed -E "s/^${key} = //")
    if check_hex "$hex"; then
        pass "${key} = ${hex}"
    else
        warn "${key} invalid hex: ${hex}"
    fi
done

# ─── Shader ──────────────────────────────────────────────────────
echo
echo "Validating atlas-ragnarok.glsl..."
glsl="atlas-ragnarok.glsl"
[[ -f "$glsl" ]] || { warn "$glsl missing"; exit 1; }

if grep -q "void mainImage(" "$glsl"; then
    pass "void mainImage() entry point present"
else
    warn "void mainImage() entry point missing"
fi

if grep -q "fragColor" "$glsl"; then
    pass "fragColor output present"
else
    warn "fragColor output missing"
fi

# ─── Port files (Alacritty / Kitty / WezTerm / iTerm2 / Windows Terminal) ──
echo
echo "Validating themes/* ports exist..."
for port in themes/alacritty.toml themes/kitty.conf themes/wezterm.lua themes/iterm2.itermcolors themes/windows-terminal.json; do
    if [[ -f "$port" ]]; then
        pass "$port present"
    else
        warn "$port missing"
    fi
done

echo
if [[ $fail -eq 0 ]]; then
    echo -e "\033[32mAll checks passed.\033[0m"
    exit 0
else
    echo -e "\033[31mValidation failed.\033[0m"
    exit 1
fi
