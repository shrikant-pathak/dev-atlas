# Lesson 01: Backgrounds & Gradients

## Learning Objectives
By the end of this lesson, you will be able to:
- Use the full range of `background-*` properties, including shorthand.
- Write linear, radial, and conic gradients.
- Layer multiple backgrounds on a single element.

---

# Introduction

Module 02 covered color values (hex, RGB, HSL); this module builds on that foundation to cover everything you can actually *do* with color and imagery as backgrounds — from simple fills to gradients to layered, positioned background images.

---

# Background Basics

```css
.box {
  background-color: #f4f4f4;
  background-image: url("pattern.png");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
```

- `background-color` — a solid fill, shown behind any background image (and visible if the image has transparency, or fails to load).
- `background-image` — one or more images/gradients layered on top of the color.
- `background-repeat` — `repeat` (default), `no-repeat`, `repeat-x`, `repeat-y`.
- `background-position` — where the image sits within the element (`center`, `top left`, `50% 50%`, etc.).
- `background-size` — `cover` (fills the box, cropping if needed), `contain` (fits entirely within the box, may leave gaps), or explicit lengths.

**Shorthand:**
```css
.box {
  background: #f4f4f4 url("pattern.png") no-repeat center / cover;
}
```
The shorthand order is `color image repeat position / size` — the slash separates position from size specifically, since both can accept similar-looking values.

---

# Linear Gradients

```css
.box {
  background: linear-gradient(to right, #ff7e5f, #feb47b);
}
```

`linear-gradient(DIRECTION, COLOR-STOPS...)` paints a smooth transition between colors along a straight line. Direction can be a keyword (`to right`, `to bottom left`) or an angle:

```css
background: linear-gradient(45deg, red, yellow, green); /* three color stops */
background: linear-gradient(to bottom, rgba(0,0,0,0) 0%, rgba(0,0,0,0.7) 100%); /* fade overlay */
```

Explicit percentages on color stops (`red 0%, yellow 50%, green 100%`) let you control exactly where each color sits along the gradient, rather than spacing them evenly by default.

---

# Radial Gradients

```css
.box {
  background: radial-gradient(circle, #ffffff, #cccccc);
}
```

Instead of a straight line, `radial-gradient()` radiates outward from a center point. It accepts a shape (`circle` or `ellipse`, the default) and an optional position:

```css
background: radial-gradient(circle at top right, yellow, transparent);
```

---

# Conic Gradients

```css
.box {
  background: conic-gradient(red, yellow, green, blue, red);
}
```

A genuinely different effect — colors sweep *around* a center point like a clock face, rather than radiating outward or across in a line. Conic gradients are the basis for pie-chart-style visuals and color wheels built in pure CSS.

---

# Layering Multiple Backgrounds

```css
.box {
  background:
    linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
    url("photo.jpg") center / cover no-repeat;
}
```

Comma-separated background layers stack, with the first one listed on top. This is a genuinely common real-world pattern: a semi-transparent gradient layered over a photo to darken it, ensuring text placed on top stays readable regardless of the photo's own brightness.

---

# Practical Example: A Hero Section With Overlay

```html
<section class="hero">
  <h1>Welcome</h1>
</section>
```
```css
.hero {
  background:
    linear-gradient(to bottom, rgba(0,0,0,0.5), rgba(0,0,0,0.2)),
    url("banner.jpg") center / cover no-repeat;
  color: white;
  padding: 4rem 2rem;
}
```

Recall responsive images from Module 08 — this same overlay technique works identically at any screen size, since `background-size: cover` scales the image to always fill the section regardless of viewport width.

---

# Revision Questions

1. What's the difference between `background-size: cover` and `background-size: contain`?
2. Write a linear gradient going from red to blue, top to bottom.
3. How do you layer a semi-transparent color over a background image?

<details><summary>Answers</summary>

1. `cover` scales the image to completely fill the element, cropping if necessary; `contain` scales the image to fit entirely within the element, potentially leaving empty space.
2. `background: linear-gradient(to bottom, red, blue);`
3. List a `linear-gradient()` (using `rgba()` colors for transparency) before the image URL in a comma-separated `background` shorthand — the gradient renders as the top layer, the image beneath it.

</details>
