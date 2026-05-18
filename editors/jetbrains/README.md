# Atlas Ragnarok — JetBrains plugin

> Tech-blue thunder above. Crimson fire below. Pure black through the middle.
> Color scheme for IntelliJ IDEA, PyCharm, GoLand, WebStorm, Rider, RustRover,
> CLion, RubyMine, PhpStorm, DataGrip, and Android Studio.

## Install

**From JetBrains Marketplace** (once published):

`Settings → Plugins → Marketplace` → search **Atlas Ragnarok** → Install → Restart IDE.

Then `Settings → Editor → Color Scheme → Atlas Ragnarok`.

**From this repo** (manual):

1. Download `src/main/resources/colors/atlas-ragnarok.icls`
2. `Settings → Editor → Color Scheme → ⚙ → Import Scheme → IntelliJ IDEA color scheme (.icls)`
3. Pick the downloaded file
4. Select **Atlas Ragnarok** from the dropdown

## Building locally

```bash
./gradlew buildPlugin
# Plugin JAR appears in build/distributions/
```

## Publishing

```bash
JETBRAINS_MARKETPLACE_TOKEN=hub-xxx ./gradlew publishPlugin
```

Get a token at [hub.jetbrains.com](https://hub.jetbrains.com/users/me?tab=authentication).
