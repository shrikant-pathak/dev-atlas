# Lesson 02: Padding, Margin, and Space Between

## Learning Objectives
- Apply padding and margin utilities using Tailwind's spacing scale
- Use directional shorthands (`px-`, `py-`, `pt-`, etc.) and negative margins
- Use `space-x-*`/`space-y-*` to add consistent gaps between sibling elements

## Introduction
Book 03's box model taught you that every element has padding (inside the border) and margin (outside the border). Tailwind exposes both through a single, shared numeric spacing scale, so `p-4` and `m-4` always represent the same physical size (1rem) — keeping spacing consistent across your whole UI without you tracking pixel values.

## The Spacing Scale

Tailwind's default scale runs roughly: `0, px, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 5, 6, 7, 8, 9, 10, 11, 12, 14, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 72, 80, 96`. Each number maps to `number × 0.25rem` (so `4` = `1rem` = `16px`), except `px` which is a literal `1px`. You rarely need to memorize the full scale — IntelliSense (Module 01, Lesson 5) shows you the pixel value on hover.

## Padding and Margin Utilities

| Prefix | Property |
|---|---|
| `p-4` | padding on all sides |
| `px-4` | padding-left + padding-right |
| `py-4` | padding-top + padding-bottom |
| `pt-4` / `pr-4` / `pb-4` / `pl-4` | one side each |
| `m-4` | margin on all sides |
| `mx-4` / `my-4` | horizontal / vertical margin |
| `mt-4` / `mr-4` / `mb-4` / `ml-4` | one side each |

```html
<div class="mx-auto max-w-md p-6">
  <p class="mb-4">First paragraph.</p>
  <p>Second paragraph.</p>
</div>
```

`mx-auto` — margin-left and margin-right both set to `auto` — is the classic horizontal-centering trick from Book 03, now as a one-word class.

## Negative Margins

Prefix any margin utility with a dash to make it negative:

```html
<div class="-mt-4">Pulled up by 1rem</div>
```

Useful for overlapping elements slightly, like a badge sitting partially over a card's edge.

## Spacing Between Siblings: `space-x-*` and `space-y-*`

A very common pattern is wanting consistent spacing between a list of sibling elements, without adding margin to the first or last child individually. `space-y-4` applies margin-top to every child except the first:

```html
<div class="space-y-4">
  <div class="rounded bg-gray-100 p-4">Item 1</div>
  <div class="rounded bg-gray-100 p-4">Item 2</div>
  <div class="rounded bg-gray-100 p-4">Item 3</div>
</div>
```

This is equivalent to manually adding `mt-4` to items 2 and 3 only, but adapts automatically if you add or remove items. `space-x-4` does the same horizontally (margin-left on every child but the first) — commonly used on a `flex` row of buttons or icons.

Note that `space-x-*`/`space-y-*` differ from `gap-*` (covered in Lesson 9): `gap` only works inside `flex` or `grid` containers, while `space-x`/`space-y` work on any set of sibling elements regardless of display mode, since they're implemented via margins on child selectors rather than the CSS `gap` property.

## Practical Example

A card with consistent internal spacing and a row of action buttons with even gaps:

```html
<div class="max-w-sm rounded-lg border p-6">
  <h3 class="mb-2 text-lg font-semibold">Project Alpha</h3>
  <p class="mb-4 text-gray-600">A short project description goes here.</p>
  <div class="flex space-x-2">
    <button class="rounded bg-indigo-600 px-3 py-1 text-white">Edit</button>
    <button class="rounded bg-gray-200 px-3 py-1">Cancel</button>
  </div>
</div>
```

## Summary
Padding and margin share one consistent numeric scale (`p-4`, `m-4`, and their directional variants `px-`/`py-`/`pt-`/etc.). Negative margins use a leading dash. `space-x-*`/`space-y-*` add consistent margin-based spacing between sibling elements, distinct from `gap-*`, which only applies inside flex/grid containers.

## Revision Questions

<details>
<summary>1. What does `p-4` translate to in rem and pixels, using Tailwind's default scale?</summary>

`1rem`, which is `16px` at the default root font size.
</details>

<details>
<summary>2. How would you apply a negative top margin of 1rem?</summary>

`-mt-4`
</details>

<details>
<summary>3. What's the key difference between `space-y-4` and `gap-y-4`?</summary>

`space-y-4` applies margin-top to every child but the first, and works on any sibling elements regardless of display mode. `gap-y-4` uses the CSS `gap` property and only has an effect inside a `flex` or `grid` container.
</details>
