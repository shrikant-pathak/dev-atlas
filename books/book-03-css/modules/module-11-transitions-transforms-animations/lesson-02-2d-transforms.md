# Lesson 02: 2D Transforms

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `translate()`, `rotate()`, `scale()`, and `skew()`.
- Combine multiple transform functions in one declaration.
- Control the transform's pivot point with `transform-origin`.

---

# Introduction

`transform` has appeared in previews throughout this book — the tooltip in Module 10, the hover card in Lesson 01. This lesson covers it properly: a single property capable of moving, rotating, resizing, and skewing an element, all without affecting the document's normal layout flow.

---

# `translate()` — Moving an Element

```css
.box {
  transform: translateX(20px);
  transform: translateY(-10px);
  transform: translate(20px, -10px); /* x, y together */
}
```

Recall from Module 10's tooltip: `translate()` shifts an element visually, but — critically — **without affecting layout**, unlike changing `margin` or `top`/`left`, which do shift surrounding content. This makes `translate()` the preferred tool for hover lifts, sliding panels, and any movement that shouldn't disturb the rest of the page.

---

# `rotate()`

```css
.icon {
  transform: rotate(45deg);
  transform: rotate(-90deg); /* negative = counter-clockwise */
}
```

Rotates the element around its center by default, measured in degrees.

---

# `scale()`

```css
.box {
  transform: scale(1.1);       /* 110% size, both axes uniformly */
  transform: scale(1.5, 0.8);  /* x: 150%, y: 80% — non-uniform */
  transform: scaleX(1.2);
  transform: scaleY(0.9);
}
```

Recall this from Lesson 01's `:active` button preview — `scale()` resizes without triggering layout reflow the way changing `width`/`height` would, making it a genuinely more performant choice for animated resizing effects (more on performance in Lesson 04).

---

# `skew()`

```css
.parallelogram {
  transform: skewX(-15deg);
}
```

Slants an element along an axis — used less frequently than the others, but a recognizable stylistic technique for angled banners, card cutouts, or dynamic-feeling section dividers.

---

# Combining Multiple Transforms

```css
.box {
  transform: translateX(20px) rotate(15deg) scale(1.1);
}
```

Multiple functions in one `transform` value apply in the order written, left to right — genuinely important to note, since `translate(20px, 0) rotate(45deg)` and `rotate(45deg) translate(20px, 0)` produce visually different results (the second rotates the coordinate system *before* translating along it).

---

# `transform-origin` — Changing the Pivot Point

```css
.box {
  transform-origin: top left; /* default is "center center" */
  transform: rotate(45deg);
}
```

By default, `rotate()` and `scale()` pivot around the element's exact center. `transform-origin` moves that pivot point — `top left` makes a rotation swing from the corner instead, useful for effects like a page-curl or a menu that unfurls from one edge rather than expanding from its middle.

---

# Practical Example: An Animated Icon Toggle

```html
<button class="toggle-icon">+</button>
```
```css
.toggle-icon {
  display: inline-block;
  transition: transform 0.3s ease;
}

.toggle-icon.open {
  transform: rotate(45deg); /* a "+" visually becomes an "×" */
}
```

Recall `transition` from Lesson 01 — a genuinely common, minimal pattern: rotating a plus icon 45 degrees turns it into a visual "×", commonly used for expand/collapse toggles, with the actual open/closed state controlled by toggling the `.open` class (via JavaScript, since CSS alone can't track click state persistently — recall this same limitation from Module 10's dropdown).

---

# Revision Questions

1. Why is `translate()` generally preferred over changing `margin` or `top`/`left` for hover-lift effects?
2. Does the order of chained transform functions matter? Give an example of why.
3. What does `transform-origin` control, and what's its default value?

<details><summary>Answers</summary>

1. `translate()` moves an element visually without affecting the document's layout flow, so surrounding content doesn't shift — unlike `margin` or `top`/`left`, which do affect layout.
2. Yes — transforms apply left to right, and each subsequent function operates within the coordinate system already altered by the previous one. `translate(20px, 0) rotate(45deg)` and `rotate(45deg) translate(20px, 0)` produce visually different results because the second rotates the axis before translating along it.
3. It controls the pivot point that `rotate()` and `scale()` operate around; its default value is `center center` (the element's exact middle).

</details>
