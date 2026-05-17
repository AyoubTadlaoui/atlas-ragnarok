# Security policy

## Supported versions

Only the latest `main` and the most recent tagged release receive security fixes.

| Version | Supported |
|---------|-----------|
| `main` (HEAD) | ✅ |
| `1.x` (latest release) | ✅ |
| anything older | ❌ |

## Reporting a vulnerability

This project ships static color configs and a GLSL fragment shader — the threat
surface is small, but if you spot something concerning (e.g. a shader pattern
that crashes a specific GPU driver, or a config that triggers an exploitable
Ghostty parser bug), please report privately:

**Email:** [atlas.kaisar@icloud.com](mailto:atlas.kaisar@icloud.com)

Please **don't** open a public issue for security reports. You'll get an
acknowledgement within 7 days; fix turnaround depends on severity.

## What's out of scope

- Bugs in upstream Ghostty itself → report to [ghostty-org/ghostty](https://github.com/ghostty-org/ghostty)
- Bugs in target terminals (Alacritty / Kitty / WezTerm / iTerm2 / Windows Terminal)
  triggered by our palette files → report to the respective project
- Aesthetic disagreements with the palette choices
