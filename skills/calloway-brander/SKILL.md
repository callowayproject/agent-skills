---
name: calloway-project-design-system
description: Apply the Calloway Project brand — an open source platform-engineering/DX tooling brand with an Art Deco-influenced mark and a plain-spoken "master craftsman's workshop" voice — using its registered colors, typography, components, motion, and voice rules. Use whenever building or reviewing a Calloway Project artifact (site, docs, deck, email, UI).
user-invocable: true
---

# Calloway Project design system

## What is inside

A complete, reusable design-system package for the Calloway Project brand: canonical rules (`DESIGN.md`), portable tokens (`colors_and_type.css`, `brand.json`), preserved real logo assets (`assets/`), focused review cards (`preview/`), and a Bootstrap 5 theme (`component-library/`).

## Source context

Extracted from a pasted brand strategy document (`designmd://calloway-project`, brand id `calloway-project-bf5dfa`). No live site or Figma file was available — colors, typography, and layout posture come from the pasted DESIGN.md; the three logo SVGs and the source brand-strategy markdown were preserved as real assets in `assets/`. Imagery guidance in `DESIGN.md` is explicitly labeled inferred (no source imagery was captured).

## When to use this skill

- Building any new Calloway Project surface: website, docs page, README, pitch deck, email, or in-app UI.
- Reviewing existing Calloway Project work for on-brand color, type, voice, and component usage.
- Writing marketing or product copy that needs to match the brand voice ("plain-spoken," not "hype-driven").

## How to use

1. Read `DESIGN.md` first — it is the canonical source of truth for brand foundation, audience, voice, messaging pillars, logo usage, color roles, typography, imagery posture, layout, components, motion, and anti-patterns.
2. Bind tokens from `colors_and_type.css` (portable subset) or `system/variables.css` (full derived scale with interaction/semantic states) into your `:root`.
3. Check `preview/*.html` for a fast visual reference per token category before building from scratch.
4. Check `ui_kits/app/` for a composed, applied example of the tokens and component rules working together.
5. Use the real logo files in `assets/` — never redraw or substitute a placeholder mark.
6. Match copy to the voice rules in `DESIGN.md` → Voice & Tone (use/avoid vocabulary, the "master craftsman's workshop" personality).

## Design system highlights

- **Palette (light):** Background `#ffffff`, Surface `#faf8f5`, Foreground `#111111`, Muted `#7c7064`, Border `#d0c3b6`, Accent `#d20000`, Accent-secondary (pressed) `#8c0000`. Accent is the logo red's hue (31.2°) darkened for direct WCAG AA compliance (5.61:1 on white); Surface/Muted/Border are re-derived from the logo artwork's measured shadow color (`#d0c3b6`). One accent per screen, never a background wash.
- **Type:** DM Sans for display (700) and body (400/500), DM Mono stack for all code/config/CLI content.
- **Layout:** 8px baseline grid, 8px radius, 1px hairline borders, no shadows or UI gradients — the mark's warm gradient stays on the mark only.
- **Dark mode:** a certified second token set (`DESIGN.md` → Dark Mode), not an improvised invert. Apply via `[data-theme="dark"]` in `colors_and_type.css`. Accent keeps the pure logo red (`#ff2600`) in dark mode — brighter than light mode's `#d20000` — because dark backgrounds need it: the light-mode Accent only reaches 3.52:1 there and fails. Accent-secondary flips the same way, darkening for light-mode hover and lightening for dark-mode hover.
- **Voice:** Plain-spoken, confident, understated, warm, direct about tradeoffs — never hype-driven, jargon-stacked, or "thought leader" in tone.
- **Motion:** Utilitarian only — `0.1s`/`0.2s`/`0.3s` durations, no bounce or spring-overshoot.
- **Accent contrast:** the pure logo red (`#ff2600`) is only 3.8:1 on white and fails AA normal text (4.5:1) — that's why light mode uses the darkened `#d20000` instead, which passes directly as both text and button background (with white text) without any per-state text-color workaround.
