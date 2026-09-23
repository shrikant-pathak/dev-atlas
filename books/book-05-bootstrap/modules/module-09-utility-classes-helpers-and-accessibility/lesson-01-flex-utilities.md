# Lesson 01: Flex Utilities

## Learning Objectives
- Apply `.d-flex`/`.d-inline-flex` and understand flex as a display value, not a separate system
- Control direction, wrapping, alignment, and justification
- Use `.flex-grow-*`/`.flex-shrink-*` and `.flex-fill`
- Apply responsive flex utilities with breakpoint infixes
- Consolidate flex knowledge used implicitly since Module 02

## Introduction
You've been using flex utilities piecemeal since Module 02's grid coverage and throughout every module since — `.d-flex`, `.justify-content-between`, `.align-items-center`, `.flex-column` have all appeared in navbar, card, and list group examples. This lesson is the first to treat the flex utility system as a complete, standalone topic rather than incidental tool-grabbing, filling in the full picture behind classes you've already been using.

## Flex as a Display Value
`.d-flex` isn't a separate utility category — it's one value of the same `.d-*` display utility family covered fully in Lesson 02. Setting `display: flex` on a container makes its direct children flex items automatically:

```html
<div class="d-flex">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

`.d-inline-flex` does the same but makes the container itself inline rather than block-level — useful when the flex container needs to sit inline with surrounding text or elements.

## Direction
```html
<div class="d-flex flex-row">...</div>        <!-- default: left to right -->
<div class="d-flex flex-row-reverse">...</div>
<div class="d-flex flex-column">...</div>       <!-- top to bottom -->
<div class="d-flex flex-column-reverse">...</div>
```

`.flex-column` is the exact class that turned a horizontal nav into a vertical sidebar back in Module 07, Lesson 02 — same class, general-purpose utility.

## Justify Content (Main Axis) and Align Items (Cross Axis)
These two utility groups are the ones you'll reach for constantly, and it's worth being explicit about which axis each controls:

```html
<div class="d-flex justify-content-start">...</div>
<div class="d-flex justify-content-center">...</div>
<div class="d-flex justify-content-between">...</div>
<div class="d-flex justify-content-around">...</div>
<div class="d-flex justify-content-evenly">...</div>

<div class="d-flex align-items-start">...</div>
<div class="d-flex align-items-center">...</div>
<div class="d-flex align-items-end">...</div>
```

`justify-content-*` controls spacing along the main axis (horizontal, by default, in a row); `align-items-*` controls alignment along the cross axis (vertical, by default). This is exactly the mechanism behind the navbar's search-button-pushed-to-the-end pattern (Module 07) and the notification list's badge-on-the-right pattern (Module 07, Lesson 07) — both used `justify-content-between` to push content to opposite ends of a row.

## Wrapping
```html
<div class="d-flex flex-wrap">...</div>
<div class="d-flex flex-nowrap">...</div>
```

By default, flex items shrink to fit on one line (`flex-nowrap`, the default). `.flex-wrap` allows items to wrap onto multiple lines once they no longer fit — necessary for something like a tag list of unpredictable length.

## Grow, Shrink, and Fill
```html
<div class="d-flex">
  <div class="flex-grow-1">Grows to fill remaining space</div>
  <div>Fixed-size sibling</div>
</div>

<div class="d-flex">
  <div class="flex-fill">Fills equally</div>
  <div class="flex-fill">Fills equally</div>
</div>
```

`.flex-grow-1` makes a single item expand to consume any leftover space in the row, while siblings stay their natural size — useful for a flexible main content area beside a fixed-width sidebar. `.flex-fill` applied to multiple siblings makes them share available space equally amongst themselves.

## Responsive Flex Utilities
Like nearly every utility in this book, flex classes accept breakpoint infixes:

```html
<div class="d-flex flex-column flex-md-row">
  Stacks vertically on mobile, becomes a horizontal row from md up.
</div>
```

## Practical Example
A card footer with a flexible spacer pushing one button to the far side, stacking on mobile:

```html
<div class="d-flex flex-column flex-sm-row justify-content-between align-items-center gap-2">
  <span class="text-body-secondary">Last updated 3 days ago</span>
  <div class="d-flex gap-2">
    <button class="btn btn-outline-secondary btn-sm">Cancel</button>
    <button class="btn btn-primary btn-sm">Save</button>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. Is `.d-flex` a separate utility system from `.d-block`/`.d-none`, or part of the same family?</summary>
Part of the same family — `.d-flex` is simply the `flex` value of the general `.d-*` display utility, covered fully in Lesson 02, not a standalone system.
</details>

<details>
<summary>2. What's the difference between what `justify-content-*` and `align-items-*` control?</summary>
`justify-content-*` controls spacing/alignment along the main axis (horizontal by default in a row); `align-items-*` controls alignment along the cross axis (vertical by default).
</details>

<details>
<summary>3. Where has `.justify-content-between` already been used implicitly earlier in this book?</summary>
The navbar's search-button-to-the-end pattern (Module 07) and the notification list's badge-pushed-right pattern (Module 07, Lesson 07) both rely on this exact class to push content to opposite ends of a row.
</details>

<details>
<summary>4. What's the difference between `.flex-grow-1` on a single item and `.flex-fill` on multiple siblings?</summary>
`.flex-grow-1` on one item makes just that item expand to consume leftover space while siblings stay their natural size; `.flex-fill` applied to multiple siblings makes them share the available space equally among themselves.
</details>
