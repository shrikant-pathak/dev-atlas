# Lesson 02: Text and Background Colors

## Learning Objectives
- Apply text color utilities (`.text-*`) and background color utilities (`.bg-*`) independently of components
- Understand "subtle" background/text variants introduced in Bootstrap 5.3 for softer UI accents
- Use `.text-opacity-*` and `.bg-opacity-*` to adjust color intensity without new hex values
- Know the difference between `.text-body`, `.text-muted`, and `.text-body-secondary`

## Introduction
Lesson 01 introduced the eight theme colors and showed them baked into components like buttons and badges. This lesson zooms into the two utility families that let you apply those same colors to *any* element, not just prebuilt components: `.text-{color}` and `.bg-{color}`. These are the building blocks you'll reach for constantly once you move past components and start composing your own layouts in Modules 06–08.

## Text Color Utilities
The full set follows `.text-{color}` for every theme color, plus a few extras:

```html
<p class="text-primary">Primary text</p>
<p class="text-secondary">Secondary text</p>
<p class="text-success">Success text</p>
<p class="text-danger">Danger text</p>
<p class="text-warning">Warning text</p>
<p class="text-info">Info text</p>
<p class="text-body">Default body text</p>
<p class="text-muted">Muted, de-emphasized text</p>
<p class="text-white bg-dark">White text (needs a dark background to be visible)</p>
```

Two of these deserve a closer look because they're commonly confused:
- **`.text-body`** sets the color to your theme's default body text color (respects light/dark mode).
- **`.text-muted`** applies a dimmed gray, used for de-emphasized captions or helper text — you actually already used this one back in Module 03.
- **`.text-body-secondary`** (added in 5.3) is the theme-aware replacement for the old `.text-muted` pattern — it adapts correctly in dark mode, whereas `.text-muted` is a fixed gray that can look wrong on dark backgrounds.

For new projects, prefer `.text-body-secondary` over `.text-muted` if you're planning to support dark mode (Module 10) — it's a small habit now that saves rework later.

## Background Color Utilities
The mirror set: `.bg-{color}`.

```html
<div class="bg-primary text-white p-3">Primary background</div>
<div class="bg-light text-dark p-3">Light background</div>
<div class="bg-dark text-white p-3">Dark background</div>
```

Remember from Lesson 01: background utilities never auto-select text color. Pairing `bg-*` with the correct `text-*` is your job every time.

## Subtle Variants (Bootstrap 5.3+)
For softer accents — think alert-like tints without the full alert component — Bootstrap 5.3 added "subtle" background and text pairs:

```html
<span class="badge bg-success-subtle text-success-emphasis border border-success-subtle">
  Low-key success tag
</span>
```

The naming pattern is:
- `.bg-{color}-subtle` — a pale tint of the color, safe as a background
- `.text-{color}-emphasis` — a darker, more saturated version of the color, safe as text on top of the subtle background
- `.border-{color}-subtle` — a matching soft border

These three are designed to be used together and are especially useful for tags, pills, and callouts where a full-strength `bg-success` would feel too loud.

## Opacity Utilities
Rather than reaching for a new color entirely, you can dial intensity up or down:

```html
<p class="text-primary text-opacity-75">75% opacity primary text</p>
<div class="bg-danger bg-opacity-25 p-3">25% opacity danger background</div>
```

Available steps are `25`, `50`, `75`, and `100` (full opacity, the default). Under the hood this modifies the alpha channel of the color's CSS variable using `rgba()`, so it composites with whatever is behind it — useful for overlays on images.

## Practical Example
A notification list combining full-strength, subtle, and opacity variants to show visual hierarchy:

```html
<ul class="list-unstyled">
  <li class="p-2 mb-2 bg-danger text-white rounded">
    Critical: Payment failed
  </li>
  <li class="p-2 mb-2 bg-warning-subtle text-warning-emphasis border border-warning-subtle rounded">
    Warning: Storage 80% full
  </li>
  <li class="p-2 mb-2 bg-primary bg-opacity-10 text-primary rounded">
    Info: New feature available
  </li>
</ul>
```

The critical item uses a full-strength background because it demands attention. The warning uses the softer "subtle" pairing since it's important but not urgent. The info item uses opacity to feel the lightest of all three.

## Revision Questions

<details>
<summary>1. What's the difference between `.text-muted` and `.text-body-secondary`?</summary>
Both dim text for de-emphasis, but `.text-body-secondary` is theme-aware and adapts correctly under dark mode, while `.text-muted` is a fixed gray value that doesn't adjust.
</details>

<details>
<summary>2. What three classes typically go together in the "subtle" pattern, and what does each do?</summary>
`.bg-{color}-subtle` (pale tinted background), `.text-{color}-emphasis` (darker, readable text on that tint), and `.border-{color}-subtle` (a matching soft border).
</details>

<details>
<summary>3. What opacity steps does Bootstrap provide for `.text-opacity-*` and `.bg-opacity-*`?</summary>
25, 50, 75, and 100.
</details>

<details>
<summary>4. Why should you not rely on `.bg-*` to also set text color?</summary>
Background utilities only control `background-color` — they never calculate or apply a contrasting foreground color, so you must always pair them with an explicit `.text-*` class.
</details>
