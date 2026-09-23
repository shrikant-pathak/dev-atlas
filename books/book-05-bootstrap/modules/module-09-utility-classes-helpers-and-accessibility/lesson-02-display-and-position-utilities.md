# Lesson 02: Display and Position Utilities

## Learning Objectives
- Apply the full `.d-*` display utility family beyond just `.d-flex`/`.d-none`
- Use responsive display utilities to show/hide content per breakpoint
- Apply `.position-*` utilities (static, relative, absolute, fixed, sticky)
- Use `.top-*`/`.start-*`/`.end-*`/`.bottom-*` with `.translate-middle` for precise positioning
- Recognize the positioning pattern behind the notification badge from Module 06

## Introduction
Display and position utilities have both appeared piecemeal already — `.d-none .d-md-block` hiding carousel captions on mobile (Module 08), `.position-relative`/`.position-absolute` positioning a notification badge (Module 06, Lesson 03). This lesson formalizes both families properly.

## The Display Utility Family
```html
<div class="d-none">Never visible</div>
<div class="d-inline">Inline</div>
<div class="d-inline-block">Inline-block</div>
<div class="d-block">Block</div>
<div class="d-flex">Flex (covered in Lesson 01)</div>
<div class="d-grid">CSS Grid</div>
```

Each of these maps directly to the CSS `display` property's values — `.d-*` is purely a shorthand utility wrapper around a single CSS property, nothing more.

## Responsive Display: Show/Hide by Breakpoint
This is where display utilities get genuinely powerful — combined with breakpoint infixes, they let you show or hide entire blocks of content per screen size:

```html
<div class="d-md-none">Visible below md, hidden at md and up</div>
<div class="d-none d-md-block">Hidden below md, visible at md and up</div>
```

You've already used this exact pattern to hide the mobile offcanvas trigger button at larger screens (Module 07, Lesson 06, `.d-lg-none`) and to hide carousel captions on small screens (Module 08, Lesson 04, `.d-none .d-md-block`) — this lesson is simply naming and generalizing what those examples were already doing.

## Position Utilities
```html
<div class="position-static">Default — no special positioning</div>
<div class="position-relative">Establishes a positioning context for absolute children</div>
<div class="position-absolute">Positioned relative to nearest positioned ancestor</div>
<div class="position-fixed">Positioned relative to the viewport, stays put on scroll</div>
<div class="position-sticky">Toggles between relative and fixed based on scroll position</div>
```

`.position-relative` + `.position-absolute` together are the exact mechanism behind the notification badge pattern from Module 06, Lesson 03 — the parent button becomes a positioning anchor via `.position-relative`, and the badge is then placed precisely within it via `.position-absolute`. `.position-fixed` is what pinned the toast container to the viewport corner in Module 08, Lesson 07.

## Edge and Translate Utilities
For fine-grained placement of an absolutely/fixed positioned element:

```html
<div class="position-relative">
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    3
  </span>
</div>
```

`.top-0`/`.start-100`/`.bottom-0`/`.end-100` position an element's edge at a percentage of its container. `.translate-middle` then shifts the element back by exactly half its own width and height, centering it precisely on that computed point — this is the full breakdown of the notification badge combo first shown (without explanation) in Module 06, Lesson 03.

## Sticky Positioning
```html
<div class="sticky-top">
  Stays pinned to the top of the viewport once scrolled to, until its parent container ends.
</div>
```

`.sticky-top` is commonly used for section headers within a scrollable area, or a sidebar nav that should stay visible as the user scrolls past it — conceptually a lighter-weight, CSS-only alternative to `position-fixed` for content that should only "stick" once it reaches the top, not float independently of the whole page from the start.

## Practical Example
A product card with a "Sale" badge precisely positioned in the top-right corner, using the full position + translate combo:

```html
<div class="card position-relative" style="width: 18rem;">
  <span class="position-absolute top-0 end-0 translate-middle badge rounded-pill bg-danger">
    Sale
  </span>
  <div class="card-body">
    <h5 class="card-title">Wireless Keyboard</h5>
    <p class="card-text">$49.99</p>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What CSS property does the entire `.d-*` utility family map to?</summary>
The `display` property — each `.d-*` class is a shorthand wrapper around one specific `display` value (none, inline, inline-block, block, flex, grid).
</details>

<details>
<summary>2. Where in this book has `.d-none .d-md-block` (or its inverse) already been used, before this lesson formally introduced it?</summary>
Hiding the mobile offcanvas trigger button at larger screens (Module 07, `.d-lg-none`) and hiding carousel captions on small screens (Module 08, `.d-none .d-md-block`).
</details>

<details>
<summary>3. What does `.position-relative` on a parent element actually enable for an absolutely positioned child?</summary>
It establishes a positioning context/anchor — the child's `.position-absolute` coordinates (`.top-0`, `.start-100`, etc.) are calculated relative to this ancestor rather than the whole page.
</details>

<details>
<summary>4. What does `.translate-middle` do, and what earlier component's badge relies on it?</summary>
It shifts an element back by exactly half its own width and height, centering it precisely on a computed edge point — this is the exact mechanism behind the notification badge positioning first shown in Module 06, Lesson 03.
</details>
