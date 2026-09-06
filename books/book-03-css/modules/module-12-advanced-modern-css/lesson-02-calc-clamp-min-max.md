# Lesson 02: calc(), clamp(), min(), max()

## Learning Objectives
By the end of this lesson, you will be able to:
- Perform mixed-unit math with `calc()`.
- Use `min()` and `max()` to pick between values dynamically.
- Combine these functions with custom properties from Lesson 01.

---

# Introduction

Module 08, Lesson 03 introduced `clamp()` specifically for fluid typography. This lesson steps back to cover the full family of CSS math functions it belongs to — `calc()`, `min()`, and `max()` — and how they combine with custom properties for genuinely dynamic, computed values.

---

# `calc()` — Mixed-Unit Math

```css
.sidebar {
  width: calc(100% - 250px);
}
```

`calc()` lets you mix units that CSS otherwise can't combine directly — here, a percentage and a fixed pixel value together in one expression. This solves a genuinely common real problem: "the sidebar should fill all remaining space after a fixed-width nav," which no single unit alone can express.

```css
.box {
  padding: calc(1rem + 2vw);       /* combining rem and vw */
  margin-top: calc(var(--spacing) * 2); /* combining a custom property with math */
}
```

`calc()` supports `+`, `-`, `*`, and `/` — note that `*` and `/` require at least one side to be a unitless number, while `+` and `-` require both sides to have compatible units (or be unitless together).

---

# `min()` — Picking the Smaller Value

```css
.box {
  width: min(90%, 600px);
}
```

`min()` evaluates all its arguments and uses whichever is *smallest* at any given moment. Here: the box is `90%` of its container width, but never wider than `600px` — genuinely useful for content that should stay comfortably readable on wide screens without needing a separate `max-width` media query override.

---

# `max()` — Picking the Larger Value

```css
.box {
  width: max(300px, 50%);
}
```

The inverse of `min()` — uses whichever value is *largest*. Here: the box is never narrower than `300px`, but grows to `50%` of its container once that's larger than `300px`.

---

# Recalling `clamp()` as the Combination of Both

```css
/* clamp(MIN, PREFERRED, MAX) is equivalent to: */
width: max(MIN, min(PREFERRED, MAX));
```

Worth connecting explicitly to Module 08: `clamp()` is genuinely just convenient shorthand for nesting `min()` inside `max()` — understanding this equivalence makes it much easier to reason about what `clamp()` is actually doing internally, and when you might reach for `min()`/`max()` individually instead of the combined `clamp()`.

---

# Combining With Custom Properties

```css
:root {
  --content-max: 1200px;
  --gutter: clamp(1rem, 4vw, 3rem);
}

.container {
  max-width: var(--content-max);
  padding-inline: var(--gutter);
  margin-inline: auto;
}
```

Recall Lesson 01's custom properties — storing a `clamp()` expression itself inside a variable means every component referencing `var(--gutter)` gets consistent, fluid spacing, adjustable from exactly one place.

---

# Nesting Functions Together

```css
.hero-text {
  font-size: clamp(1.5rem, calc(1rem + 2vw), min(4rem, 10vw));
}
```

These functions can genuinely nest inside one another — here, the `clamp()`'s preferred value is itself a `calc()` expression, and its maximum is itself a `min()` of two different possible caps. This kind of nesting is common in more sophisticated fluid-design systems, though it's worth keeping expressions readable — extracting pieces into custom properties (as above) often helps more than deeply nesting everything in one line.

---

# Practical Example: A Fluid Container With Computed Padding

```css
:root {
  --nav-height: 64px;
}

.page-content {
  min-height: calc(100vh - var(--nav-height));
  width: min(100% - 2rem, 1100px);
  margin-inline: auto;
}
```

Recall `vh` units from Module 02, and `min-height` from Module 05 — this content area always fills the remaining viewport height below a fixed navbar (subtracting its height via `calc()`), while its width is capped at `1100px` but never touches the very edge of narrower viewports, thanks to the `100% - 2rem` term inside `min()`.

---

# Revision Questions

1. Why is `calc()` needed to express something like `width: 100% - 250px` directly?
2. What's the mathematical relationship between `clamp()` and `min()`/`max()`?
3. In `width: min(90%, 600px)`, under what condition does the box actually render at `600px`?

<details><summary>Answers</summary>

1. CSS can't combine two different, incompatible units (like a percentage and a fixed pixel value) directly in a plain value — `calc()` provides the syntax needed to perform that mixed-unit math.
2. `clamp(MIN, PREFERRED, MAX)` is equivalent to `max(MIN, min(PREFERRED, MAX))` — it's shorthand for nesting the two.
3. Only when `90%` of the container's width is greater than `600px` — `min()` always picks the smaller of the two, so the box is capped at `600px` once the percentage would exceed it.

</details>
