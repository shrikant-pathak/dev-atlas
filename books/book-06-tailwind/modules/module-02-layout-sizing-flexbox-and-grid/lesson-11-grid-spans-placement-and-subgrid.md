# Lesson 11: Grid Spans, Placement, and Subgrid

## Learning Objectives
- Make grid items span multiple columns or rows with `col-span-*`/`row-span-*`
- Precisely place items using explicit start/end lines
- Use `subgrid` to align nested grids to their parent's tracks

## Introduction
Lesson 10 covered defining a grid's overall tracks. This lesson covers controlling individual items within that grid — making some items larger than others, placing items at exact positions, and the more advanced `subgrid` feature for aligning nested grids.

## Spanning Multiple Columns or Rows

```html
<div class="grid grid-cols-4 gap-4">
  <div class="col-span-2 bg-blue-200 p-4">Spans 2 columns</div>
  <div class="bg-blue-200 p-4">1 col</div>
  <div class="bg-blue-200 p-4">1 col</div>
</div>
```

`col-span-2` makes an item occupy two column tracks instead of one — the classic "featured item" pattern in a grid of otherwise-equal cards. `row-span-*` does the same for rows, useful for a tall featured image sitting alongside several shorter items.

```html
<div class="grid grid-cols-3 grid-rows-2 gap-4">
  <div class="row-span-2 bg-blue-300 p-4">Tall featured item</div>
  <div class="bg-blue-100 p-4">Small 1</div>
  <div class="bg-blue-100 p-4">Small 2</div>
  <div class="bg-blue-100 p-4">Small 3</div>
  <div class="bg-blue-100 p-4">Small 4</div>
</div>
```

## Explicit Placement

For precise control beyond simple spans, `col-start-*`/`col-end-*` and `row-start-*`/`row-end-*` place an item at exact grid line numbers:

```html
<div class="grid grid-cols-6 gap-4">
  <div class="col-start-2 col-end-6 bg-blue-200 p-4">
    Starts at line 2, ends at line 6 (spans columns 2–5)
  </div>
</div>
```

Grid lines are numbered starting at 1, so in a 6-column grid, `col-start-2 col-end-6` occupies columns 2 through 5 — leaving one empty column on each side, a common way to create asymmetric margins without extra wrapper elements.

## Subgrid

Ordinarily, a nested grid inside a grid item defines its own independent tracks, which won't align with the parent grid's tracks unless you carefully match sizes by hand. `subgrid` solves this: a nested grid can inherit its parent's column or row tracks directly, so content in different grid items lines up perfectly even though it's nested at different depths.

```html
<div class="grid grid-cols-4 gap-4">
  <div class="col-span-2 grid grid-cols-subgrid gap-4">
    <div class="bg-blue-200 p-4">Nested A</div>
    <div class="bg-blue-200 p-4">Nested B</div>
  </div>
  <div class="bg-blue-100 p-4">Sibling</div>
  <div class="bg-blue-100 p-4">Sibling</div>
</div>
```

Here, the nested grid (`grid-cols-subgrid`) spans 2 of the parent's 4 columns and its own two children align exactly to those same underlying column tracks — useful for card layouts where each card has an internal grid (image, title, description) that needs to align across every card in a row, even though each card is its own nested grid container.

## Practical Example

A magazine-style layout: one large featured article spanning two rows, with smaller articles filling the rest:

```html
<div class="grid grid-cols-3 grid-rows-2 gap-6">
  <article class="col-span-2 row-span-2 rounded-lg bg-gray-100 p-6">
    Featured Article
  </article>
  <article class="rounded-lg bg-gray-100 p-6">Article 2</article>
  <article class="rounded-lg bg-gray-100 p-6">Article 3</article>
</div>
```

## Summary
`col-span-*`/`row-span-*` make an item occupy multiple tracks. `col-start-*`/`col-end-*` (and their row equivalents) place items at exact grid line numbers for precise, asymmetric layouts. `subgrid` lets a nested grid inherit its parent's tracks directly, keeping nested content aligned across sibling items — a common need in card-based designs.

## Revision Questions

<details>
<summary>1. In a `grid-cols-6` container, what columns does an item with `col-start-2 col-end-6` occupy?</summary>

Columns 2 through 5 (grid lines are numbered starting at 1, so `col-start-2 col-end-6` spans from line 2 to line 6, covering four column tracks with one empty column on each side).
</details>

<details>
<summary>2. What problem does `subgrid` solve that a plain nested grid doesn't?</summary>

A plain nested grid defines its own independent tracks that won't align with the parent grid's tracks unless manually matched. `subgrid` lets the nested grid inherit the parent's tracks directly, so nested content aligns precisely across sibling items — useful when each card in a row has its own internal grid that needs to line up with the others.
</details>

<details>
<summary>3. What class would make a grid item span 2 rows and 2 columns simultaneously?</summary>

`row-span-2 col-span-2`
</details>
