# Lesson 05: Scroll Snap

## Learning Objectives
By the end of this lesson, you will be able to:
- Set up a scroll-snap container with `scroll-snap-type`.
- Mark individual children as snap points with `scroll-snap-align`.
- Build a horizontal, full-screen-section, and carousel scroll-snap layout.

---

# Introduction

This module's closing lesson covers a genuinely elegant, pure-CSS technique for a UI pattern that historically required JavaScript scroll-position calculation: making a scrolling container "snap" cleanly to specific child elements as the user scrolls, rather than stopping at an arbitrary in-between position.

---

# Setting Up the Container

```css
.scroll-container {
  scroll-snap-type: x mandatory;
  overflow-x: auto;
  display: flex;
}
```

- **`scroll-snap-type: x mandatory`** — enables snapping along the horizontal (`x`) axis, and `mandatory` forces the scroll position to always land on a snap point rather than allowing it to rest anywhere (`proximity` is a softer alternative, snapping only when scrolling naturally comes to a stop near a snap point).
- Recall `overflow-x: auto` from Module 05 — a scrollable container is required for there to be anything to snap *within*.

---

# Marking the Snap Points

```css
.scroll-item {
  scroll-snap-align: start; /* or: center, end */
  flex: 0 0 100%; /* recall flex-shrink/flex-basis from Module 06 */
}
```

`scroll-snap-align` goes on the *children*, marking which part of each child aligns with the scroll container's edge when snapped — `start` aligns the child's beginning with the container's start, `center` centers it within the visible viewport, and so on.

---

# Practical Example 1: A Horizontal Card Carousel

```html
<div class="carousel">
  <div class="carousel-item">1</div>
  <div class="carousel-item">2</div>
  <div class="carousel-item">3</div>
</div>
```
```css
.carousel {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  gap: 1rem;
}

.carousel-item {
  flex: 0 0 80%;
  scroll-snap-align: center;
  height: 200px;
  background: #4a90d9;
  border-radius: 8px;
}
```

Recall Flexbox from Module 06 — swiping or dragging through this carousel snaps cleanly to center each card in turn, rather than leaving it stopped halfway between two cards — genuinely the exact interaction pattern behind countless mobile app and site carousels, achieved with zero JavaScript.

---

# Practical Example 2: Full-Screen Vertical Sections

```css
.sections {
  height: 100vh;
  overflow-y: scroll;
  scroll-snap-type: y mandatory;
}

.section {
  height: 100vh;
  scroll-snap-align: start;
}
```

Recall `vh` units from Module 02 — each `.section` fills the full viewport height, and scrolling snaps cleanly from one full section to the next, the classic "full-page-scroll" website pattern.

---

# `scroll-padding` — Accounting for a Sticky Header

```css
.sections {
  scroll-snap-type: y mandatory;
  scroll-padding-top: 60px; /* height of a sticky navbar */
}
```

Recall the sticky navbar from Module 10, Lesson 01 — without `scroll-padding-top` accounting for its height, a snapped section's top content could end up hidden underneath the sticky header. `scroll-padding` shifts the *effective* snap boundary inward, ensuring content lands visibly below the fixed header instead.

---

# `scroll-behavior: smooth` — A Complementary Property

```css
html {
  scroll-behavior: smooth;
}
```

Worth mentioning alongside scroll-snap, though a genuinely distinct feature: `scroll-behavior: smooth` animates *any* scroll jump (including clicking an anchor link) rather than jumping instantly — often paired with scroll-snap for an overall polished scrolling feel, though it works independently of snapping too.

---

# Practical Example: A Complete Snapping Gallery

```html
<div class="gallery-scroll">
  <img src="1.jpg" class="gallery-scroll-item">
  <img src="2.jpg" class="gallery-scroll-item">
  <img src="3.jpg" class="gallery-scroll-item">
</div>
```
```css
.gallery-scroll {
  display: flex;
  overflow-x: auto;
  scroll-snap-type: x mandatory;
  scroll-behavior: smooth;
  gap: 0;
}

.gallery-scroll-item {
  flex: 0 0 100%;
  scroll-snap-align: start;
  height: 400px;
  object-fit: cover;
}
```

Recall `object-fit` from Module 03 — a full-bleed, one-image-at-a-time horizontal gallery, snapping cleanly between full-width images as the user scrolls or swipes, with smooth scroll behavior layered on top.

---

# Revision Questions

1. What's the difference between `scroll-snap-type: x mandatory` and using `proximity` instead?
2. Which element does `scroll-snap-align` go on — the scroll container or its children?
3. What problem does `scroll-padding-top` solve in a snapping layout?

<details><summary>Answers</summary>

1. `mandatory` forces the scroll position to always land on a defined snap point; `proximity` only snaps when a natural scroll stop happens to land near a snap point, otherwise allowing it to rest anywhere.
2. The children — it marks which part of each child aligns with the container's edge when a snap occurs.
3. It accounts for a sticky/fixed header's height by shifting the effective snap boundary inward, preventing a snapped section's top content from being hidden underneath the fixed header.

</details>
