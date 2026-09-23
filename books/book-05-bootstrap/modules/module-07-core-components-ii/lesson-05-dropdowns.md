# Lesson 05: Dropdowns

## Learning Objectives
- Build a toggleable dropdown menu with `.dropdown`, `.dropdown-toggle`, `.dropdown-menu`
- Add dividers, headers, and disabled items inside a dropdown
- Use split-button dropdowns
- Position dropdowns (`.dropend`, `.dropstart`, `.dropup`) and understand dropdown alignment
- Recognize this as your first preview of Popper-powered positioning, ahead of Module 08

## Introduction
Dropdowns are the most JavaScript-dependent component covered so far in this book — while Lessons 01–04 relied on Bootstrap's collapse/tab JS, dropdowns additionally use a positioning library (Popper) bundled with Bootstrap to intelligently place the menu so it doesn't overflow off-screen. This makes dropdowns a natural bridge into Module 08, which covers interactive JS-driven components in full depth.

## Basic Dropdown
```html
<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" 
          data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Action</a></li>
    <li><a class="dropdown-item" href="#">Another action</a></li>
    <li><a class="dropdown-item" href="#">Something else</a></li>
  </ul>
</div>
```

The now-familiar `data-bs-toggle` pattern reappears here (`data-bs-toggle="dropdown"`), and `aria-expanded` again gets automatically managed by Bootstrap's JS — same conventions as the navbar toggler in Lesson 01. The `.btn` classes on the toggle button mean a dropdown trigger is, structurally, just a regular Module 06 button with one extra data attribute and a sibling menu.

## Dividers, Headers, and Disabled Items
```html
<ul class="dropdown-menu">
  <li><h6 class="dropdown-header">Account</h6></li>
  <li><a class="dropdown-item" href="#">Profile</a></li>
  <li><a class="dropdown-item" href="#">Settings</a></li>
  <li><hr class="dropdown-divider"></li>
  <li><a class="dropdown-item disabled" aria-disabled="true">Deactivated option</a></li>
</ul>
```

## Split-Button Dropdowns
A common pattern: a primary action button attached to a secondary dropdown-only toggle:

```html
<div class="btn-group">
  <button type="button" class="btn btn-primary">Save</button>
  <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" 
          data-bs-toggle="dropdown" aria-expanded="false">
    <span class="visually-hidden">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Save as draft</a></li>
    <li><a class="dropdown-item" href="#">Save and publish</a></li>
  </ul>
</div>
```

This directly reuses `.btn-group` from Module 06, Lesson 02 — a split dropdown is structurally a two-button group where the second button happens to trigger a menu instead of an independent action. `.dropdown-toggle-split` removes the left margin/caret spacing so the two buttons sit flush, and `.visually-hidden` (from Module 05) again supplies a label for the icon-only toggle segment.

## Directional Variants
By default, menus open downward and left-aligned. Change direction with:

```html
<div class="dropup">...</div>      <!-- opens upward -->
<div class="dropend">...</div>     <!-- opens to the right -->
<div class="dropstart">...</div>   <!-- opens to the left -->
```

Right-align the menu itself (keeping it opening downward) with `.dropdown-menu-end`:

```html
<ul class="dropdown-menu dropdown-menu-end">...</ul>
```

## Why Popper Matters Here
Unlike the collapse-based components in Lessons 01–02, a dropdown menu's position needs to dynamically adjust based on available viewport space — a dropdown near the bottom of the screen should flip to open upward automatically rather than getting clipped off-screen. This is handled by Popper (a positioning library bundled with Bootstrap's full JS bundle), running automatically behind the `data-bs-toggle="dropdown"` attribute with no configuration needed for standard use cases.

## Practical Example
A user account menu combining header, items, divider, and disabled state:

```html
<div class="dropdown">
  <button class="btn btn-outline-secondary dropdown-toggle" type="button" 
          data-bs-toggle="dropdown" aria-expanded="false">
    Jordan Lee
  </button>
  <ul class="dropdown-menu dropdown-menu-end">
    <li><h6 class="dropdown-header">Signed in as Jordan</h6></li>
    <li><a class="dropdown-item" href="#">Your profile</a></li>
    <li><a class="dropdown-item" href="#">Settings</a></li>
    <li><hr class="dropdown-divider"></li>
    <li><a class="dropdown-item disabled" aria-disabled="true">Billing (unavailable)</a></li>
    <li><a class="dropdown-item" href="#">Sign out</a></li>
  </ul>
</div>
```

## Revision Questions

<details>
<summary>1. What library, bundled with Bootstrap's JS, handles a dropdown's dynamic positioning?</summary>
Popper — it automatically repositions the menu (e.g. flipping upward near the bottom of the viewport) so it doesn't get clipped off-screen, without needing manual configuration for standard cases.
</details>

<details>
<summary>2. What earlier module's component is a split-button dropdown structurally built from?</summary>
`.btn-group` from Module 06, Lesson 02 — a split dropdown is a two-button group where the second button triggers a menu instead of an independent action.
</details>

<details>
<summary>3. What does `.dropdown-toggle-split` specifically do?</summary>
It removes the left margin/caret spacing between the two buttons in a split dropdown so they sit flush against each other, visually reading as one connected control.
</details>

<details>
<summary>4. How do you right-align a dropdown menu while keeping it opening downward?</summary>
Add `.dropdown-menu-end` to the `.dropdown-menu` element — this only changes horizontal alignment, unlike `.dropend`/`.dropstart`, which change the entire opening direction.
</details>
