# Calloway Project — Bootstrap 5 component library

A Bootstrap 5 theme for the Calloway Project brand ([`../DESIGN.md`](../DESIGN.md), [`../colors_and_type.css`](../colors_and_type.css)), compiled from Sass using Bootstrap's own variable/map override API — not a post-hoc CSS-variable patch.

## Build

```sh
npm install
npm run build
```

This compiles `scss/calloway-theme.scss` (which selectively imports Bootstrap's Sass source with brand variable overrides) into `dist/calloway-bootstrap.css`. The compiled file is committed, so consumers can use the theme without running Sass themselves — rerun `npm run build` after editing `scss/calloway-theme.scss`.

## Usage

```html
<link href="dist/calloway-bootstrap.css" rel="stylesheet">
```

No separate Bootstrap CDN link needed — the compiled CSS already contains Bootstrap's styles with the brand theme baked in.

### Dark mode

Set Bootstrap's native theme attribute — no separate dark-mode flag:

```html
<html data-bs-theme="dark">
```

The accent hue flips per `DESIGN.md`: light mode uses a darkened red for AA contrast on white, dark mode uses the pure logo red.

## What's covered

Selective Sass imports — only what's in scope per `DESIGN.md` → Components: Reboot, type, containers/grid, buttons, cards, forms, nav/navbar, tables, dropdown, badge, alert, progress, list group, pagination, breadcrumb, accordion, modal, offcanvas, tooltip, popover, toasts, transitions, helpers, and utilities. Carousel and other unnamed components are not imported.

- **Buttons** — `.btn.btn-primary` (solid accent), `.btn.btn-outline-secondary` (bordered), default/hover/focus-visible/active/disabled.
- **Cards** — `.card`, flat Surface fill, 1px Border, no shadow.
- **Forms** — `.form-control`, `.form-select`, `.form-check`, default/focus/disabled/invalid states.
- **Navigation** — `.nav`/`.nav-link.active` (sidebar or inline), `.navbar` (top bar).
- **Table** — `.table`, flat Border-separated rows, no zebra striping, single-dot status accent (`.status-dot`).
- **Alert / Badge / Progress** — structural brand treatment (radius, no shadow, DM Sans); Bootstrap's default semantic hues (success/warning/danger/info) are unchanged.
- **List group** — `.list-group-item.active` uses the accent.
- **Dropdown** — `.dropdown-menu`, no shadow, 1px border; `.dropdown-item.active` uses the accent.
- **Pagination** — `.page-link.active`/`:hover` uses the accent.
- **Breadcrumb** — structural brand treatment only.
- **Accordion** — `.accordion-button`, active/expanded state uses the accent instead of Bootstrap's default blue tint.
- **Modal / Offcanvas** — flat Surface fill, 1px Border, no shadow.
- **Tooltip / Popover** — no shadow; popover has a 1px Border.
- **Toast** — flat Surface fill, 1px Border, no shadow.

See `demo.html` for the in-spec component set rendered in both themes, using real copy pulled from this brand package's existing kit/preview files (no placeholder Lorem ipsum). `full-demo.html` (a repointed Bootswatch "Brite" template) exercises the full component set above, including these newer additions.


## Verification

1. `npm install && npm run build` — confirms the Sass compiles with no errors.
2. Open `demo.html` directly in a browser (no server needed) — confirm every component renders with Calloway tokens: no default Bootstrap blue, no shadows, 8px radius throughout.
3. Click "Toggle dark mode" and confirm the accent hue flip and full palette swap.
4. Resize to 360×800 and 1440×900 — no horizontal overflow.
