# Lesson 07: Flexbox Basics

## Learning Objectives
- Enable a flex container and control its main-axis direction
- Control wrapping behavior with `flex-wrap`
- Recognize flexbox as Tailwind's primary tool for one-dimensional layouts

## Introduction
Book 03 introduced Flexbox as a one-dimensional layout model — arranging items along a single row or column, with powerful control over spacing, alignment, and ordering. Tailwind exposes essentially every Flexbox CSS property as a utility class, so everything you learned there transfers directly — you're just writing it as classes instead of a CSS rule block.

## Enabling Flex

```html
<div class="flex">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>
```

`flex` sets `display: flex` on the container — its direct children immediately become flex items, laid out in a row by default. `inline-flex` does the same but with `display: inline-flex`, useful when the container itself needs to sit inline with surrounding text.

## Direction

| Class | CSS |
|---|---|
| `flex-row` | `flex-direction: row` (default) |
| `flex-row-reverse` | `flex-direction: row-reverse` |
| `flex-col` | `flex-direction: column` |
| `flex-col-reverse` | `flex-direction: column-reverse` |

```html
<div class="flex flex-col gap-2 md:flex-row">
  <div class="bg-blue-200 p-4">A</div>
  <div class="bg-blue-200 p-4">B</div>
  <div class="bg-blue-200 p-4">C</div>
</div>
```

This is one of the single most common responsive patterns in Tailwind: stack vertically on mobile (`flex-col`), switch to a horizontal row at a breakpoint (`md:flex-row`) — full responsive variant coverage is in Module 05, but this pattern is worth internalizing now since you'll use it constantly.

## Wrapping

By default, flex items try to fit on a single line, shrinking as needed. `flex-wrap` allows them to wrap onto multiple lines instead:

| Class | CSS |
|---|---|
| `flex-nowrap` | `flex-wrap: nowrap` (default) |
| `flex-wrap` | `flex-wrap: wrap` |
| `flex-wrap-reverse` | `flex-wrap: wrap-reverse` |

```html
<div class="flex flex-wrap gap-2">
  <span class="rounded-full bg-gray-200 px-3 py-1">Tag 1</span>
  <span class="rounded-full bg-gray-200 px-3 py-1">Tag 2</span>
  <span class="rounded-full bg-gray-200 px-3 py-1">Tag 3</span>
  <!-- more tags will wrap to a new line instead of overflowing -->
</div>
```

## Practical Example

A card component demonstrating the direction + wrap combination, plus a preview of alignment (fully covered in Lesson 9):

```html
<div class="flex flex-col gap-4 rounded-lg border p-6 md:flex-row md:items-center">
  <img class="size-16 rounded-full" src="/avatar.jpg" alt="Author" />
  <div>
    <h3 class="font-semibold">Jane Cooper</h3>
    <p class="text-sm text-gray-500">Product Designer</p>
  </div>
</div>
```

On mobile, the avatar stacks above the text (`flex-col`); at `md` and up, they sit side by side (`md:flex-row`), vertically centered (`md:items-center`).

## Summary
`flex`/`inline-flex` enable Flexbox layout. `flex-row`/`flex-col` (and their `-reverse` variants) set the main axis direction — stacking vertically on mobile and switching to a row at a breakpoint is one of the most common responsive patterns you'll write. `flex-wrap` allows items to flow onto multiple lines instead of shrinking to fit one.

## Revision Questions

<details>
<summary>1. What's the difference between `flex` and `inline-flex`?</summary>

Both create a flex container for their children, but `flex` sets `display: flex` (block-level container) while `inline-flex` sets `display: inline-flex` (the container itself flows inline with surrounding content).
</details>

<details>
<summary>2. What does the combination `flex flex-col md:flex-row` achieve, and why is it so common?</summary>

It stacks children vertically by default (mobile-friendly) and switches to a horizontal row once the viewport reaches the `md` breakpoint — a standard pattern for making a layout responsive without writing custom media queries.
</details>

<details>
<summary>3. What happens to flex items by default if their combined width exceeds the container, without `flex-wrap`?</summary>

They shrink (per their `flex-shrink` value, covered in the next lesson) to fit on a single line rather than wrapping — `flex-wrap` is needed to allow wrapping onto multiple lines instead.
</details>
