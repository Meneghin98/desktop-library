# Desktop Library

A [Millennium](https://steambrew.app) plugin that turns the Steam library page into a **desktop**: each installed game appears as an icon you can arrange freely, just like the icons on your operating system's desktop.

> **Status:** early development. The plugin is still at the template stage; the features below are the goals of the project.

## Planned features

- **Desktop view of the library:** replaces (or sits beside) the standard library page with a desktop-like view.
- **Game icons:** each installed game is an icon. Double-click to launch it.
- **Free layout:** drag icons to arrange them, with snap-to-grid. The layout is saved between sessions.
- **Wallpaper:** a custom desktop background (image or color).
- **Wallpaper Engine integration (if feasible):** use your Wallpaper Engine wallpapers as the desktop background.

## Project structure

| Path | Description |
| --- | --- |
| `millennium.toml` | Plugin configuration (metadata, entry points, build and dev options) |
| `backend/` | Lua (LuaJIT) backend. Runs natively with system access, e.g. to read Wallpaper Engine data |
| `frontend/` | TypeScript/React code injected into the Steam client UI (library page) |
| `webview/` | Preload script for Steam's web views (store, community) |
| `resources/` | Static assets bundled with the plugin |

## Prerequisites

- **[Millennium](https://github.com/SteamClientHomebrew/Millennium)** >= v3.4.0
- **[Bun](https://bun.com/)** >= v1.0.0
- Steam developer mode enabled, for access to the devtools ([guide](https://docs.steambrew.app/developers/devtools))

## Development

```bash
# Install dependencies
bun install

# Watch mode: rebuilds and hot-reloads the plugin on changes
bun run dev

# Production build
bun run build
```

With `output_path = "auto"` in `millennium.toml`, the build detects your Millennium installation and installs the plugin there. Enable **Desktop Library** in Millennium Settings.

## Resources

- [Millennium plugin documentation](https://docs.steambrew.app/plugins/)
- [Plugin template](https://github.com/SteamClientHomebrew/PluginTemplate) this project is based on

## License

Released under the [MIT License](LICENSE).
