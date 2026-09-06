# Lesson 02: Grid Container Properties

## Learning Objectives
By the end of this lesson, you will be able to:
- Define column and row tracks with `grid-template-columns` / `grid-template-rows`.
- Use `fr`, `repeat()`, `minmax()`, and `auto-fit`/`auto-fill` to build flexible tracks.
- Control spacing with `gap`, and alignment with `justify-items` / `align-items` / `justify-content` / `align-content`.

---

# Introduction

Lesson 01 activated Grid; this lesson is where you actually shape it. Nearly everything here lives on the **container** — the parent element with `display: grid` — mirroring how Module 06, Lesson 02 covered Flexbox's container-level properties before moving to item-level ones in Lesson 03.

---

# Defining Tracks

```css
.grid {
  display: grid;
  grid-template-columns: 200px 1fr 100px;
  grid-template-rows: 100px auto;
}
```

Each length in `grid-template-columns` defines one column track, left to right; each length in `grid-template-rows` defines one row track, top to bottom. This example creates three columns (fixed, flexible, fixed) and two rows (fixed, then sized to content).

**The `fr` unit:** short for "fraction," `fr` divides remaining space proportionally — conceptually similar to `flex-grow` from Module 06, but applied to tracks instead of items.

```css
grid-template-columns: 1fr 2fr 1fr; /* middle column gets twice the space */
```

---

# `repeat()` — Avoiding Repetition

Recall this from the previous lesson's preview:

```css
grid-template-columns: repeat(4, 1fr);
/* identical to: */
grid-template-columns: 1fr 1fr 1fr 1fr;
```

`repeat()` also accepts patterns, not just a single value:

```css
grid-template-columns: repeat(3, 100px 1fr); /* repeats the pair three times */
```

---

# `minmax()` — Flexible With Limits

```css
.grid {
  grid-template-columns: repeat(3, minmax(150px, 1fr));
}
```

Each column is never smaller than `150px`, but grows to fill available space up to `1fr`. This solves a real problem plain `fr` can't: without `minmax()`, flexible columns can shrink so far that content overflows or becomes unreadable.

---

# `auto-fit` and `auto-fill` — Responsive Without Media Queries

```css
.grid {
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
}
```

This is genuinely one of the most useful patterns in modern CSS: the browser fits as many `200px`-minimum columns as will comfortably fit the container, and stretches them to fill leftover space — all without a single `@media` query. Resize the browser window and the column count adjusts itself automatically.

**`auto-fit` vs. `auto-fill`:** both compute how many tracks fit, but `auto-fit` collapses empty tracks to zero width (so existing items stretch to fill the row), while `auto-fill` keeps empty tracks at their minimum size (leaving visible gaps). `auto-fit` is the far more common choice for card grids and galleries.

---

# `gap`

```css
.grid {
  gap: 1rem;             /* row and column gap, both 1rem */
  gap: 1rem 2rem;        /* row gap 1rem, column gap 2rem */
  row-gap: 1rem;
  column-gap: 2rem;
}
```

Identical concept to Flexbox's `gap` from Module 06 — spacing between tracks, without needing margin hacks on individual items.

---

# Alignment Properties

Grid has four alignment properties on the container, and they map onto the two axes from Lesson 01's diagram:

```css
.grid {
  justify-items: center; /* aligns items along the row (inline) axis, inside their cell */
  align-items: center;   /* aligns items along the column (block) axis, inside their cell */
  justify-content: center; /* aligns the whole grid within the container, row axis */
  align-content: center;   /* aligns the whole grid within the container, column axis */
}
```

The distinction: `-items` properties affect how each item sits **inside its own cell**; `-content` properties affect how the **entire track grid** sits inside the container (relevant when the tracks don't fill the container completely). This pairing echoes `align-items` vs. `align-content` from Flexbox in Module 06, Lesson 02 — the same underlying logic, just applied to a grid instead of a flex line.

---

# Practical Example: A Responsive Card Gallery

```html
<div class="gallery">
  <div class="card">Card 1</div>
  <div class="card">Card 2</div>
  <div class="card">Card 3</div>
  <div class="card">Card 4</div>
  <div class="card">Card 5</div>
</div>
```
```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
  gap: 1.5rem;
}
```

Five cards that reflow automatically as the viewport shrinks — three columns wide on a laptop, one column on a phone — with a single line of `grid-template-columns` and no media queries at all.

---

# Revision Questions

1. What does the `fr` unit represent?
2. What problem does `minmax()` solve that plain `fr` doesn't?
3. What's the practical difference between `auto-fit` and `auto-fill`?

<details><summary>Answers</summary>

1. A fraction of the available space in the grid container, distributed proportionally among tracks that use it.
2. `minmax()` sets a lower (and optionally upper) bound on a track's size, preventing flexible tracks from shrinking so far that content overflows or becomes unreadable.
3. `auto-fit` collapses empty tracks to zero width so existing items stretch to fill the space; `auto-fill` keeps empty tracks at their minimum size, leaving visible gaps.

</details>
