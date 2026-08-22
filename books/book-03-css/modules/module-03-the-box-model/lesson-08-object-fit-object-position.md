# Lesson 08: object-fit & object-position

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `object-fit` to control how an image/video fills its container.
- Use `object-position` to control which part of the image is visible.
- Understand why this genuinely matters for real-world responsive image galleries.

---

# Introduction

This final lesson of Module 03 solves a genuinely common, frustrating problem: what happens when an image's natural aspect ratio doesn't match the fixed-size box you want to display it in? Recall Book 02, Module 03's `<img>` and responsive images lessons — this is the CSS-side complement to that HTML foundation.

---

# The Problem

```css
.thumbnail {
  width: 200px;
  height: 200px;
}
```
```html
<img class="thumbnail" src="landscape-photo.jpg" alt="A wide landscape photo">
```

If `landscape-photo.jpg` is naturally wide and short (like a typical landscape photograph), forcing it into a perfectly square 200×200 box via plain `width`/`height` will **stretch and distort it**, ruining its proportions — a genuinely common, ugly bug in image galleries and card layouts before this lesson's properties existed.

---

# `object-fit`: Controlling How the Image Fills Its Box

```css
.thumbnail {
  width: 200px;
  height: 200px;
  object-fit: cover;
}
```

- **`fill`** (the default) — stretches the image to exactly fill the box, distorting its aspect ratio (the problem described above).
- **`cover`** — scales the image to completely fill the box while preserving its aspect ratio, cropping whatever doesn't fit. Genuinely the most commonly used value for thumbnails, profile pictures, and card images.
- **`contain`** — scales the image to fit entirely *within* the box while preserving aspect ratio, potentially leaving empty space (letterboxing) if the proportions don't match.
- **`none`** — the image ignores the box's size entirely, displaying at its natural size (likely overflowing or under-filling the box).

---

# Visual Comparison

Original image: wide landscape (e.g., 800×400)
Box: 200×200 (square)

fill: [stretched/distorted square]
cover: [cropped, but proportionally correct square]
contain: [whole image visible, but with empty space top/bottom]

**`cover` is genuinely the right choice for the vast majority of thumbnail/card/avatar use cases** — it guarantees the box is completely filled with zero distortion, at the cost of cropping some of the original image's edges.

---

# `object-position`: Controlling Which Part Is Visible

When using `object-fit: cover`, part of the image gets cropped — `object-position` controls *which* part remains visible:

```css
.portrait-thumbnail {
  width: 200px;
  height: 200px;
  object-fit: cover;
  object-position: top; /* keep the top of the image visible, crop from the bottom */
}
```

Common values: `center` (default), `top`, `bottom`, `left`, `right`, or precise percentages/pixel values (`50% 20%`). Genuinely useful for portrait photos where you want to guarantee a person's face stays visible rather than being cropped out by a default center-crop.

---

# Applies to `<video>` Too

Both properties work identically on `<video>` elements (Book 02, Module 03), useful for background video patterns or video thumbnails needing the exact same fixed-box-with-preserved-aspect-ratio treatment.

```css
video.hero-background {
  width: 100%;
  height: 100vh;
  object-fit: cover;
}
```

---

# Practical Example

```html
<div class="gallery">
  <img src="photo1.jpg" alt="..." class="thumb">
  <img src="photo2.jpg" alt="..." class="thumb">
  <img src="photo3.jpg" alt="..." class="thumb">
</div>
```
```css
.thumb {
  width: 150px;
  height: 150px;
  object-fit: cover;
  object-position: center;
  border-radius: 8px;
}
```

---

# Revision Questions

1. What problem does `object-fit` solve, and what causes it without this property?
2. What's the difference between `object-fit: cover` and `object-fit: contain`?
3. What does `object-position: top` do when combined with `object-fit: cover`?

<details><summary>Answers</summary>

1. It solves image distortion/stretching when an image's natural aspect ratio doesn't match its container's fixed size; without it, plain `width`/`height` forces the image to stretch to fit, distorting its proportions.
2. `cover` scales the image to completely fill the box while preserving aspect ratio, cropping any excess; `contain` scales the image to fit entirely within the box while preserving aspect ratio, potentially leaving empty space if proportions don't match.
3. It keeps the top portion of the image visible within the cropped box, cropping away content from the bottom instead of using the default center-crop.

</details>

---

# 🏁 Module 03 Checkpoint

Before moving to Module 04, you should be able to:
- [ ] Explain and identify the four layers of the box model
- [ ] Use margin/padding shorthand correctly, and predict margin collapsing
- [ ] Apply `box-sizing: border-box` and explain why it's a near-universal convention
- [ ] Use `outline` correctly, without breaking keyboard accessibility
- [ ] Create rounded corners, circles, and decorative borders
- [ ] Style lists (including navigation menus) and tables (zebra-striping, hover states)
- [ ] Use `object-fit`/`object-position` to prevent image distortion

**Next up:** Module 04 — Selectors & Combinators
