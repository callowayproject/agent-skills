# Calloway Project — design system package

Reusable design-system package extracted from a pasted brand strategy document (`designmd://calloway-project`) and enriched in place. Registered as the Open Design design system `user:calloway-project`.

## Product Overview

Calloway Project is an open source organization building platform-engineering tools and developer experience (DX) infrastructure for individual developers and OSS contributors — not enterprise buyers. The brand's Art Deco-influenced mark (confident, geometric, built to last) and "the master craftsman's workshop" personality both point at the same idea: engineered with pride, not thrown together. Full positioning, audience, and voice detail live in `DESIGN.md`.

- **Tagline (marketing contexts):** "Crafted in the open. Built to bend."
- **Descriptor (always travels with the mark):** "Open Source Development"
- **Primary color:** Accent `#d20000` in light mode — the logo red's hue (31.2°) darkened for direct WCAG AA compliance, since the pure logo red (`#ff2600`) only reaches 3.8:1 on white and fails normal-text contrast. Dark mode keeps the pure logo red, which passes there instead (5.2:1). Used sparingly, never as a background wash.
- **Type:** DM Sans (display + body), DM Mono stack for code.
- **Dark mode:** certified token set in `DESIGN.md` → Dark Mode, applied via `[data-theme="dark"]` in `colors_and_type.css`. Not an afterthought invert — both Accent and Accent-secondary flip direction between themes (light darkens for contrast on white, dark lightens for contrast on black) because a single fixed value can't pass AA against both.

## Package Contents

| Path                  | What it is                                                                                                                                                |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `DESIGN.md`           | Canonical design-system rules: brand foundation, audience, voice, messaging, logo, color, typography, imagery, layout, components, motion, anti-patterns. |
| `README.md`           | This file — reusable package guide.                                                                                                                       |
| `SKILL.md`            | Agent-facing usage instructions.                                                                                                                          |
| `colors_and_type.css` | Portable color/type/spacing/radius/motion tokens + base element styles.                                                                                   |
| `assets/`             | Real preserved logo SVGs and the source brand strategy doc.                                                                                               |
| `component-library/`  | A Bootstrap 5 theme using brand tokens                                                                                                                    |


## component-library/

A Bootstrap 5 theme for the Calloway Project brand ([`../DESIGN.md`](../DESIGN.md), [`../colors_and_type.css`](../colors_and_type.css)), compiled from Sass using Bootstrap's own variable/map override API — not a post-hoc CSS-variable patch.

The compiled assets are available in `component-library/dist/`.

## Preserved Assets, Fonts & Build Artifacts

- **Assets (real, preserved):** `assets/calloway-logo.svg` (wordmark), `assets/calloway-c.svg` (monogram). Never redraw or substitute a placeholder for these.
- **Fonts:** DM Sans (display/body) and DM Mono (code) are Google-hosted webfonts referenced by family name — no font binary was included in the source evidence, so `colors_and_type.css` loads both via a Google Fonts `@import` with the full system-font fallback stack as a safety net. No `fonts/` directory exists for this brand.
- **Build artifacts:** no installer/tray/app runtime icons were present in the source evidence, so no root `build/` directory exists. `assets/calloway-c.svg` (the square monogram) is the closest analog for favicon/app-icon use.

## Package Reuse Guide (Reuse or Review Workflow)

1. Read `DESIGN.md` for the full rules (voice, color roles, typography, component do/don'ts, motion, anti-patterns).
2. Load `colors_and_type.css` for a drop-in token set, or bind `system/variables.css` if you need the full derived antd-style scale (interaction states, semantic status colors).
3Preserve `assets/*.svg` — never redraw the mark; use `calloway-logo.svg` (wordmark), `calloway-osd.svg` (wordmark + descriptor), or `calloway-c.svg` (monogram) as appropriate.
