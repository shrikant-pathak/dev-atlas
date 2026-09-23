# Lesson 06: Offcanvas

## Learning Objectives
- Build a slide-in offcanvas panel with `.offcanvas` and the `data-bs-toggle="offcanvas"` pattern
- Position an offcanvas panel from any of four edges
- Structure header/body content and wire up dismissal
- Understand backdrop and scroll-locking behavior, and when to disable them
- Recognize the responsive offcanvas pattern for building mobile-friendly sidebars

## Introduction
Offcanvas panels are essentially a full-height (or full-width) sliding drawer — commonly used for mobile navigation menus, filter panels, or shopping cart previews. Structurally, they reuse almost every convention you've built up across this module: the `data-bs-toggle` pattern from Lessons 01 and 05, the `.btn-close` component from Module 06, and `aria-*` attributes matching the tab/navbar patterns from earlier in this module.

## Basic Offcanvas
```html
<button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" 
        data-bs-target="#mainOffcanvas" aria-controls="mainOffcanvas">
  Open menu
</button>

<div class="offcanvas offcanvas-start" tabindex="-1" id="mainOffcanvas" 
     aria-labelledby="mainOffcanvasLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="mainOffcanvasLabel">Menu</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <p>Offcanvas content goes here.</p>
  </div>
</div>
```

Notice this uses the exact same `data-bs-dismiss="offcanvas"` + `.btn-close` combination first introduced in Module 06, Lesson 06 — the close button component genuinely doesn't care what kind of component it's closing, it just needs the right `data-bs-dismiss` target value.

## Positioning
Four directional classes control which edge the panel slides in from:

```html
<div class="offcanvas offcanvas-start">...</div>  <!-- left edge -->
<div class="offcanvas offcanvas-end">...</div>    <!-- right edge -->
<div class="offcanvas offcanvas-top">...</div>    <!-- top edge -->
<div class="offcanvas offcanvas-bottom">...</div> <!-- bottom edge -->
```

`.offcanvas-start`/`.offcanvas-end` (rather than `-left`/`-right`) follow the same logical, direction-aware naming convention as `.border-start`/`.border-end` from Module 04, Lesson 03 — this matters for the same reason: correct behavior under RTL layouts, covered fully in Module 11.

## Backdrop and Scroll Behavior
By default, opening an offcanvas dims the rest of the page with a backdrop and locks page scrolling — similar to how a modal will behave in Module 08. Both behaviors can be turned off via data attributes when you want a less intrusive panel (e.g. a persistent filter sidebar that shouldn't block interaction with the rest of the page):

```html
<div class="offcanvas offcanvas-start" data-bs-backdrop="false" data-bs-scroll="true" 
     tabindex="-1" id="filterPanel">
  ...
</div>
```

`data-bs-backdrop="false"` removes the dimming overlay entirely; `data-bs-scroll="true"` allows the page body to keep scrolling behind the open panel instead of locking it.

## Responsive Offcanvas
A very common real-world pattern: an offcanvas that behaves as a normal sliding drawer on mobile, but appears as a permanently visible, non-overlapping sidebar at wider viewports:

```html
<div class="offcanvas-lg offcanvas-start" tabindex="-1" id="responsiveSidebar">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title">Filters</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <p>Filter controls here.</p>
  </div>
</div>
```

Using `.offcanvas-lg` instead of plain `.offcanvas` means: below the `lg` breakpoint it behaves as a normal toggleable sliding offcanvas; at `lg` and above, it renders inline as a static, always-visible sidebar with no backdrop or toggle needed — directly analogous to how `.navbar-expand-lg` controlled the navbar's responsive collapse behavior in Lesson 01.

## Practical Example
A mobile filter drawer that becomes a static sidebar on larger screens:

```html
<button class="btn btn-outline-secondary d-lg-none" type="button" 
        data-bs-toggle="offcanvas" data-bs-target="#filterOffcanvas">
  Filters
</button>

<div class="offcanvas-lg offcanvas-start" tabindex="-1" id="filterOffcanvas" 
     aria-labelledby="filterOffcanvasLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="filterOffcanvasLabel">Filters</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div class="form-check mb-2">
      <input class="form-check-input" type="checkbox" id="inStockOnly">
      <label class="form-check-label" for="inStockOnly">In stock only</label>
    </div>
  </div>
</div>
```

`.d-lg-none` on the trigger button hides it entirely at `lg` and above, since the sidebar is always visible there and needs no toggle button at all.

## Revision Questions

<details>
<summary>1. What earlier component's exact dismiss pattern does the offcanvas close button reuse?</summary>
`.btn-close` + `data-bs-dismiss` from Module 06, Lesson 06 — the same generic close button component, simply pointed at `data-bs-dismiss="offcanvas"` instead of `"alert"`.
</details>

<details>
<summary>2. Why does Bootstrap use `.offcanvas-start`/`.offcanvas-end` instead of `-left`/`-right`?</summary>
Same reasoning as `.border-start`/`.border-end` in Module 04 — logical, direction-aware naming ensures correct behavior when the page is rendered right-to-left.
</details>

<details>
<summary>3. What do `data-bs-backdrop="false"` and `data-bs-scroll="true"` each disable?</summary>
`data-bs-backdrop="false"` removes the dimming overlay behind the panel; `data-bs-scroll="true"` allows the page body to keep scrolling behind the open offcanvas instead of locking scroll.
</details>

<details>
<summary>4. What does `.offcanvas-lg` do differently from plain `.offcanvas`, and what earlier lesson's pattern does this mirror?</summary>
Below `lg` it behaves as a normal toggleable sliding panel; at `lg` and above it renders as a static, always-visible inline sidebar with no toggle needed — directly mirroring how `.navbar-expand-lg` controlled the navbar's collapse breakpoint in Lesson 01.
</details>
