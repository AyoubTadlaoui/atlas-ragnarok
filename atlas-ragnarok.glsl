// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: 2026 Atlas Kaisar
// ╔══════════════════════════════════════════════════════════════╗
// ║   A T L A S - R A G N A R O K   —   Storm-Fire Vignette      ║
// ║                                                              ║
// ║   Thunder-blue tints the top edges (the sky breaking open),  ║
// ║   crimson tints the bottom (the fire below). The middle      ║
// ║   ~60% of the screen stays pure black. A luminance mask      ║
// ║   ensures the tints touch only background pixels — text      ║
// ║   stays crisp at every intensity.                            ║
// ╚══════════════════════════════════════════════════════════════╝

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 center = uv - 0.5;
    float dist = length(center);

    vec4 col = texture(iChannel0, uv);

    // Distance-from-center vignette — tint strengthens toward corners
    float vignette = smoothstep(0.18, 1.00, dist);

    // Luminance mask — keeps text untouched, tints only the dark canvas
    float lum = dot(col.rgb, vec3(0.299, 0.587, 0.114));
    float bg_mask = 1.0 - smoothstep(0.04, 0.18, lum);

    // Top ~30% gets blue, bottom ~30% gets red, middle ~40% stays black
    float top_only    = smoothstep(0.65, 0.85, 1.0 - uv.y);
    float bottom_only = smoothstep(0.65, 0.85, uv.y);

    // Thunder-blue (top) — moody electric storm
    vec3 thunder_blue = vec3(0.055, 0.115, 0.320);
    // Crimson (bottom) — warm undercurrent, the embers below
    vec3 red_tint     = vec3(0.220, 0.014, 0.028);

    col.rgb += thunder_blue * vignette * bg_mask * top_only;
    col.rgb += red_tint     * vignette * bg_mask * bottom_only;

    fragColor = col;
}
