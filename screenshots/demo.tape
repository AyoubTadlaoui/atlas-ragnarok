# vhs tape: animated demo of the atlas-ragnarok terminal theme.
#
# Drives scripts/demo.sh through vhs in `auto` mode with a 2-second
# delay between scenes (vs. demo.sh's 4s default). All 4 scenes
# render in a single take, themed via the inline palette below.
#
# Must be invoked from the repo root so scripts/demo.sh resolves:
#   vhs screenshots/demo.tape
# Or via screenshots/gen.sh which sets the cwd for you.

Output screenshots/_demo_raw.gif

Set Shell           "bash"
Set FontSize        14
Set Width           1300
Set Height          700
Set Padding         28
# No window chrome / margin — the demo should look like a real Ghostty
# session edge-to-edge so the shader-vignette overlay (added by gen.sh
# in post) sits flush over the whole canvas, just like the static hero.
# atlas-ragnarok — the very theme this demo is showcasing.
Set Theme           { "name": "atlas-ragnarok", "background": "#000000", "foreground": "#FFFFFF", "cursor": "#3B82F6", "selection": "#1E3A5F", "black": "#000000", "red": "#FF8080", "green": "#99FFE4", "yellow": "#2563EB", "blue": "#A0A0A0", "purple": "#3B82F6", "cyan": "#99FFE4", "white": "#FFFFFF", "brightBlack": "#505050", "brightRed": "#FF9999", "brightGreen": "#B3FFE4", "brightYellow": "#60A5FA", "brightBlue": "#B0B0B0", "brightPurple": "#93C5FD", "brightCyan": "#99FFE4", "brightWhite": "#FFFFFF" }
Set TypingSpeed     15ms
Set PlaybackSpeed   1.0
# 10 fps keeps file size small and Safari renders the WebP reliably.
Set Framerate       10

# Setup (hidden): tools on PATH, fresh screen.
Hide
Type 'export PATH="/opt/homebrew/bin:$PATH" && clear'
Enter
Sleep 200ms
Show

# Run the canonical demo. DELAY=1 keeps inter-scene transitions snappy
# so all 4 scenes fit in ~15s of recording.
Type 'DELAY=1 bash scripts/demo.sh auto'
Sleep 300ms
Enter
Sleep 15000ms
