# Lesson 01: Media Queries (& the Viewport Meta Tag)

## Learning Objectives
By the end of this lesson, you will be able to:
- Set up the viewport meta tag correctly and explain what it does.
- Write media queries using `min-width` and `max-width`.
- Choose sensible breakpoints and combine multiple conditions in one query.

---

# Introduction

Every module so far — Box Model (03), Positioning (05), Flexbox (06), Grid (07) — has quietly been building toward this one. You already have every tool needed to build layouts that adapt; this module is about the strategy and techniques for actually doing it deliberately, across the huge range of real screen sizes: phones, tablets, laptops, ultrawide monitors, and everything between.

---

# The Viewport Meta Tag — A Prerequisite

Before any media query can work correctly on a mobile device, this line must be present in your HTML `<head>`:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

**Why this matters:** without it, mobile browsers assume your page was built for a desktop-width viewport (historically ~980px) and render it at that width, then shrink the whole page to fit the screen — text becomes tiny and your layouts never get the chance to actually respond to the real screen size.

- `width=device-width` — sets the viewport width to match the device's actual screen width.
- `initial-scale=1.0` — sets the initial zoom level to 100% on load.

**Without this tag, nothing else in this module behaves as intended** — genuinely the first thing to check before debugging any other responsive issue.

---

# Basic Media Query Syntax

```css
@media (max-width: 600px) {
  .container {
    flex-direction: column;
  }
}
```

Read this as: "if the viewport is 600px wide or narrower, apply the CSS inside this block." Outside a matching condition, the block is ignored entirely — the same conditional logic you saw with `@supports` in Module 07, Lesson 06, just testing viewport width instead of browser capability.

---

# `min-width` vs. `max-width`

```css
@media (min-width: 768px) {
  /* applies when viewport is 768px or WIDER */
}

@media (max-width: 767px) {
  /* applies when viewport is 767px or NARROWER */
}
```

This distinction drives the entire strategy in Lesson 02 (mobile-first approach): `min-width` queries build **up** from a narrow base, while `max-width` queries build **down** from a wide base. Mixing the two carelessly is one of the most common sources of responsive bugs — overlapping ranges where multiple queries match simultaneously and fight each other.

---

# Choosing Breakpoints

A **breakpoint** is the specific width at which your layout changes. Common conventional breakpoints look like this:

```css
@media (min-width: 480px)  { /* large phones */ }
@media (min-width: 768px)  { /* tablets */ }
@media (min-width: 1024px) { /* small laptops */ }
@media (min-width: 1280px) { /* desktops */ }
```

**Important nuance:** these numbers are a reasonable starting convention, not a rule enforced by CSS. The best breakpoints are chosen based on where your own content actually breaks — where text lines get awkwardly short, where a grid feels cramped — not by rigidly matching a specific device's screen size.

---

# Combining Conditions

```css
/* AND: both conditions must be true */
@media (min-width: 600px) and (max-width: 900px) { /* ... */ }

/* Comma = OR: applies if either condition matches */
@media (max-width: 600px), (orientation: portrait) { /* ... */ }
```

Recall the same `and`/`or` logic from `@supports` in Module 07 — media queries support this identical combinator pattern, just testing different conditions.

---

# Other Useful Query Features

```css
@media (orientation: portrait)  { /* taller than wide */ }
@media (orientation: landscape) { /* wider than tall */ }
@media (prefers-color-scheme: dark) { /* user's OS is set to dark mode */ }
@media print { /* styles applied only when printing */ }
```

`prefers-color-scheme` is worth calling out — it's how sites implement automatic dark mode based on the user's system setting, without any JavaScript toggle required.

---

# Practical Example: A Responsive Navigation Bar

```html
<nav class="nav">
  <div class="logo">Dev Atlas</div>
  <ul class="links">
    <li>Home</li>
    <li>Courses</li>
    <li>Contact</li>
  </ul>
</nav>
```
```css
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.links {
  display: flex;
  gap: 1.5rem;
}

@media (max-width: 600px) {
  .nav {
    flex-direction: column;
    align-items: flex-start;
  }

  .links {
    flex-direction: column;
    gap: 0.5rem;
  }
}
```

Recall `flex-direction` from Module 06 — the same navbar collapses from a horizontal bar into a stacked vertical menu below 600px, using nothing but a media query wrapped around properties you already know.

---

# Revision Questions

1. What happens on mobile browsers if the viewport meta tag is missing?
2. What's the practical difference between `min-width` and `max-width` media queries?
3. How do you combine two media conditions so BOTH must be true? So that EITHER can be true?

<details><summary>Answers</summary>

1. The browser assumes a desktop-width viewport (historically ~980px), renders the page at that width, and scales the whole page down to fit the screen — resulting in tiny, unreadable text and layouts that never actually respond to the real screen size.
2. `min-width` queries apply when the viewport is that width or wider (building up from a narrow base); `max-width` queries apply when the viewport is that width or narrower (building down from a wide base).
3. `and` combines conditions requiring both to be true; a comma (`,`) acts as `or`, applying styles if either condition matches.

</details>
