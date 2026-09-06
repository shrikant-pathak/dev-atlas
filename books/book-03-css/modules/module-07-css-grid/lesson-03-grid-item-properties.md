# Lesson 03: Grid Item Properties

## Learning Objectives
By the end of this lesson, you will be able to:
- Position individual items using `grid-column` and `grid-row`.
- Understand line-based placement vs. spanning.
- Override an individual item's alignment with `justify-self` / `align-self`.

---

# Introduction

Lesson 02 shaped the grid itself; this lesson controls where individual **items** sit within it — the Grid equivalent of Module 06, Lesson 03's flex item properties. Where Flexbox items mostly just flowed in order, Grid items can be placed explicitly, anywhere on the grid, in any order.

---

# Line-Based Placement

Recall the grid line numbering from Lesson 01's diagram — lines are numbered starting at 1, and every property in this lesson references those numbers.

```css
.item {
  grid-column-start: 1;
  grid-column-end: 3;
  grid-row-start: 1;
  grid-row-end: 2;
}
```

This places an item starting at column line 1, ending at column line 3 (spanning two column tracks), confined to the first row track. The shorthand form is far more common in practice:

```css
.item {
  grid-column: 1 / 3;
  grid-row: 1 / 2;
}
```

---

# The `span` Keyword

Recall this from the 12-column lesson preview — instead of specifying an end line explicitly, `span` lets you say "extend N tracks from the start line":

```css
.item {
  grid-column: 1 / span 2; /* start at line 1, span 2 columns */
  grid-row: span 2;         /* start wherever auto-placement puts it, span 2 rows */
}
```

`span` is usually the more maintainable choice — if you insert a new column into the grid later, "span 2" still means "2 columns wide," whereas a hardcoded end line (`/ 3`) might now be wrong.

---

# Shorthand: `grid-area`

```css
.item {
  grid-area: 1 / 1 / 3 / 4; /* row-start / column-start / row-end / column-end */
}
```

One property, four values, in the order row-start, column-start, row-end, column-end. This is genuinely easy to get backwards (columns come second, not first) — Lesson 04 introduces a far more readable alternative for this exact use case: named template areas.

---

# Overlapping Items

Because placement is explicit, items can overlap — something Flexbox has no real equivalent for:

```css
.background {
  grid-area: 1 / 1 / 3 / 3;
}
.foreground {
  grid-area: 1 / 1 / 2 / 2;
}
```

Both items occupy the same starting cell; `.foreground` will render on top of `.background` in source order (or per `z-index`, if set — recall stacking contexts from Module 05).

---

# Self-Alignment

```css
.item {
  justify-self: end;  /* overrides justify-items for this one item */
  align-self: center; /* overrides align-items for this one item */
}
```

Directly parallel to Flexbox's `align-self` from Module 06 — the container sets a default alignment for all items (Lesson 02's `justify-items` / `align-items`), and any individual item can opt out with its own `-self` value.

---

# Practical Example: A Featured Item in a Grid

```html
<div class="grid">
  <div class="featured">Featured</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
</div>
```
```css
.grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  grid-auto-rows: 100px;
  gap: 1rem;
}
.featured {
  grid-column: span 2;
  grid-row: span 2;
}
```

The `.featured` item takes up a 2×2 block while the rest of the items fall into place automatically around it — a common pattern for hero cards in dashboards and article grids.

---

# Revision Questions

1. What's the difference between `grid-column: 1 / 3` and `grid-column: 1 / span 3`?
2. In what order does `grid-area`'s shorthand take its four values?
3. Can Grid items overlap? Can Flexbox items?

<details><summary>Answers</summary>

1. `1 / 3` places the item's edges at lines 1 and 3 (spanning 2 tracks); `1 / span 3` starts at line 1 and spans 3 tracks (ending at line 4).
2. row-start / column-start / row-end / column-end.
3. Yes, Grid items can overlap because placement is explicit and independent per item. Flexbox items generally can't meaningfully overlap since they flow along a single axis in sequence.

</details>
