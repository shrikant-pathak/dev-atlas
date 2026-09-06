# Lesson 05: Grid 12-Column Layout

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain why the 12-column system became a web-design default.
- Build a 12-column grid track using `repeat()`.
- Span items across multiple columns with `grid-column`.
- Recreate common framework layouts (like Bootstrap's) with plain CSS Grid.

---

# Introduction

If you've ever used Bootstrap, Tailwind's grid utilities, or any design tool that talks about "columns" — you've already met the 12-column system. It's not a CSS feature; it's a *convention*. Twelve divides cleanly into halves, thirds, quarters, and sixths (6, 4, 3, 2 columns respectively), which makes it flexible enough to express almost any layout a designer hands you. Grid's container and item properties from Lessons 02–03 give you everything you need to build this convention yourself, with zero framework overhead.

---

# Building the Track

```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1rem;
}
```

Recall `repeat()` from Lesson 02 — `repeat(12, 1fr)` is shorthand for writing `1fr` twelve times. Every column is an equal fraction of the available space, and `gap` (also Lesson 02) keeps items from touching.

That's the entire foundation. Everything else in this lesson is just placing items on top of it.

---

# Spanning Columns

Recall `grid-column` from Lesson 03 — this is where it earns its keep. On a 12-column track, "span 6" means "take up half the row":

```css
.half   { grid-column: span 6; }  /* 6 of 12 = 50% */
.third  { grid-column: span 4; }  /* 4 of 12 = 33.3% */
.quarter{ grid-column: span 3; }  /* 3 of 12 = 25% */
.two-thirds { grid-column: span 8; } /* 8 of 12 = 66.6% */
```

```html
<div class="grid">
  <div class="two-thirds">Main content</div>
  <div class="third">Sidebar</div>
</div>
```

Two items, spans adding up to 12, sitting side by side — no media queries, no float clearfixes, no framework class names to memorize. Just arithmetic against the number 12.

---

# Why 12 Specifically?

Genuinely worth pausing on this — it's not arbitrary. 12 is divisible by 2, 3, 4, and 6, so a 12-column grid can express halves, thirds, quarters, and sixths without any fractional column spans. A 10-column grid, by contrast, only divides cleanly into halves and fifths — far less flexible for typical page layouts (headers, three-column blogs, four-item card rows, etc.). This is exactly why Bootstrap, Foundation, and most design tools standardized on 12 decades before CSS Grid existed — Grid just lets you implement the same idea natively.

---

# Explicit Placement vs. Spanning

Recall `grid-column-start` / `grid-column-end` from Lesson 03 — you can be explicit about exact track lines instead of just spanning a count:

```css
.sidebar {
  grid-column: 9 / 13; /* starts at line 9, ends at line 13 (i.e., spans columns 9–12) */
}
```

This is equivalent to `grid-column: span 4` positioned at the end of the row, but explicit line numbers are useful when an item needs to start somewhere other than the next available slot — for example, offsetting content the way Bootstrap's `.offset-*` classes do.

```css
.offset-example {
  grid-column: 4 / span 6; /* skip 3 columns, then span 6 */
}
```

---

# Responsive Column Counts (Preview)

A 12-column grid on desktop rarely stays 12 columns on mobile. Module 08 (Responsive Design) covers media queries in full, but here's the shape of what's coming:

```css
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1rem;
}

@media (max-width: 600px) {
  .grid {
    grid-template-columns: repeat(4, 1fr); /* fewer columns on small screens */
  }
}
```

Items that spanned "6 of 12" on desktop would need adjusting for a 4-column mobile track — this tension (fixed spans vs. responsive tracks) is exactly why Module 08 introduces more flexible sizing tools like `auto-fit` and `minmax()`, which you already previewed conceptually in Lesson 02.

---

# Practical Example: A Framework-Style Layout

```html
<div class="page-grid">
  <header class="col-span-12">Header</header>
  <nav class="col-span-3">Sidebar Nav</nav>
  <main class="col-span-6">Main Content</main>
  <aside class="col-span-3">Widgets</aside>
  <footer class="col-span-12">Footer</footer>
</div>
```
```css
.page-grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1rem;
}
.col-span-12 { grid-column: span 12; }
.col-span-6  { grid-column: span 6; }
.col-span-3  { grid-column: span 3; }
```

Header and footer span the full width; the middle row splits 3/6/3 — a classic sidebar–content–widgets layout, built with five class names and zero framework dependency.

---

# Revision Questions

1. Why is 12 a more common column count than, say, 10?
2. Write the `grid-column` declaration for an item spanning half of a 12-column grid.
3. What's the difference between `grid-column: span 4` and `grid-column: 4 / span 4`?

<details><summary>Answers</summary>

1. 12 divides evenly into halves, thirds, quarters, and sixths (2, 3, 4, and 6 columns), making it flexible enough for most common page layouts without fractional spans — unlike 10, which only divides cleanly into halves and fifths.
2. `grid-column: span 6;`
3. `grid-column: span 4` places the item in the next available slot and makes it span 4 columns. `grid-column: 4 / span 4` explicitly starts the item at column line 4 (skipping the first 3 columns) and spans 4 columns from there — useful for offsetting content.

</details>
