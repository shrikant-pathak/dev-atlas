# Lesson 05: aspect-ratio

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what the `aspect-ratio` property does and the layout-shift problem it solves.
- Apply `aspect-ratio` to images, video embeds, and custom boxes.
- Combine `aspect-ratio` with `object-fit` for responsive media.

---

# Introduction

This module closes with a small but genuinely high-impact property. Before `aspect-ratio` existed, keeping an element's proportions fixed while its width changed responsively required an awkward trick — and getting it wrong is one of the most common causes of pages visibly "jumping" as they load, an issue serious enough that it's a factor in real performance scoring.

---

# The Old Trick (Worth Knowing, Rarely Needed Now)

```css
.video-wrapper {
  position: relative;
  padding-top: 56.25%; /* 16:9 aspect ratio, expressed as a percentage of width */
}
.video-wrapper iframe {
  position: absolute;
  top: 0; left: 0;
  width: 100%; height: 100%;
}
```

This worked by exploiting a quirk: percentage-based padding is calculated relative to an element's *width*, even for `padding-top`. `56.25%` is `9 / 16`, producing a reliable 16:9 box regardless of actual width. It's clever, but genuinely unintuitive to read or maintain — recall `position: absolute` and stacking behavior from Module 05.

---

# The Modern Way: `aspect-ratio`

```css
.video-wrapper {
  aspect-ratio: 16 / 9;
}
```

One line, doing exactly what it says. The element's height is automatically calculated to maintain a 16:9 ratio to its width, at any width — no padding hack, no absolutely-positioned children required.

```html
<iframe class="video-wrapper" src="..." style="width: 100%;"></iframe>
```

---

# Why This Matters: Preventing Layout Shift

Recall from Lesson 04 that an `<img>` without explicit dimensions can cause the page to visibly jump as it loads — the browser doesn't know how much vertical space to reserve until the image file finishes downloading and its real dimensions are known. `aspect-ratio` fixes this cleanly:

```css
img {
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
}
```

The browser now reserves the correct space for the image *immediately*, based on the declared ratio, before the file even finishes loading — the surrounding content doesn't shift when the image pops in. Recall `object-fit: cover` from Lesson 04 — pairing it with `aspect-ratio` here ensures the image fills that reserved box correctly without distortion, regardless of the source file's actual native dimensions.

---

# Common Ratios

```css
.square    { aspect-ratio: 1 / 1; }
.widescreen{ aspect-ratio: 16 / 9; }
.classic   { aspect-ratio: 4 / 3; }
.portrait  { aspect-ratio: 3 / 4; }
.golden    { aspect-ratio: 1.618; } /* a single number is also valid: width/height */
```

`aspect-ratio` accepts either a `width / height` pair or a single decimal number expressing the same ratio — both are valid syntax.

---

# Using `aspect-ratio` on Non-Media Boxes

It isn't limited to images and video — any element can hold a fixed ratio, useful for placeholder boxes, avatar containers, or custom UI:

```css
.avatar {
  width: 80px;
  aspect-ratio: 1 / 1;
  border-radius: 50%;
  overflow: hidden;
}
```

Only `width` is set here; `aspect-ratio: 1 / 1` calculates the matching `height` automatically, guaranteeing a perfect circle at any configured width — recall `border-radius: 50%` from Module 03.

---

# Practical Example: A Responsive Video Grid

```html
<div class="video-grid">
  <iframe class="video" src="..."></iframe>
  <iframe class="video" src="..."></iframe>
</div>
```
```css
.video-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1rem;
}

.video {
  width: 100%;
  aspect-ratio: 16 / 9;
  border: none;
}
```

Recall `auto-fit` and `minmax()` from Module 07 — a responsive grid of embedded videos, each one automatically maintaining a correct 16:9 shape at whatever width the grid assigns it, with zero JavaScript and zero padding hacks.

---

# Revision Questions

1. What problem does `aspect-ratio` solve that relates to page loading and layout shift?
2. What was the common workaround for fixed aspect ratios before this property existed, and why was it considered a "hack"?
3. Can `aspect-ratio` be used on elements other than images and video? Give an example.

<details><summary>Answers</summary>

1. Without a declared ratio, the browser doesn't know how much space to reserve for media before it finishes loading, causing surrounding content to visibly shift once the real dimensions are known. `aspect-ratio` lets the browser reserve the correct space immediately.
2. The "padding-top percentage" trick — exploiting the fact that percentage-based `padding-top` is calculated relative to an element's width, used to fake a fixed ratio via an absolutely-positioned child. It's considered a hack because it's unintuitive to read and requires extra wrapper markup.
3. Yes — any element can use it, e.g. a fixed-ratio avatar container (`width` + `aspect-ratio: 1 / 1` + `border-radius: 50%`) to guarantee a perfect circle at any size.

</details>
