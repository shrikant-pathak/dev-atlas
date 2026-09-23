# Lesson 03: Building Custom Color Modes

## Learning Objectives
- Define a third, custom color mode beyond Bootstrap's built-in light/dark
- Override specific `--bs-*` variables scoped to your custom mode's attribute value
- Understand the CSS specificity/cascade mechanics that make this work
- Know which variables are safe to override vs. which risk breaking component internals

## Introduction
Bootstrap ships exactly two built-in modes — light and dark — but the `data-bs-theme` mechanism itself is fully generic and accepts ANY value, not just those two. This lesson covers defining your own named mode (a branded high-contrast mode, a "sepia" reading mode, whatever your project needs) using the exact same CSS variable override technique from Modules 04, 07, and 09, applied at a larger scale.

## The Generic Mechanism
`data-bs-theme` doesn't have special built-in logic for the strings `"light"` and `"dark"` specifically — Bootstrap simply ships CSS rules targeting `[data-bs-theme="dark"]` as a selector, the same way you could target any custom value:

```css
[data-bs-theme="sepia"] {
  --bs-body-bg: #f4ecd8;
  --bs-body-color: #5b4636;
  --bs-primary: #8b5e34;
  --bs-border-color: #d3c4a3;
}
```

```html
<div data-bs-theme="sepia">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Sepia-themed card</h5>
      <button class="btn btn-primary">Custom-themed button</button>
    </div>
  </div>
</div>
```

Every component inside this `data-bs-theme="sepia"` container picks up the overridden variables automatically, for the exact same reason `dark` mode works in Lesson 01 — the components consume variables, not hardcoded values, so redefining the variables within any scoped selector re-themes everything inside it.

## Why This Requires No Changes to Bootstrap's Own CSS
This is the payoff of the variable-based architecture explored since Module 04: you're not overriding Bootstrap's component rules at all — you're only overriding the CSS custom property VALUES that those rules already reference. This means your custom mode automatically stays compatible with every component in this entire book (buttons, cards, forms, alerts, navbars) without you needing to write theme-specific overrides for each one individually.

## Choosing Which Variables to Override
A full custom mode typically needs, at minimum:
- `--bs-body-bg` / `--bs-body-color` — the page's base background/text
- `--bs-primary` (and other theme colors you actually use) — component accent colors
- `--bs-border-color` — borders across cards, tables, inputs

It's worth being deliberate here rather than exhaustive: Bootstrap defines dozens of CSS variables, but most custom modes only need to touch a small, high-impact subset — the ones controlling the overall page background, text color, and whichever theme colors your specific project actually uses. Overriding variables you don't actually reference anywhere is wasted effort.

## A Caution About Deeper Variable Overrides
Some Bootstrap component internals reference more specific derived variables (`--bs-btn-hover-bg`, for instance) that are themselves calculated from the base theme color variables via Sass, at build time — before you ever see the compiled CSS. Overriding only `--bs-primary` at the CSS-variable level, at runtime, won't automatically recalculate every one of those derived Sass-time variables to match. For a genuinely deep, comprehensive re-theme (rather than the "good enough for most components" approach shown in this lesson), you'd need Sass-level customization instead — exactly the topic of Module 11, which covers rebuilding Bootstrap's variables at the Sass source level rather than overriding the compiled CSS output afterward.

## Practical Example
A "high contrast" accessibility-focused mode, scoped to a settings preview:

```css
[data-bs-theme="high-contrast"] {
  --bs-body-bg: #000000;
  --bs-body-color: #ffffff;
  --bs-primary: #ffff00;
  --bs-border-color: #ffffff;
}
```

```html
<div data-bs-theme="high-contrast" class="p-4">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">High Contrast Preview</h5>
      <button class="btn btn-primary">Sample Button</button>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Does Bootstrap have special built-in logic that makes `data-bs-theme="dark"` work differently from a custom value like `data-bs-theme="sepia"`?</summary>
No — Bootstrap simply ships CSS rules targeting `[data-bs-theme="dark"]` as an ordinary attribute selector; the mechanism itself is fully generic and works identically for any custom value you define your own overriding CSS for.
</details>

<details>
<summary>2. Why does a custom color mode automatically stay compatible with every Bootstrap component without needing per-component overrides?</summary>
You're only overriding the CSS custom property VALUES that component rules already reference, not the component rules themselves — since every component consumes variables rather than hardcoded values, redefining the variables re-themes everything automatically.
</details>

<details>
<summary>3. What's the risk of overriding only a base variable like `--bs-primary` at the CSS level, without touching more specific derived variables?</summary>
Some component internals reference more specific variables (like `--bs-btn-hover-bg`) that are calculated from base variables via Sass at BUILD time, so a runtime override of the base variable alone won't automatically recalculate those already-compiled derived values.
</details>

<details>
<summary>4. What later module covers the deeper, Sass-level approach to customization that a truly comprehensive re-theme would require?</summary>
Module 11 (Customization, Sass Build and RTL).
</details>
