# Lesson 04: Stacks and Stretched Link

## Learning Objectives
- Use `.vstack`/`.hstack` as flex-utility shorthand for common layout patterns
- Apply `.stretched-link` to make an entire card or block clickable via one link
- Understand the accessibility and layout implications of stretched links
- Combine stacks with gap utilities for consistent spacing

## Introduction
This lesson covers two small but frequently useful utilities that save you from manually recomposing the flex utilities from Lesson 01 every time you hit these two very common patterns: a simple vertical/horizontal stack of items, and a "make this whole card clickable" link.

## Vertical and Horizontal Stacks
`.vstack` and `.hstack` are pre-composed shorthand for a specific, very common flex configuration:

```html
<div class="vstack gap-2">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

This is exactly equivalent to writing `d-flex flex-column` plus a gap utility yourself — `.vstack` just saves the keystrokes for a pattern common enough to deserve its own name. Same idea horizontally:

```html
<div class="hstack gap-3">
  <div>Left item</div>
  <div class="vr"></div>
  <div>Right item</div>
</div>
```

`.vr` here is the vertical-rule utility (covered fully in Lesson 06) — note how it slots naturally between hstack items to create a visual divider, similar in spirit to a toolbar separator.

## Auto-Margin Utilities Within Stacks
Since a stack is just flex underneath, the same auto-margin trick from Module 04 works to push one item to the opposite end:

```html
<div class="hstack gap-3">
  <div>Brand</div>
  <button class="btn btn-primary ms-auto">Sign out</button>
</div>
```

## Stretched Link
`.stretched-link` extends a single link's clickable area to cover its ENTIRE nearest `position: relative` ancestor — most commonly used to make a whole card clickable while keeping only one actual `<a>` tag in the markup:

```html
<div class="card position-relative" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">
      <a href="#" class="stretched-link">Read the full article</a>
    </h5>
    <p class="card-text">A short preview of the article content...</p>
  </div>
</div>
```

The parent `.card` needs `.position-relative` for the exact same reason it did in Lesson 02's badge example — `.stretched-link` works by absolutely positioning an invisible pseudo-element that expands to fill the nearest positioned ancestor, so without that ancestor being explicitly positioned, the stretched click target would expand relative to the whole page instead of just the card.

## Why Only One Real Link, Not the Whole Card Wrapped in `<a>`
It might seem simpler to just wrap the entire card in an `<a>` tag. The reason `.stretched-link` is the better approach: a card often contains OTHER interactive elements too — a "favorite" icon button, a secondary link, a dropdown — and nesting a `<button>` or another `<a>` inside an outer `<a>` is invalid HTML and breaks in genuinely unpredictable ways across browsers. `.stretched-link` lets you keep exactly one real, valid link while still making the surrounding area clickable, and any other interactive element inside the card (with a higher effective stacking position) remains independently clickable.

## Practical Example
A blog post preview card using a stack for meta info and a stretched link for the whole-card click target:

```html
<div class="card position-relative" style="width: 20rem;">
  <div class="card-body">
    <div class="hstack gap-2 mb-2 text-body-secondary">
      <small>5 min read</small>
      <div class="vr"></div>
      <small>Sept 20, 2026</small>
    </div>
    <h5 class="card-title">
      <a href="#" class="stretched-link text-decoration-none">Understanding Flexbox Gaps</a>
    </h5>
    <p class="card-text">A deep dive into gap utilities and when to use them over margins.</p>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What flex utilities is `.vstack` shorthand for?</summary>
`d-flex flex-column`, typically combined with a `gap-*` utility — `.vstack` is a pre-composed convenience class for this common configuration, not a new mechanism.
</details>

<details>
<summary>2. Why must a card using `.stretched-link` have `.position-relative` on itself?</summary>
`.stretched-link` works by absolutely positioning an invisible expanding element that fills the nearest positioned ancestor; without `.position-relative` on the card, the click target would expand relative to the whole page instead of just the card.
</details>

<details>
<summary>3. Why is `.stretched-link` generally preferred over wrapping an entire card in a single `<a>` tag?</summary>
Cards often contain other interactive elements (buttons, secondary links); nesting interactive elements inside an outer `<a>` is invalid HTML with unpredictable cross-browser behavior, while `.stretched-link` keeps one valid link and leaves other elements independently clickable.
</details>

<details>
<summary>4. What utility from Lesson 06 commonly pairs with `.hstack` to create a visual divider between items?</summary>
`.vr` (the vertical rule utility).
</details>
