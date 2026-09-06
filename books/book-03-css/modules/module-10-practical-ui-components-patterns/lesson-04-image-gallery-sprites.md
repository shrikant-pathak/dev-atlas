# Lesson 04: Image Gallery & Sprites

## Learning Objectives
By the end of this lesson, you will be able to:
- Build a responsive image gallery using Grid.
- Explain what a CSS sprite sheet is and why it was historically used.
- Position a sprite using `background-position`.

---

# Introduction

This lesson covers two genuinely different topics that both revolve around displaying multiple images efficiently: building an actual photo gallery layout, and the older-but-still-occasionally-relevant technique of sprite sheets for icons.

---

# A Responsive Image Gallery

```html
<div class="gallery">
  <img src="1.jpg" alt="">
  <img src="2.jpg" alt="">
  <img src="3.jpg" alt="">
  <img src="4.jpg" alt="">
</div>
```
```css
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 0.75rem;
}

.gallery img {
  width: 100%;
  aspect-ratio: 1 / 1;
  object-fit: cover;
  border-radius: 4px;
}
```

Recall `auto-fit`/`minmax()` from Module 07, and `aspect-ratio` + `object-fit` from Modules 08–09 — every image in the gallery renders as a uniform square, regardless of its original dimensions, and the column count adjusts automatically to the viewport with zero media queries.

---

# A Masonry-Style Variation

```css
.gallery-masonry {
  columns: 3 200px; /* CSS multi-column layout, previewed here for Lesson 05 */
  gap: 0.75rem;
}

.gallery-masonry img {
  width: 100%;
  margin-bottom: 0.75rem;
  border-radius: 4px;
  break-inside: avoid;
}
```

Unlike the uniform Grid gallery above, this version lets images keep their natural aspect ratios and flow into columns like a newspaper — the classic "masonry" or "Pinterest-style" look. `break-inside: avoid` prevents an image from being awkwardly split across two columns.

---

# What Is a CSS Sprite Sheet?

A **sprite sheet** is a single image file containing many smaller icons or images arranged in a grid, loaded once and displayed piece-by-piece using `background-position` to "crop" to just the relevant section:

```css
.icon {
  width: 32px;
  height: 32px;
  background-image: url("icons-sprite.png");
  background-repeat: no-repeat;
}

.icon-home    { background-position: 0 0; }
.icon-search  { background-position: -32px 0; }
.icon-profile { background-position: -64px 0; }
```

Each icon variant shifts the background image by exactly one icon-width using negative `background-position` values, revealing a different section of the same underlying sprite sheet through the fixed-size `.icon` window.

---

# Why Sprites Existed (and Why They Matter Less Now)

Historically, sprite sheets solved a real performance problem: loading twenty separate small icon files meant twenty separate HTTP requests, each with its own overhead. Combining them into one sprite sheet meant a single request for all icons.

Worth being direct about this: modern HTTP/2 (and HTTP/3) connections handle many small concurrent requests far more efficiently than the older HTTP/1.1 protocol sprites were designed around, and SVG icons or icon fonts have largely replaced sprite sheets in current practice. This technique is included here because it still appears in older/legacy codebases and remains a useful "how does this old code work" skill — not because it's the first tool to reach for in a new 2026 project.

---

# Practical Example: A Simple Icon Sprite System

```html
<span class="icon icon-home"></span>
<span class="icon icon-search"></span>
```
```css
.icon {
  display: inline-block;
  width: 24px;
  height: 24px;
  background-image: url("icons.png");
  background-repeat: no-repeat;
  vertical-align: middle;
}

.icon-home   { background-position: 0 0; }
.icon-search { background-position: -24px 0; }
```

One image file, two icons, positioned via simple arithmetic on the sprite's known layout — genuinely worth recognizing this pattern if you encounter it in an older codebase, even if you'd reach for SVGs on a new project today.

---

# Revision Questions

1. What Grid feature makes an image gallery reflow its column count automatically without media queries?
2. What problem did sprite sheets historically solve, and why does that problem matter less today?
3. How does `background-position` reveal a specific icon within a sprite sheet?

<details><summary>Answers</summary>

1. `grid-template-columns: repeat(auto-fit, minmax(...))`.
2. They combined many small icon images into a single file to reduce the number of separate HTTP requests, which mattered more under the older HTTP/1.1 protocol; modern HTTP/2/3 handles many concurrent small requests far more efficiently, and SVGs/icon fonts have largely replaced sprites in current practice.
3. By setting `background-position` to negative offsets matching the icon's location within the sprite sheet, shifting the image so only the desired icon shows through the element's fixed-size viewing window.

</details>
