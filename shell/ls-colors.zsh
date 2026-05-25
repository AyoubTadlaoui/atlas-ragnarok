# atlas-ragnarok :: ls / gls colors (LS_COLORS)
# Tech-blue thunder above, crimson fire below, peppermint accents.
# https://github.com/AyoubTadlaoui/atlas-ragnarok
#
# Colors are 24-bit truecolor hex (38;2;R;G;B foreground, 48;2;R;G;B background)
# so hues match the palette exactly. The palette deliberately remaps the 16
# ANSI slots (blue->gray, magenta->thunder), so slot indices would mislead;
# truecolor sidesteps that. Hex values come straight from editors/palette.json:
#   thunder       #3b82f6 = 59;130;246    thunder_bright #60a5fa = 96;165;250
#   thunder_pale  #93c5fd = 147;197;253   thunder_deep   #2563eb = 37;99;235
#   peppermint    #99ffe4 = 153;255;228   peppermint_alt #b3ffe4 = 179;255;228
#   crimson       #ff8080 = 255;128;128   crimson_alt    #ff9999 = 255;153;153
#   crimson_deep  #380404 = 56;4;4        bg_selection   #1e3a5f = 30;58;95
#   gray          #a0a0a0 = 160;160;160   gray_alt       #b0b0b0 = 176;176;176
#
# Needs GNU coreutils ls. macOS default ls is BSD and ignores LS_COLORS:
#   brew install coreutils      # provides gls
# Linux ships GNU ls already, so plain ls works with no extra install.

# Pick a GNU ls: prefer gls (macOS + coreutils), else ls if it is GNU (Linux).
# BSD ls has no --version, so the elif fails there and nothing is wired up.
_ar_gnuls=""
if command -v gls >/dev/null 2>&1; then
  _ar_gnuls="gls"
elif ls --version >/dev/null 2>&1; then
  _ar_gnuls="ls"
fi

if [ -n "$_ar_gnuls" ]; then
  alias ls="$_ar_gnuls --color=auto --group-directories-first"
  alias ll="$_ar_gnuls -lh --color=auto --group-directories-first"
  alias la="$_ar_gnuls -lAh --color=auto --group-directories-first"

  export LS_COLORS="\
no=00:fi=00:rs=0:\
di=01;38;2;59;130;246:\
ln=38;2;153;255;228:\
mh=00:\
pi=38;2;153;255;228:\
so=38;2;59;130;246:\
do=38;2;59;130;246:\
bd=01;38;2;96;165;250:\
cd=01;38;2;147;197;253:\
or=01;48;2;56;4;4;38;2;255;153;153:\
mi=01;48;2;56;4;4;38;2;255;153;153:\
su=01;38;2;0;0;0;48;2;255;128;128:\
sg=01;38;2;0;0;0;48;2;255;153;153:\
ca=00:\
tw=01;38;2;0;0;0;48;2;59;130;246:\
ow=38;2;153;255;228;48;2;30;58;95:\
st=38;2;59;130;246;48;2;30;58;95:\
ex=01;38;2;255;128;128:\
*.tar=38;2;255;128;128:*.tgz=38;2;255;128;128:*.tbz2=38;2;255;128;128:*.txz=38;2;255;128;128:*.tzst=38;2;255;128;128:\
*.gz=38;2;255;128;128:*.bz2=38;2;255;128;128:*.xz=38;2;255;128;128:*.zst=38;2;255;128;128:*.lz=38;2;255;128;128:*.lzma=38;2;255;128;128:\
*.zip=38;2;255;128;128:*.7z=38;2;255;128;128:*.rar=38;2;255;128;128:*.z=38;2;255;128;128:*.Z=38;2;255;128;128:\
*.jar=38;2;255;128;128:*.war=38;2;255;128;128:*.ear=38;2;255;128;128:\
*.deb=38;2;255;128;128:*.rpm=38;2;255;128;128:*.apk=38;2;255;128;128:*.dmg=38;2;255;128;128:*.iso=38;2;255;128;128:*.cab=38;2;255;128;128:*.cpio=38;2;255;128;128:\
*.jpg=38;2;153;255;228:*.jpeg=38;2;153;255;228:*.png=38;2;153;255;228:*.gif=38;2;153;255;228:*.bmp=38;2;153;255;228:\
*.tiff=38;2;153;255;228:*.tif=38;2;153;255;228:*.webp=38;2;153;255;228:*.svg=38;2;153;255;228:*.ico=38;2;153;255;228:*.heic=38;2;153;255;228:\
*.mp4=38;2;153;255;228:*.mov=38;2;153;255;228:*.mkv=38;2;153;255;228:*.avi=38;2;153;255;228:*.webm=38;2;153;255;228:*.flv=38;2;153;255;228:*.wmv=38;2;153;255;228:*.m4v=38;2;153;255;228:\
*.mp3=38;2;153;255;228:*.flac=38;2;153;255;228:*.wav=38;2;153;255;228:*.ogg=38;2;153;255;228:*.m4a=38;2;153;255;228:*.aac=38;2;153;255;228:*.opus=38;2;153;255;228:\
*.json=38;2;147;197;253:*.toml=38;2;147;197;253:*.yaml=38;2;147;197;253:*.yml=38;2;147;197;253:*.ini=38;2;147;197;253:\
*.conf=38;2;147;197;253:*.cfg=38;2;147;197;253:*.env=38;2;147;197;253:*.lock=38;2;147;197;253:*.xml=38;2;147;197;253:*.plist=38;2;147;197;253:\
*.md=38;2;176;176;176:*.markdown=38;2;176;176;176:*.txt=38;2;176;176;176:*.rst=38;2;176;176;176:*.pdf=38;2;176;176;176:\
*.doc=38;2;176;176;176:*.docx=38;2;176;176;176:*.rtf=38;2;176;176;176:*.org=38;2;176;176;176"
fi
unset _ar_gnuls
