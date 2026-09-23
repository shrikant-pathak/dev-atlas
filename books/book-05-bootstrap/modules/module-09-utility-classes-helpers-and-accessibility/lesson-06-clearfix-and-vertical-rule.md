# Lesson 06: Clearfix and Vertical Rule

## Learning Objectives
- Apply `.clearfix` to contain floated children within a parent
- Understand why clearfix matters less in a flex/grid-first framework, but still appears
- Apply `.vr` to create a vertical divider line between inline/flex content
- Recognize when to reach for `.vr` versus a `.border-start`/`.border-end`

## Introduction
This lesson pairs two small, single-purpose utilities that solve very specific, narrow layout problems — one a legacy-leaning fix for an older CSS technique (floats), the other a modern convenience for a specific divider pattern you've already glimpsed briefly in Lesson 04.

## Clearfix
`.clearfix` solves a classic CSS problem: when all of a container's children are floated (`float: left`/`float: right`), the parent container collapses to zero height, since floated elements are removed from normal document flow:

```html
<div class="clearfix">
  <img src="thumbnail.jpg" class="float-start me-2" alt="Thumbnail" style="width: 100px;">
  <p>Some text that wraps around the floated image on its right side.</p>
</div>
```

Without `.clearfix` on the parent, the container wouldn't properly contain the floated image's height — content after it could overlap unpredictably.

## Why This Matters Less in a Flex/Grid-First Book
It's worth being direct about this: everything you've built since Module 02 has used the grid system or flex utilities, NOT floats, for layout. `.clearfix` is included here mainly because you'll still encounter float-based patterns in the wild — a floated image beside wrapped text (as above) is a genuinely reasonable, still-common use of `float`, since flexbox doesn't have a clean equivalent for "text wraps around this specific shape." For actual layout structure (rows, columns, alignment), you should continue reaching for the grid (Module 02) and flex utilities (Lesson 01) covered elsewhere in this book — floats and clearfix are a narrow, specific tool, not a general layout approach.

## Vertical Rule
`.vr` renders a simple vertical divider line, sized to match the height of its surrounding flex/inline content:

```html
<div class="hstack gap-3">
  <span>Home</span>
  <div class="vr"></div>
  <span>About</span>
  <div class="vr"></div>
  <span>Contact</span>
</div>
```

This is the exact utility previewed without explanation in Lesson 04's `.hstack` example — a lightweight visual separator that automatically sizes to its flex container's height, unlike a manually-styled `<div>` with a fixed pixel height that would need adjusting whenever surrounding content changes size.

## `.vr` vs. `.border-start`/`.border-end`
Both can visually produce a vertical line, so it's worth distinguishing when to use which: `.vr` is purpose-built as a standalone divider element meant to sit BETWEEN two pieces of content in a flex row, and it automatically matches surrounding height. `.border-start`/`.border-end` (from Module 04, Lesson 03) are meant to add a border to one side of an EXISTING element — appropriate when you already have a card, column, or container and want to add a dividing line to one of its edges, rather than inserting a brand-new dedicated divider element.

## Practical Example
A footer combining a legacy-style floated logo-with-wrapped-text block and a modern flex-based link list with vertical rules:

```html
<footer>
  <div class="clearfix mb-3">
    <img src="logo-small.png" class="float-start me-2" style="width: 60px;" alt="Logo">
    <p class="mb-0">Dev Atlas is a self-paced curriculum covering modern web development, from HTML fundamentals through full-stack frameworks.</p>
  </div>
  <div class="hstack gap-2">
    <a href="#" class="text-body-secondary">Privacy</a>
    <div class="vr"></div>
    <a href="#" class="text-body-secondary">Terms</a>
    <div class="vr"></div>
    <a href="#" class="text-body-secondary">Contact</a>
  </div>
</footer>
```

## Revision Questions

<details>
<summary>1. What problem does `.clearfix` solve, and why does it exist at all?</summary>
When all of a container's children are floated, the parent collapses to zero height since floated elements are removed from normal document flow; `.clearfix` forces the parent to properly contain the floated content's height.
</details>

<details>
<summary>2. Should `.clearfix` and floats be your default approach to page layout in this book?</summary>
No — the grid system (Module 02) and flex utilities (Lesson 01) should be used for actual layout structure; floats/clearfix are a narrow tool still reasonably used for a specific case like text wrapping around a floated image, not a general layout approach.
</details>

<details>
<summary>3. What advantage does `.vr` have over a manually-styled `<div>` with a fixed height as a divider?</summary>
`.vr` automatically sizes itself to match the height of its surrounding flex/inline content, so it doesn't need manual height adjustment whenever surrounding content changes size.
</details>

<details>
<summary>4. When would you choose `.border-start`/`.border-end` over `.vr` for a vertical line?</summary>
When you already have an existing element (a card, a column) and want to add a dividing line to one of its edges, rather than inserting a brand-new standalone divider element between two separate pieces of content.
</details>
