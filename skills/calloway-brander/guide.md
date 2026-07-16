# Calloway Project — Brand Guide

*Crafted in the open. Built to bend.*

# Calloway Project — Brand Strategy

## 1. Brand Foundation

**What Calloway Project is:** An open source organization building platform-engineering tools and developer experience (DX) infrastructure — the kind of tooling that sits underneath a team's daily workflow and makes it feel less like fighting the system and more like the system is on your side. The brand's Art Deco-influenced mark — confident, geometric, built to last — echoes that same idea: engineered with pride, not thrown together.

**Positioning statement:**

> For individual developers and OSS contributors who are tired of platform tooling that's either bloated, opinionated enterprise software or a pile of scripts held together with hope, Calloway Project builds focused, well-crafted tools for platform engineering and developer experience — flexible enough to fit your workflow instead of the other way around, and built by people who use them, for people who'll actually read the source.

**Mission:** Make platform and developer-experience tooling — the invisible layer developers depend on but rarely think about — something people actually understand, trust, and enjoy working with.

---

## 2. Audience

Primary: **individual developers and OSS contributors** — not primarily buyers or decision-makers, but people who:

- Discover tools through GitHub, Hacker News, dev Twitter/Bluesky, conference talks, word of mouth
- Evaluate tools by reading code, issues, and commit history — not sales pages
- Care about maintainer responsiveness, doc quality, and whether the project feels alive
- Often bring tools into their workplace informally, becoming internal champions

This means the website's real job isn't persuasion in the marketing sense — it's **credibility and legibility, fast.** A dev should be able to tell in under a minute: what this does, whether it's actively maintained, and whether the people behind it seem like they know what they're doing.

---

## 3. Brand Personality & Voice

There's a natural tension worth naming: the logo is bold, dramatic, Art Deco-influenced — confident geometry, thick outlines, warm gradient. The tone you want is friendly and approachable. These aren't in conflict if you resolve it deliberately rather than by accident.

Art Deco is worth leaning into specifically, not just treating as "bold industrial." It carries its own connotations: engineered precision rather than scrappy improvisation, craftsmanship and permanence (built to be admired *and* to last), and a kind of machine-age optimism about what well-designed things can do for people. That's a more precise fit for a platform-engineering brand than generic ruggedness.

**Resolved personality: "The master craftsman's workshop."**

Think less "friendly SaaS mascot," more *the well-run workshop where the person behind the counter actually knows every tool on the wall, builds things to last, and will tell you the truth about which one you need.* Friendly because it's helpful and plain-spoken, not because it's cutesy or sanded-down. The confidence and precision of the mark becomes a signal of craft and durability, not aggression — pride of construction, not swagger.

**Voice attributes:**

| We are... | We are not... |
|---|---|
| Plain-spoken | Jargon-stacked |
| Confident, understated | Hype-driven, buzzword-heavy |
| Warm | Cutesy or gimmicky |
| Direct about tradeoffs | Evasive marketing-speak |
| Built by practitioners | Built by "thought leaders" |
| Precise, well-constructed | Improvised, held-together |

**Voice in practice:**

- ✅ "This handles service discovery so you don't have to think about it. Here's how it works under the hood."
- ❌ "Unlock next-generation platform synergy with our revolutionary discovery engine."
- ✅ "Still early. Expect rough edges. Issues and PRs welcome."
- ❌ "Enterprise-grade, mission-critical, industry-leading."
- ✅ "Ships with sane defaults. Every part of it is meant to be overridden."
- ❌ "The right way to build your platform." (implies there's only one right way)

Friendly shows up as: clear docs, humor in error messages and READMEs where it fits, genuine responsiveness to issues, and copy that talks *to* a developer, not *at* them. It does not show up as forced enthusiasm or exclamation points doing the emotional labor that clear writing should be doing.

---

## 4. Messaging Pillars

Four things the brand should consistently communicate, in order of priority:

1. **Built for the workflow, not the pitch deck.** Tools solve real platform/DX pain — onboarding friction, pipeline complexity, environment drift — not hypothetical enterprise checklists.
2. **Legible by design.** Docs, source, and architecture are meant to be read and understood, not just used. "You can see how it works" is a feature.
3. **Maintained in the open, honestly.** Active maintenance, transparent roadmaps, and honesty about what's stable vs. experimental. Trust is earned by not overselling.
4. **Flexible, not opinionated.** Every dev has their own style, and Calloway tools are built to bend to that rather than force it. Good defaults out of the box, but nothing bolted shut — you're expected to reshape things to fit your workflow, not conform to ours.

---

## 5. Naming & Tagline Direction

The logo pairs the wordmark with **"Open Source Development"** as a descriptor — plain, literal, and confident enough to not need embellishment, which fits the Art Deco "precision over hype" read well. It travels with the mark as wayfinding, not a pitch.

For marketing contexts (hero copy, social, README badges), use the shorter, voice-driven line:

> **"Crafted in the open. Built to bend."**

"Crafted" ties to the Art Deco aesthetic and the craftsmanship personality from Section 3, "in the open" carries the transparency/OSS pillar, and "built to bend" delivers the flexibility message (Pillar 4) without spelling out "customize."

Other directions considered, kept here for reference:

- *"Tools that get out of your way."*
- *"Platform engineering, without the platform team overhead."*
- *"Built in the open. Built to last."*
- *"Developer experience, from developers."*
- *"Good defaults. Zero lock-in."*
- *"Bend it 'til it's yours."*

"Open Source Development" is the descriptor that always travels with the mark; "Crafted in the open. Built to bend." is the situational marketing line.

Extracted from designmd://calloway-project.

## Color roles

- **Background** (`#ffffff`) — background: page canvas
- **Surface** (`#faf8f5`) — surface: cards, panels, and secondary containers set against Background. Hue and chroma taken directly from the logo artwork's measured shadow color (#D0C3B6, hue 67.5°) at near-white lightness.
- **Foreground** (`#111111`) — foreground: body text and headings
- **Muted** (`#7c7064`) — muted: secondary text, metadata, timestamps, helper copy. Same hue family as the measured shadow color (#D0C3B6, hue 67.5°) at readable text lightness; 4.82:1 on Background, 4.54:1 on Surface — passes AA.
- **Border** (`#d0c3b6`) — border: hairline rules and dividers between cards, table rows, and form fields. This is the logo artwork's measured shadow color (#D0C3B6) used directly, not derived.
- **Accent** (`#d20000`) — accent: primary actions, links, focus states — one accent, used sparingly, never as a large background wash. Same hue as the logo (31.2°) darkened for direct WCAG AA compliance: 5.61:1 on white/Surface as text, and 5.61:1 with white text on it as a button background — passes both directions without a text-color workaround.
- **Accent (pressed)** (`#8c0000`) — accent-secondary: hover/active/pressed state of Accent — darkened further along the same hue (31.2°). 9.93:1 on Background with white text, passes AA with a wide margin.

## Typography

- Display: DM Sans
- Body: DM Sans
- Mono: DM Mono

## Messaging pillars

- Built for the workflow, not the pitch deck — tools solve real platform/DX pain (onboarding friction, pipeline complexity, environment drift), not hypothetical enterprise checklists.
- Legible by design — docs, source, and architecture are meant to be read and understood, not just used. "You can see how it works" is a feature.
- Maintained in the open, honestly — active maintenance, transparent roadmaps, and honesty about what's stable vs. experimental. Trust is earned by not overselling.
- Flexible, not opinionated — good defaults out of the box, but nothing bolted shut. Every dev reshapes the tools to fit their workflow, not the other way around.
