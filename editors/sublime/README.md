# Atlas Ragnarok — Sublime Text 4

## Install (manual)

1. **Preferences → Browse Packages…**
2. Drop `atlas-ragnarok.sublime-color-scheme` into the `User/` folder
3. **Preferences → Color Scheme…** → pick **Atlas Ragnarok**

## Install (via Package Control)

Once accepted into Package Control:

1. **Command Palette → Package Control: Install Package**
2. Search for **Atlas Ragnarok**
3. Activate via **Preferences → Color Scheme…**

## Package Control submission

To submit this theme:

1. Tag a release in the parent repo (`v1.0.0`)
2. Open a PR to [`wbond/package_control_channel`](https://github.com/wbond/package_control_channel) adding the package metadata under `repository/a.json`
3. Wait for review + merge — typically a few days

The package metadata stanza:

```json
{
  "name": "Atlas Ragnarok",
  "details": "https://github.com/AyoubTadlaoui/atlas-ragnarok",
  "labels": ["color scheme"],
  "releases": [
    {
      "sublime_text": ">=4000",
      "tags": true
    }
  ]
}
```
