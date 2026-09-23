# Lesson 07: Colored Links and Icon Link

## Learning Objectives
- Apply `.link-{color}` utilities for theme-colored links with correct hover behavior
- Use `.link-opacity-*` and `.link-underline-*` for finer visual control
- Build an icon-plus-text link using `.icon-link`
- Understand why dedicated link utilities exist rather than just using `.text-{color}`

## Introduction
You might reasonably wonder, at this point in the book, why links need their own dedicated utility family when `.text-{color}` from Module 04 already sets text color. This lesson explains exactly that distinction, then covers the icon-link pattern for combining an icon with link text cleanly.

## Why Not Just Use `.text-{color}` on Links?
```html
<a href="#" class="text-danger">Plain text-danger link</a>
<a href="#" class="link-danger">link-danger link</a>
```

`.text-{color}` sets a flat, static color with no special hover/focus behavior — reusing it on a link technically works but leaves the link's hover, focus, and visited states unstyled relative to that color, which can look inconsistent or low-contrast on interaction. `.link-{color}` is purpose-built for links specifically: it sets the base color AND coordinates appropriate hover/focus darkening, giving a consistent, theme-correct interactive feel that plain `.text-{color}` was never designed to provide.

## Link Opacity
```html
<a href="#" class="link-primary link-opacity-75">Slightly muted primary link</a>
<a href="#" class="link-primary link-opacity-100">Full opacity primary link</a>
<a href="#" class="link-primary link-opacity-75-hover">Fades further on hover</a>
```

Same `25`/`50`/`75`/`100` opacity scale you've seen since Module 04's `.text-opacity-*`/`.bg-opacity-*` — applied here specifically to link color.

## Link Underline Utilities
```html
<a href="#" class="link-primary link-underline-opacity-0 link-underline-opacity-100-hover">
  Underline appears only on hover
</a>
```

This pattern — no visible underline by default, one appearing on hover — is a common modern UI convention for links embedded within body text or navigation, where a permanent underline can feel visually heavy. `link-underline-opacity-0` hides it at rest; `link-underline-opacity-100-hover` restores it at full visibility specifically on hover.

## Icon Links
`.icon-link` handles the spacing and alignment problem of combining an icon (typically an inline SVG) with link text, including a small built-in hover animation that nudges the icon slightly on interaction:

```html
<a href="#" class="icon-link icon-link-hover">
  Continue reading
  <svg class="bi" width="16" height="16" fill="currentColor" aria-hidden="true">
    <use xlink:href="#chevron-right"/>
  </svg>
</a>
```

`fill="currentColor"` on the SVG is a deliberate, important detail — it makes the icon inherit the link's current text color automatically, so if the link changes color on hover (via `.link-{color}` or its own hover state), the icon changes color right along with it, without needing separate icon-specific color rules.

## Practical Example
A "read more" link combining color, underline-on-hover, and an icon:

```html
<a href="#" class="icon-link icon-link-hover link-primary link-underline-opacity-0 link-underline-opacity-100-hover">
  Read the full case study
  <svg class="bi" width="16" height="16" fill="currentColor" aria-hidden="true">
    <use xlink:href="#arrow-right"/>
  </svg>
</a>
```

## Revision Questions

<details>
<summary>1. Why is `.link-{color}` preferred over `.text-{color}` specifically for links?</summary>
`.text-{color}` sets a flat, static color with no coordinated hover/focus behavior; `.link-{color}` is purpose-built to also handle appropriate hover/focus darkening, giving links a consistent, theme-correct interactive feel.
</details>

<details>
<summary>2. What does `link-underline-opacity-0` combined with `link-underline-opacity-100-hover` achieve?</summary>
The underline is invisible at rest and becomes fully visible specifically on hover — a common modern convention for links inside body text or navigation where a permanent underline would feel visually heavy.
</details>

<details>
<summary>3. Why is `fill="currentColor"` important on an SVG icon inside an `.icon-link`?</summary>
It makes the icon automatically inherit the link's current text color, so the icon changes color along with the link text on hover or state change, without needing separate icon-specific color rules.
</details>

<details>
<summary>4. What scale do `.link-opacity-*` utilities follow, and where has that same scale appeared earlier in this book?</summary>
The same 25/50/75/100 scale as `.text-opacity-*` and `.bg-opacity-*` from Module 04, Lesson 02 — applied here specifically to link color instead of general text/background color.
</details>
