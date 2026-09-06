# Lesson 07: shape-outside and Masking

## Learning Objectives
By the end of this lesson, you will be able to:
- Wrap text around a non-rectangular shape using `shape-outside`.
- Apply `clip-path` to crop an element into a custom shape.
- Use `mask-image` for gradient-based fading and reveal effects.

---

# Introduction

This module's final lesson covers CSS's tools for breaking out of the rectangle — wrapping text around a circle, cropping an image into a custom polygon, or fading an element out using an image-based mask rather than a flat opacity value.

---

# `shape-outside` — Wrapping Text Around a Shape

```css
.avatar {
  float: left;
  width: 150px;
  height: 150px;
  shape-outside: circle(50%);
  clip-path: circle(50%);
}
```

Recall `float` from Module 05 — `shape-outside` changes the invisible boundary that surrounding floated content wraps around. Without it, text would wrap around the avatar's rectangular *box* even if the image itself is visually circular; `shape-outside: circle(50%)` tells the browser to actually wrap the text following the circle's true curve instead.

**Important distinction:** `shape-outside` only affects how *other content flows around* the element — it doesn't change the element's own visible appearance at all. That's what `clip-path` (paired here) is for.

---

# `clip-path` — Cropping an Element's Visible Shape

```css
.circle-image {
  clip-path: circle(50%);
}

.hexagon {
  clip-path: polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%);
}

.diagonal-cut {
  clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
}
```

`clip-path` accepts several shape functions: `circle()`, `ellipse()`, `inset()`, and the genuinely flexible `polygon()`, which takes a list of `x% y%` coordinate pairs tracing the visible outline. Anything outside the traced shape is simply clipped away — not rendered — regardless of the element's actual rectangular box.

---

# Combining `shape-outside` and `clip-path`

```html
<img src="portrait.jpg" class="avatar">
<p>Long paragraph text that will wrap around the circular avatar...</p>
```
```css
.avatar {
  float: left;
  width: 180px;
  margin-right: 1rem;
  shape-outside: circle(50%);
  clip-path: circle(50%);
}
```

This is genuinely the standard pairing: `clip-path` makes the image *look* circular, and `shape-outside` (using the identical shape value) makes surrounding text actually flow along that same circular boundary rather than the image's underlying square box — without both together, you'd get a circular-looking image with text still wrapping around its invisible square edges.

---

# `mask-image` — Gradient-Based Fading

```css
.fade-edge {
  mask-image: linear-gradient(to bottom, black 70%, transparent 100%);
}
```

Recall `linear-gradient()` from Module 09 — `mask-image` uses a gradient's *opacity* values (not its colors) to determine how much of the element shows through: fully opaque gradient stops (black, in most conventions) render the element normally, while transparent stops fade it away entirely. This produces a genuinely smooth fade-to-nothing effect at an element's edge — commonly used for a "fade out" at the bottom of a scrollable list to hint that more content exists below.

---

# `mask-image` With an Actual Image

```css
.masked-photo {
  mask-image: url("star-shape.svg");
  mask-size: contain;
  mask-repeat: no-repeat;
}
```

Beyond gradients, `mask-image` can reference an actual image file — the mask image's own transparency/opacity determines what shows through, letting you crop content into arbitrarily complex custom shapes that `clip-path`'s built-in shape functions can't express (recall `polygon()` above is limited to straight-edged shapes; a mask image can define genuinely any silhouette, including soft or curved edges).

---

# Practical Example: A Fading Content List

```html
<div class="scroll-list">
  <div class="item">Item 1</div>
  <div class="item">Item 2</div>
  <div class="item">Item 3</div>
</div>
```
```css
.scroll-list {
  height: 200px;
  overflow-y: auto;
  mask-image: linear-gradient(to bottom, black 85%, transparent 100%);
}
```

Recall `overflow-y: auto` from Module 05 — as the list scrolls, its bottom edge always fades smoothly to nothing rather than cutting off abruptly, a genuinely subtle but polished visual hint that more scrollable content exists below the visible area.

---

# Revision Questions

1. What's the key difference between what `shape-outside` and `clip-path` each actually affect?
2. Why are `shape-outside` and `clip-path` commonly used together with the same shape value?
3. What determines how much of an element shows through when using `mask-image` with a gradient?

<details><summary>Answers</summary>

1. `shape-outside` only affects how *surrounding content flows around* the element's boundary — it doesn't change the element's own appearance. `clip-path` changes the element's own *visible shape* by clipping away anything outside the traced outline, but doesn't affect how other content wraps around it.
2. Using the same shape value for both makes the element visually match the shape that surrounding text actually wraps around — without both, you could get a circular-looking image (via `clip-path` alone) with text still wrapping around its underlying square box (since `shape-outside` wasn't set to match).
3. The gradient's opacity values — fully opaque stops render the element normally, while transparent stops fade it away, producing a smooth fade rather than a hard cutoff.

</details>
