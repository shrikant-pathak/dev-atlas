# Lesson 02: Flex Container Properties

## Learning Objectives
By the end of this lesson, you will be able to:
- Use every major flex container property confidently.
- Control direction, wrapping, and alignment along both axes.
- Predict the visual result of any combination of these properties.

---

# Introduction

This lesson covers the properties applied to the **flex container itself** (the parent with `display: flex`) — controlling the overall direction and distribution of its flex items.

---

# `flex-direction`

```css
.container {
  display: flex;
  flex-direction: row;    /* default — left to right */
}
```

| Value | Main axis direction |
|---|---|
| `row` (default) | Left to right |
| `row-reverse` | Right to left |
| `column` | Top to bottom |
| `column-reverse` | Bottom to top |

Recall Lesson 01: switching to `column` flips the main/cross axis labels — `justify-content` now controls vertical distribution, and `align-items` controls horizontal, exactly reversed from the `row` default.

---

# `flex-wrap`

```css
.container {
  display: flex;
  flex-wrap: nowrap; /* default — items shrink to fit on one line, no matter what */
}
```

- **`nowrap`** (default) — all items forced onto a single line, shrinking as needed (potentially causing overflow if they can't shrink enough).
- **`wrap`** — items that don't fit wrap onto additional lines, like text wrapping.
- **`wrap-reverse`** — wraps, but new lines stack in reverse order.

**`flex-wrap: wrap` is genuinely essential for responsive card grids** — a row of cards that wraps naturally onto multiple lines as screen width shrinks, revisited fully in Module 08.

**Shorthand:** `flex-flow: row wrap;` combines `flex-direction` and `flex-wrap` into one declaration.

---

# `justify-content`: Main Axis Distribution

Controls how items are distributed along the **main axis**:

```css
.container {
  display: flex;
  justify-content: space-between;
}
```

| Value | Effect |
|---|---|
| `flex-start` (default) | Items packed at the start |
| `flex-end` | Items packed at the end |
| `center` | Items packed in the center |
| `space-between` | Equal space *between* items, none at the edges |
| `space-around` | Equal space around each item (edges get half-space) |
| `space-evenly` | Perfectly equal space everywhere, including edges |

`space-between` is genuinely the most common real-world choice for nav bars (logo left, links right) and similar "push apart" layouts.

---

# `align-items`: Cross Axis Alignment (Single Line)

Controls how items align along the **cross axis**, within a single line:

```css
.container {
  display: flex;
  align-items: center;
}
```

| Value | Effect |
|---|---|
| `stretch` (default) | Items stretch to fill the container's cross-axis size |
| `flex-start` | Aligned to the start of the cross axis |
| `flex-end` | Aligned to the end |
| `center` | Centered — this is the classic "vertical centering" solution |
| `baseline` | Aligned by their text baselines |

**`align-items: center` combined with `justify-content: center`** is genuinely the complete, standard answer to "how do I center something both horizontally and vertically" — the exact problem highlighted in Lesson 01.

---

# `align-content`: Multiple Line Distribution

Only relevant when `flex-wrap: wrap` produces **multiple lines** — controls how those lines are distributed within the container (similar to `justify-content`, but for the cross axis, across lines):

```css
.container {
  display: flex;
  flex-wrap: wrap;
  align-content: space-between;
}
```

Genuinely easy to confuse with `align-items` — remember: `align-items` aligns items *within* a single line; `align-content` distributes multiple *lines* themselves, only kicking in when wrapping actually produces more than one line.

---

# `gap`

```css
.container {
  display: flex;
  gap: 20px;          /* row and column gap, both */
  gap: 10px 20px;       /* row-gap column-gap, separately */
}
```

A genuinely modern, clean way to add consistent spacing *between* flex items — without needing margin tricks on individual items (like margin on all but the last child). `gap` is now widely supported and is the recommended default approach for inter-item spacing.

---

# Practical Example

```css
.nav-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 30px;
}

.card-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
}

.hero-section {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* Module 02 preview, combined with centering */
}
```

---

# Revision Questions

1. What's the difference between `justify-content` and `align-items` in terms of which axis they control?
2. What does `flex-wrap: wrap` allow that `nowrap` (the default) doesn't?
3. What's the difference between `align-items` and `align-content`?

<details><summary>Answers</summary>

1. `justify-content` controls distribution along the main axis; `align-items` controls alignment along the cross axis.
2. It allows flex items that don't fit on one line to wrap onto additional lines, rather than being forced to shrink to fit on a single line.
3. `align-items` aligns items within a single line along the cross axis; `align-content` distributes multiple wrapped lines themselves within the container, only relevant when wrapping produces more than one line.

</details>
