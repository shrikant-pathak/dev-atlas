# Lesson 02: CSS Units

## Learning Objectives
By the end of this lesson, you will be able to:
- Distinguish between absolute and relative CSS units.
- Use px, %, em, rem, vw, and vh correctly.
- Choose the appropriate unit for a given styling situation.

---

# Introduction

Every size, spacing, and dimension value in CSS needs a unit — and choosing the right one is genuinely important for building layouts that work well across different devices, directly setting up Module 08's responsive design module.

---

# Absolute Units: `px`

**Pixels (`px`)** are a fixed, absolute unit — 16px is always 16px, regardless of anything else on the page:

```css
h1 { font-size: 32px; }
.box { width: 300px; }
```

**The limitation:** because pixels are fixed, they don't naturally scale with user preferences (like a browser's default zoom/font-size settings) or adapt to different contexts — a genuine accessibility and responsiveness concern that relative units solve.

---

# Relative Units: `%`

**Percentage (`%`)** sizes an element relative to its **parent element's** corresponding size:

```css
.parent {
  width: 400px;
}
.child {
  width: 50%;  /* 200px - half of the parent's 400px */
}
```

Genuinely useful for fluid layouts — a child element's width automatically adjusts if the parent's width changes, without needing to recalculate pixel values manually.

---

# Relative Units: `em`

**`em`** is relative to the **font-size of the current element** (or its parent, if the current element doesn't set its own):

```css
.parent {
  font-size: 20px;
}
.child {
  font-size: 1.5em;  /* 30px - 1.5 × the parent's 20px */
}
```

**The genuine complication with `em`:** it **compounds** through nested elements, since each level's `em` is relative to its own immediate parent, not the original root:

```css
body { font-size: 16px; }
.a { font-size: 1.5em; }      /* 24px (1.5 × 16px) */
.a .b { font-size: 1.5em; }    /* 36px (1.5 × 24px, NOT 1.5 × 16px!) */
```

This compounding effect is a genuinely common source of unexpected sizing bugs in deeply nested elements — exactly the problem `rem` was introduced to solve.

---

# Relative Units: `rem`

**`rem`** ("root em") is relative to the **root element's** (`<html>`) font-size, **always** — regardless of nesting depth:

```css
html { font-size: 16px; }  /* the root */
.a { font-size: 1.5rem; }      /* 24px */
.a .b { font-size: 1.5rem; }    /* 24px - no compounding! */
```

**Why `rem` is generally preferred over `em` for most sizing in modern CSS:** it avoids the compounding problem entirely, making sizes far more predictable — you'll see `rem` used as the default choice in the vast majority of real, modern stylesheets, especially for font sizes.

---

# Viewport Units: `vw` and `vh`

**`vw`** (viewport width) and **`vh`** (viewport height) are relative to the browser window's actual visible size — `1vw` = 1% of viewport width, `1vh` = 1% of viewport height:

```css
.hero {
  height: 100vh;   /* exactly fills the visible browser window height */
  width: 100vw;
}
```

Genuinely useful for full-screen sections (hero banners, landing page intros) that should always exactly fill the visible screen, regardless of device size — a pattern you'll use constantly once you reach real layout work in later modules.

---

# Choosing the Right Unit

| Situation | Recommended Unit |
|---|---|
| Font sizes | `rem` (avoids compounding, respects user zoom settings) |
| Fluid widths relative to a container | `%` |
| Full-screen sections | `vw`/`vh` |
| Fixed, precise small details (borders, tiny icons) | `px` is often fine |
| Spacing that should scale with a specific element's own font size | `em` (deliberately, when compounding is actually wanted) |

---

# Practical Example

```css
html {
  font-size: 16px;  /* the rem baseline */
}

h1 {
  font-size: 2rem;      /* 32px, consistent regardless of nesting */
}

.container {
  width: 90%;             /* fluid relative to its parent */
  max-width: 1200px;        /* but never wider than 1200px */
}

.hero {
  height: 100vh;              /* always fills the screen */
}

.card-title {
  font-size: 1.2em;              /* scales with THIS card's own font-size context */
}
```

---

# Revision Questions

1. What's the fundamental difference between `px` and `%`?
2. Why does `em` sometimes cause unexpected sizing in deeply nested elements, and how does `rem` solve this?
3. What do `1vw` and `1vh` represent?

<details><summary>Answers</summary>

1. `px` is a fixed, absolute unit unaffected by anything else; `%` is relative to the parent element's corresponding size.
2. `em` compounds — each nested level's `em` is relative to its immediate parent's font-size, not the original root, so deeply nested elements can end up unexpectedly large or small; `rem` always references the root `<html>` element's font-size directly, avoiding compounding entirely.
3. `1vw` is 1% of the browser viewport's width; `1vh` is 1% of the browser viewport's height.

</details>
