# Lesson 01: `data-bs-theme` Basics

## Learning Objectives
- Apply `data-bs-theme="dark"`/`"light"` to switch Bootstrap's entire theme
- Understand how this single attribute cascades color changes through every component
- Scope theme switching to a page section rather than the whole document
- Recognize which components automatically adapt versus which need manual attention

## Introduction
Since Module 04, Lesson 01 you've known that Bootstrap's theme colors are exposed as CSS custom properties (`--bs-primary`, etc.). This module puts that fact to its most powerful use: Bootstrap ships a complete dark theme built entirely from swapping those same variables' values, toggled with one HTML attribute and zero custom CSS required for the vast majority of components.

## The Basic Switch
```html
<html data-bs-theme="dark">
  <body>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">This card is automatically dark-themed</h5>
        <p class="card-text">No extra classes needed — just the attribute on a parent element.</p>
      </div>
    </div>
  </body>
</html>
```

Setting `data-bs-theme="dark"` on `<html>` (or `<body>`) switches the ENTIRE page's color variables at once — every component built with `.card`, `.btn`, `.form-control`, `.alert`, and so on throughout this entire book automatically re-renders with dark-appropriate colors, because they were all built using Bootstrap's CSS variables rather than hardcoded color values from the start.

## Why This Works Without Rewriting Any Component CSS
This is worth pausing on, because it's the payoff for a design decision made all the way back in Module 04: Bootstrap's component CSS doesn't say `background-color: white` anywhere — it says `background-color: var(--bs-body-bg)`. `data-bs-theme="dark"` simply redefines what `--bs-body-bg` (and every other themed variable) resolves to, for every element inside the attribute's scope. None of the hundreds of component rules across cards, buttons, forms, and navigation need to know or care that dark mode exists — they just consume whatever the current variable value happens to be.

## Scoping Theme to a Section
The attribute doesn't have to sit on `<html>` — it can be applied to any container, letting you mix light and dark sections on the SAME page:

```html
<div data-bs-theme="dark" class="p-4 bg-body">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Dark section</h5>
    </div>
  </div>
</div>

<div class="p-4">
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">Light section (default)</h5>
    </div>
  </div>
</div>
```

A realistic use case: a marketing page with a dark-themed hero section at the top, transitioning to a normal light-themed body below it — both fully functional, correctly-contrasted Bootstrap sections, coexisting on one page.

## What Doesn't Automatically Adapt
It's worth being explicit about the limits here: `data-bs-theme` re-themes Bootstrap's OWN components and utilities correctly, but it cannot retroactively fix:
- **Your own custom CSS** that hardcodes a color (`background-color: #ffffff` instead of `var(--bs-body-bg)`) — this is exactly why Module 04, Lesson 01 encouraged referencing `--bs-*` variables in custom rules from the start, rather than hardcoded hex values
- **Images and icons** with a fixed color scheme, like a logo designed only for a light background
- **Embedded third-party content** (an iframe, an embedded video player) with its own independent styling

## Practical Example
A settings page with an isolated dark-mode preview panel alongside the normal light-themed rest of the page:

```html
<div class="container py-4">
  <h4>Theme Preview</h4>
  <div class="row g-3">
    <div class="col-md-6">
      <p class="fw-bold">Light (default)</p>
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Sample Card</h5>
          <button class="btn btn-primary">Action</button>
        </div>
      </div>
    </div>
    <div class="col-md-6" data-bs-theme="dark">
      <p class="fw-bold">Dark</p>
      <div class="card">
        <div class="card-body">
          <h5 class="card-title">Sample Card</h5>
          <button class="btn btn-primary">Action</button>
        </div>
      </div>
    </div>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What CSS mechanism, introduced back in Module 04, makes `data-bs-theme="dark"` capable of re-theming every Bootstrap component at once?</summary>
Bootstrap's component CSS references color values through CSS custom properties (`var(--bs-body-bg)`, etc.) rather than hardcoded colors; `data-bs-theme` simply redefines what those variables resolve to, and every component automatically picks up the new values.
</details>

<details>
<summary>2. Can `data-bs-theme` be applied to something other than `<html>`, and why would you do that?</summary>
Yes — it can be applied to any container element, allowing different sections of the same page to have different themes simultaneously, such as a dark hero section above a normally light-themed page body.
</details>

<details>
<summary>3. Why won't `data-bs-theme="dark"` correctly re-theme custom CSS that hardcodes `background-color: #ffffff`?</summary>
`data-bs-theme` only affects Bootstrap's own CSS variables; hardcoded color values in custom CSS never reference those variables at all, so they remain fixed regardless of the active theme — this is exactly why Module 04 recommended using `--bs-*` variables in custom rules from the start.
</details>

<details>
<summary>4. Name two kinds of content that `data-bs-theme` cannot automatically adapt.</summary>
Images/icons with a fixed color scheme (e.g. a logo designed only for a light background), and embedded third-party content like an iframe with its own independent styling (custom CSS with hardcoded colors is a third valid answer).
</details>
