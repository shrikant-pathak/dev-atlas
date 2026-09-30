# Lesson 01: Display and Visibility

## Learning Objectives
- Apply Tailwind's display utilities to control an element's layout mode
- Distinguish `hidden` (removed from layout) from `invisible` (hidden but still occupies space)
- Use `sr-only` to hide content visually while keeping it accessible to screen readers

## Introduction
Recall from Book 03 that every HTML element has a default `display` value — block for `<div>`/`<p>`, inline for `<span>`/`<a>`, and so on — and that changing it (to `flex`, `grid`, `none`) is one of the most common layout operations in CSS. Tailwind exposes every `display` value as a utility class, so you set it directly on the element instead of writing a CSS rule.

## Display Utilities
| Class | CSS |
|---|---|
| `block` | `display: block` |
| `inline-block` | `display: inline-block` |
| `inline` | `display: inline` |
| `flex` | `display: flex` |
| `inline-flex` | `display: inline-flex` |
| `grid` | `display: grid` |
| `inline-grid` | `display: inline-grid` |
| `table` | `display: table` |
| `contents` | `display: contents` |
| `hidden` | `display: none` |

`flex` and `grid` are the two you'll use constantly — full coverage starts in Lesson 7 (Flexbox) and Lesson 10 (Grid) of this module.

## Visibility vs. Display: `hidden` vs `invisible`

These are easy to confuse but behave very differently:

- **`hidden`** sets `display: none` — the element is removed from the layout entirely. Other elements shift to fill the space, exactly as if the element didn't exist in the DOM.
- **`invisible`** sets `visibility: hidden` — the element becomes invisible, but its space in the layout is preserved. Other elements do not shift.

```html
<div class="flex gap-4">
  <div class="bg-blue-500 p-4">A</div>
  <div class="hidden bg-red-500 p-4">B (hidden — space collapses)</div>
  <div class="bg-green-500 p-4">C</div>
</div>

<div class="flex gap-4">
  <div class="bg-blue-500 p-4">A</div>
  <div class="invisible bg-red-500 p-4">B (invisible — space preserved)</div>
  <div class="bg-green-500 p-4">C</div>
</div>
```

In the first row, C sits directly next to A. In the second, there's a gap where B "would be."

## `sr-only`: Visually Hidden, Accessible

Sometimes content should exist for screen readers but not be visually shown — a form label that's redundant visually but needed for accessibility, or extra context for an icon-only button. Tailwind's `sr-only` utility handles this with a well-known accessibility technique: it visually clips the element to a single pixel while keeping it in the accessibility tree.

```html
<button>
  <svg class="h-5 w-5"><!-- trash icon --></svg>
  <span class="sr-only">Delete item</span>
</button>
```

A sighted user sees only the icon; a screen reader announces "Delete item." Use `not-sr-only` (often paired with a responsive variant, e.g., `md:not-sr-only`) to reveal the content again at larger breakpoints if needed.

## Practical Example

A responsive nav that shows a hamburger icon on mobile and full links on desktop, using `hidden` combined with a responsive variant (previewed here, covered fully in Module 05):

```html
<nav class="flex items-center justify-between p-4">
  <span class="font-bold">Logo</span>
  <button class="md:hidden">☰</button>
  <div class="hidden gap-6 md:flex">
    <a href="#">Home</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
  </div>
</nav>
```

## Summary
Tailwind exposes every CSS `display` value as a utility class. `hidden` removes an element from layout entirely; `invisible` hides it visually while preserving its space. `sr-only` visually hides content while keeping it available to assistive technology.

## Revision Questions

<details>
<summary>1. What's the practical difference between `hidden` and `invisible`?</summary>

`hidden` (`display: none`) removes the element from layout entirely — other elements shift to fill the gap. `invisible` (`visibility: hidden`) hides it visually but preserves its layout space — nothing shifts.
</details>

<details>
<summary>2. When would you use `sr-only` instead of `hidden`?</summary>

When content should be available to screen readers but not shown visually — e.g., a label for an icon-only button. `hidden` would remove it from the accessibility tree entirely; `sr-only` keeps it accessible while visually clipping it.
</details>

<details>
<summary>3. What CSS property and value does the `contents` utility set, and what's unusual about its effect?</summary>

`display: contents`. It makes the element itself disappear from the box/layout tree while its children render as if they were direct children of the element's parent — the element still exists in the DOM, just not as a layout box.
</details>
