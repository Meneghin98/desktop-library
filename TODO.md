# TODO

- [ ] Replace `resources/favicon.svg`: it is still the SteamBrew logo inherited from the plugin template and is no longer used by the code. Swap it for a Desktop Library icon (or remove it).
- [ ] Desktop settings (in the plugin's settings page): wallpaper configuration.
  - Fit mode, like Windows: **Fill** (`object-fit: cover`, default), **Fit** (letterboxed, with a background color), **Stretch**, **Center**, **Tile**.
  - Focal point (`object-position`) so the user picks which part of the wallpaper stays visible when it gets cropped.
  - Wallpaper source: solid color, local image, Wallpaper Engine (preview for scene wallpapers, video if feasible).
  - The desktop area changes size (Steam window resize, library sidebar width), so the wallpaper must adapt to any aspect ratio.
