# Lesson 03: Box-Sizing

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the default box model's width calculation quirk.
- Use `box-sizing: border-box` to fix it.
- Understand why this is applied nearly universally in modern CSS.

---

# Introduction

This lesson resolves the exact confusion Lesson 01's math demonstrated — "why is my box wider than the width I actually set?" It's a small property with an outsized practical impact on nearly every real project you'll ever build.

---

# The Default Behavior: `content-box`

By default, CSS uses `box-sizing: content-box` — meaning the `width`/`height` you set applies **only to the content area**, with padding and border added *on top of* that:

```css
.box {
  width: 200px;
  padding: 20px;
  border: 5px solid black;
  box-sizing: content-box; /* the default, shown explicitly here */
}
```

**Actual rendered width:** `200px + 40px (padding) + 10px (border) = 250px` — exactly the math from Lesson 01. This is genuinely counterintuitive for most beginners: you set `width: 200px`, but the box visually takes up 250px of space.

---

# The Fix: `border-box`

```css
.box {
  width: 200px;
  padding: 20px;
  border: 5px solid black;
  box-sizing: border-box;
}
```

With `border-box`, the `width` you set becomes the **total, final rendered width** — padding and border are now included *within* that 200px, not added on top of it. The content area automatically shrinks to accommodate them.

**This is genuinely the behavior almost every developer actually wants** — you set a width, and that's the width, full stop, regardless of how much padding/border you later add or adjust.

---

# The Universal Fix: Applying It to Everything

Because `border-box` is so consistently preferred, the near-universal convention in modern CSS is applying it globally, right at the top of your stylesheet:

```css
*, *::before, *::after {
  box-sizing: border-box;
}
```

(The `::before`/`::after` pseudo-elements are covered fully in Module 04 — for now, just know this exact snippet is what you'll see at the top of nearly every real-world stylesheet, and what you should add to your own projects starting now.)

---

# Why This Matters So Much in Practice

Without `border-box`, adding padding to an element with a percentage-based width (common in responsive layouts, Module 08) can cause it to overflow its container unexpectedly — the padding adds *extra* width beyond the percentage you calculated, breaking layouts in ways that are genuinely confusing to debug without understanding this exact property.

---

# Practical Example

```css
*, *::before, *::after {
  box-sizing: border-box;
}

.card {
  width: 300px;
  padding: 20px;
  border: 2px solid #ccc;
  /* Total width is STILL exactly 300px, thanks to border-box */
}
```

---

# Revision Questions

1. With the default `content-box`, does `width` include padding and border, or exclude them?
2. What does `box-sizing: border-box` change about how `width` is calculated?
3. Why is applying `box-sizing: border-box` to `*` (the universal selector) such a common convention?

<details><summary>Answers</summary>

1. It excludes them — padding and border are added on top of the specified `width`, making the total rendered size larger than the set value.
2. It makes the specified `width` the final, total rendered width, with padding and border included within it rather than added on top.
3. Because this is almost universally the behavior developers actually want, and applying it once globally avoids needing to remember to set it individually on every single element throughout a project.

</details>
