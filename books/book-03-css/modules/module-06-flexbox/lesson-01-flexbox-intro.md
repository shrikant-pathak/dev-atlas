# Lesson 01: Flexbox Intro

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what Flexbox is and the problem it solves.
- Understand the main axis and cross axis concepts.
- Activate Flexbox on a container and observe its default behavior.

---

# Introduction

This is genuinely one of the most important modules in this entire book. Flexbox arrived specifically to solve the real, everyday layout problems Module 05 exposed — centering things, distributing space evenly, building flexible rows/columns — problems that float and inline-block (Module 05) only ever solved awkwardly, with genuine quirks and workarounds.

---

# The Problem Flexbox Solves

Recall from Module 05: centering something vertically within its container was genuinely difficult before Flexbox — `vertical-align` didn't apply to block content, and float-based approaches required fragile height calculations. Flexbox makes this, and many other common layout needs, straightforward and predictable.

```css
.container {
  display: flex;
  justify-content: center;  /* horizontal centering, this module's Lesson 02 */
  align-items: center;       /* vertical centering, same lesson */
}
```

That's genuinely the entire solution to "how do I center something vertically" — a problem that took real workarounds before Flexbox existed.

---

# Activating Flexbox

```css
.container {
  display: flex;
}
```

Recall Module 05, Lesson 01's preview — setting `display: flex` on a container fundamentally changes how its **direct children** (called "flex items") behave, without needing any special markup or classes on the children themselves.

**The immediate, default effect:**
```html
<div class="container">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
</div>
```
```css
.container { display: flex; }
```
The three child `<div>`s — normally block-level, each stacking on its own line — now sit **side by side in a row**, automatically, with zero additional CSS. This single line already solves what used to require float or inline-block workarounds from Module 05.

---

# The Core Mental Model: Main Axis and Cross Axis

This is genuinely the single most important concept to internalize before anything else in this module makes sense:

- **Main axis** — the primary direction flex items are laid out along (by default, horizontal — left to right).
- **Cross axis** — the perpendicular direction (by default, vertical — top to bottom).

Main axis ────────────────────────►
┌──────┐ ┌──────┐ ┌──────┐
│ Item │ │ Item │ │ Item │ │ Cross
│ 1 │ │ 2 │ │ 3 │ │ axis
└──────┘ └──────┘ └──────┘ ▼


Nearly every Flexbox property either controls positioning *along the main axis* or *along the cross axis* — genuinely worth keeping this diagram in mind constantly through Lessons 02–03, since it explains why certain properties behave the way they do.

**Critical detail:** the main axis isn't always horizontal — it depends on `flex-direction` (Lesson 02). If you switch to a column layout, the main axis becomes vertical, and the cross axis becomes horizontal — the *labels* ("main"/"cross") stay conceptually consistent, but which physical direction they point flips.

---

# Flexbox Is One-Dimensional

A genuinely important distinction to understand now, before Module 07 introduces Grid: Flexbox is designed for laying out content along **one dimension at a time** — either a row or a column. For genuinely two-dimensional layouts (controlling rows AND columns simultaneously, like a photo gallery grid), Grid (Module 07) is the more appropriate tool. Many real layouts actually use both together — Grid for overall page structure, Flexbox for smaller components within it.

---

# Practical Example

```html
<div class="nav-bar">
  <div class="logo">Dev Atlas</div>
  <div class="links">Home | About | Contact</div>
</div>
```
```css
.nav-bar {
  display: flex;
  justify-content: space-between; /* preview, Lesson 02 */
  align-items: center;
}
```

This single, small snippet — a logo on the left, links on the right, both vertically centered — is genuinely one of the most common real-world Flexbox use cases you'll build constantly.

---

# Revision Questions

1. What single CSS declaration activates Flexbox on a container?
2. What is the "main axis," and what determines its default direction?
3. Is Flexbox designed for one-dimensional or two-dimensional layouts?

<details><summary>Answers</summary>

1. `display: flex;`
2. The primary direction flex items are laid out along; by default, it's horizontal (left to right), though `flex-direction` (Lesson 02) can change this.
3. One-dimensional — a single row or column at a time; two-dimensional layouts are better suited to Grid (Module 07).

</details>
