# Lesson 01: CSS Grid Intro

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what CSS Grid is and how it differs from Flexbox.
- Activate Grid on a container and understand the grid it creates.
- Identify grid lines, tracks, cells, and areas.

---

# Introduction

Module 06 ended on a deliberate cliffhanger: Flexbox is genuinely excellent, but it's one-dimensional — a row, or a column, never both at once. CSS Grid is the answer to "what if I need to control rows AND columns at the same time?" Photo galleries, dashboards, magazine-style layouts, entire page skeletons — anything with a real two-dimensional structure is Grid's home turf.

---

# Flexbox vs. Grid — The Real Distinction

Recall Module 06, Lesson 01's one-dimensional vs. two-dimensional distinction — this is worth restating precisely, because it's the single most common point of confusion for developers new to Grid:

- **Flexbox** distributes items along one axis; wrapping to a new line is a side effect, not something you control precisely.
- **Grid** lets you define rows and columns explicitly upfront, then place items into specific cells — precise control in both dimensions simultaneously.

In practice, most real interfaces use **both**: Grid for the overall page or component skeleton, Flexbox for the smaller pieces inside each grid cell (aligning icons next to text, spacing out buttons in a card footer, etc.).

---

# Activating Grid

```css
.container {
  display: grid;
}
```

Just like `display: flex` in Module 06, this single declaration changes how the container's direct children behave. Without any other properties, though, Grid doesn't do much visually yet — by default, you get a single-column grid where every child stacks vertically, one per row. The real power comes from `grid-template-columns` and `grid-template-rows` (Lesson 02), which is where Grid actually starts feeling like Grid.

---

# The Vocabulary You Need

Grid introduces a handful of terms that show up constantly for the rest of this module — getting comfortable with them now pays off immediately in Lessons 02–04:

- **Grid line** — the dividing lines that make up the structure of the grid (both row and column lines). Lines are numbered starting at 1.
- **Grid track** — the space between two adjacent grid lines — essentially a row or a column.
- **Grid cell** — the smallest unit of the grid, formed by the intersection of one row track and one column track.
- **Grid area** — any rectangular space spanning one or more cells.

col line 1   col line 2   col line 3   col line 4
      │            │            │            │

row line 1┤ cell │ cell │ cell │
│ │ │ │
row line 2┤────────────┼────────────┼────────────┤
│ │ │ │
row line 3┤ cell │ cell │ cell │
│ │ │ │



Every property in Lessons 02–04 boils down to manipulating these four things: how many tracks exist, how big they are, and which lines an item's edges sit on.

---

# A Minimal Working Example

```html
<div class="grid">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
</div>
```
```css
.grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr;
  gap: 1rem;
}
```

Four items, two columns, two rows — a clean 2×2 arrangement with zero manual positioning. `1fr` (introduced properly in Lesson 02) means "one fraction of the available space," and `gap` works exactly the way it did in Flexbox.

---

# Browser Support Note

CSS Grid has been supported in all major browsers since 2017, so in modern development you can generally use it without concern. Lesson 06 of this module covers `@supports`, the feature-detection tool for the rare cases where you do need a fallback for an older layout technique.

---

# Revision Questions

1. What is the core difference between Flexbox and Grid?
2. What single declaration activates Grid on a container?
3. Define "grid track" in your own words.

<details><summary>Answers</summary>

1. Flexbox lays items out along a single axis (one dimension); Grid controls rows and columns simultaneously (two dimensions).
2. `display: grid;`
3. A grid track is the space between two adjacent grid lines — it's either a row or a column of the grid.

</details>
