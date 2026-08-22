# Lesson 02: Margin, Padding, Border

## Learning Objectives
By the end of this lesson, you will be able to:
- Use margin and padding shorthand and longhand properties correctly.
- Understand and predict margin collapsing.
- Apply basic border styling.

---

# Introduction

This lesson gives you precise, practical control over the three outer layers introduced conceptually in Lesson 01 — genuinely some of the most-used properties in all of CSS.

---

# Padding

```css
.box {
  padding-top: 10px;
  padding-right: 20px;
  padding-bottom: 10px;
  padding-left: 20px;
}
```

**Shorthand** (much more commonly used in practice):
```css
.box { padding: 10px 20px 10px 20px; }   /* top right bottom left (clockwise) */
.box { padding: 10px 20px; }               /* top/bottom, left/right */
.box { padding: 10px; }                      /* all four sides equal */
```

The clockwise pattern (**T**op, **R**ight, **B**ottom, **L**eft — a useful mnemonic: "TRouBLe") is worth memorizing, since it applies identically to margin shorthand too.

---

# Margin

Identical syntax pattern to padding:
```css
.box {
  margin: 20px;              /* all sides */
  margin: 10px 20px;          /* vertical horizontal */
  margin: 10px 20px 10px 20px; /* top right bottom left */
}
```

**Centering a block element horizontally** — a genuinely essential, extremely common pattern:
```css
.container {
  width: 800px;
  margin: 0 auto;  /* top/bottom: 0, left/right: auto */
}
```
`margin: 0 auto` is one of the most-used single lines in all of CSS — `auto` tells the browser to automatically calculate equal left/right margins, centering the element within its parent (this only works on block-level elements with an explicit width, revisited in Module 05).

---

# Margin Collapsing: A Genuine CSS Quirk

This is worth knowing explicitly, since it causes real confusion otherwise. When two **vertical** margins from adjacent elements meet, they don't add together — the **larger** of the two wins, and the smaller one is effectively ignored:

```css
.box-one { margin-bottom: 30px; }
.box-two { margin-top: 20px; }
```
```html
<div class="box-one">First</div>
<div class="box-two">Second</div>
```

The actual gap between these two boxes is **30px**, not 50px — the larger margin "wins," and the smaller one collapses away. This only applies to *vertical* margins between block-level elements in normal document flow — horizontal margins never collapse, and this behavior changes once Flexbox/Grid are involved (Modules 06–07), which is worth knowing now so it doesn't feel like inconsistent behavior later.

---

# Border

```css
.box {
  border-width: 2px;
  border-style: solid;
  border-color: black;
}
```

**Shorthand** (the far more common way to write it):
```css
.box {
  border: 2px solid black;
}
```

**Common `border-style` values:** `solid`, `dashed`, `dotted`, `double`, `none` (the default — no visible border even if width/color are set).

**Styling individual sides:**
```css
.box {
  border-bottom: 2px solid #ccc;  /* just a bottom border, e.g., under a heading */
}
```

---

# Practical Example

```css
.card {
  padding: 16px 20px;
  margin: 20px auto;
  border: 1px solid #ddd;
  width: 400px;
}

.card + .card {
  margin-top: 10px; /* demonstrates margin collapsing with the card above */
}
```

---

# Revision Questions

1. What does the mnemonic "TRouBLe" help you remember about shorthand property order?
2. What does `margin: 0 auto` accomplish, and what condition must be true for it to work?
3. If one element has `margin-bottom: 40px` and the next has `margin-top: 25px`, what's the actual gap between them?

<details><summary>Answers</summary>

1. The order of values in shorthand (padding/margin/border-width, etc.): Top, Right, Bottom, Left, going clockwise.
2. It horizontally centers a block-level element within its parent; the element must have an explicit width set for this to work.
3. 40px — the larger of the two collapsing vertical margins wins, and the smaller one collapses away.

</details>
