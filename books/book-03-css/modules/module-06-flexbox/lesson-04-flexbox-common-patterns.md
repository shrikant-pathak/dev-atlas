# Lesson 04: Flexbox Common Patterns

## Learning Objectives
By the end of this lesson, you will be able to:
- Build the handful of Flexbox patterns that cover the vast majority of real-world layout needs.
- Combine container and item properties fluently, without hesitating on which property does what.
- Recognize these patterns instantly in other people's code.

---

# Introduction

This final lesson of Module 06 is deliberately different from the others — no new properties, just genuinely essential, real-world patterns built entirely from Lessons 01–03's properties, combined the way you'll actually use them constantly in real projects.

---

# Pattern 1: Perfect Centering (Horizontal + Vertical)

```css
.center-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
```

The exact solution previewed in Lesson 01 — genuinely the most commonly needed, historically most annoying-to-achieve layout pattern in all of CSS, now trivial.

---

# Pattern 2: Navigation Bar (Logo Left, Links Right)

```css
.nav-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 30px;
}
```
```html
<nav class="nav-bar">
  <div class="logo">Dev Atlas</div>
  <ul class="nav-links">
    <li><a href="/">Home</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>
```
(Recall Module 03's navigation list reset — combine that with this Flexbox pattern for a complete, real nav bar.)

---

# Pattern 3: Equal-Height, Equal-Width Columns

```css
.columns {
  display: flex;
  gap: 20px;
}
.column {
  flex: 1; /* each column shares available space equally */
}
```

A genuinely common need: a row of cards or columns that should all be the same width, splitting available space evenly — and thanks to Flexbox's default `align-items: stretch`, they're also automatically the same **height**, regardless of how much content each contains (something that was genuinely difficult before Flexbox existed).

---

# Pattern 4: Sidebar + Main Content Layout

```css
.layout {
  display: flex;
  gap: 20px;
}
.sidebar {
  flex: 0 0 250px; /* fixed width, never grows or shrinks */
}
.main-content {
  flex: 1; /* fills all remaining space */
}
```

This exact pattern replaces the entire "legacy float-based 2-column layout" shown as an anti-pattern back in Module 05, Lesson 05 — genuinely simpler, more predictable, and without float's container-collapse quirks.

---

# Pattern 5: Responsive Card Grid (Wrapping)

```css
.card-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}
.card {
  flex: 1 1 250px; /* grow, shrink, but prefer 250px as a starting point */
}
```

Cards naturally wrap onto new lines as the container narrows, each card flexibly resizing around a 250px "ideal" width — a genuinely common responsive pattern you'll build constantly, and directly connects to Module 08's full responsive design module.

---

# Pattern 6: Sticky Footer (Pushing Footer to Bottom on Short Pages)

```css
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
main {
  flex: 1; /* pushes footer down by consuming all remaining vertical space */
}
```

A genuinely classic problem: on pages with little content, the footer visually "floats" partway up the page instead of sitting at the bottom of the viewport. This pattern — a column-direction flex container spanning the full viewport height, with `main` set to `flex: 1` — solves it cleanly, pushing the footer to the true bottom regardless of content length.

---

# Recognizing These Patterns in Real Code

Once you've built each of these patterns yourself, you'll start recognizing them instantly in other developers' CSS — `justify-content: space-between` immediately signals "this is probably a nav bar or header," `flex: 1` on multiple siblings immediately signals "these are meant to share space equally." This pattern-recognition fluency is genuinely a huge part of becoming comfortable reading and writing real-world CSS quickly.

---

# Practical Example: A Complete Small Page Combining Several Patterns

```css
body {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
  margin: 0;
}

.nav-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 30px;
}

main {
  flex: 1;
  display: flex;
  gap: 20px;
  padding: 20px;
}

.sidebar {
  flex: 0 0 220px;
}

.content {
  flex: 1;
}

.card-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 16px;
}

.card {
  flex: 1 1 200px;
}

footer {
  padding: 20px;
  text-align: center;
}
```

---

# Revision Questions

1. What combination of two properties achieves both horizontal and vertical centering?
2. What makes the "sidebar + main content" Flexbox pattern superior to the legacy float-based approach from Module 05?
3. In the sticky footer pattern, what does setting `main { flex: 1; }` inside a column-direction flex `body` actually accomplish?

<details><summary>Answers</summary>

1. `justify-content: center` combined with `align-items: center` on a flex container.
2. It avoids float's container-collapse quirk entirely, requires no clearfix, and automatically gives both columns equal height by default — genuinely simpler and more predictable.
3. It makes `main` consume all available leftover vertical space in the column, pushing anything after it (like a footer) down to the true bottom of the viewport, even on pages with little content.

</details>

---

# 🏁 Module 06 Checkpoint

Before moving to Module 07, you should be able to:
- [ ] Explain the main axis/cross axis mental model and how `flex-direction` affects it
- [ ] Use `justify-content`, `align-items`, `align-content`, `flex-wrap`, and `gap` on a container
- [ ] Use `flex-grow`, `flex-shrink`, `flex-basis`, and the `flex` shorthand on items
- [ ] Use `align-self` and `order`, aware of `order`'s accessibility caveat
- [ ] Build all six common Flexbox patterns from memory

**Next up:** Module 07 — CSS Grid
