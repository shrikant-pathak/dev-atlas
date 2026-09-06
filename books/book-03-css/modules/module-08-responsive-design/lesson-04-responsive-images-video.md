# Lesson 04: Responsive Images & Video

## Learning Objectives
By the end of this lesson, you will be able to:
- Make images and video scale correctly within responsive containers.
- Use `srcset` and `sizes` to serve appropriately sized images per device.
- Use `<picture>` for art direction, and apply `object-fit` in a responsive context.

---

# Introduction

Layouts aren't the only thing that needs to respond to screen size — media does too. An image that's a fixed 1200px wide will overflow a 375px phone screen; conversely, forcing a phone to download a massive desktop-resolution image wastes bandwidth for no visual benefit. This lesson covers both problems.

---

# The Baseline Fix: Fluid Images & Video

```css
img, video {
  max-width: 100%;
  height: auto;
}
```

This single, near-universal rule is worth adding to almost every project's base stylesheet: `max-width: 100%` prevents media from ever exceeding its container's width, and `height: auto` preserves its aspect ratio as it scales down. Without this, images and video are one of the most common causes of horizontal overflow on mobile.

---

# `object-fit` in a Responsive Context

Recall `object-fit` from Module 03, Lesson 08 — it's especially useful once media needs to adapt to containers of varying, responsive sizes:

```css
.card-image {
  width: 100%;
  height: 200px;
  object-fit: cover;
}
```

As the card's width changes across breakpoints, the image container resizes with it, but `object-fit: cover` ensures the image itself always fills that space without distortion — cropping as needed rather than stretching.

---

# `srcset` — Serving the Right Resolution

```html
<img
  src="photo-800w.jpg"
  srcset="photo-400w.jpg 400w, photo-800w.jpg 800w, photo-1200w.jpg 1200w"
  sizes="(max-width: 600px) 100vw, 50vw"
  alt="A description of the photo"
>
```

- **`srcset`** lists multiple versions of the same image, each labeled with its actual pixel width (`400w` means "this file is 400 pixels wide").
- **`sizes`** tells the browser how wide the image will actually be *displayed* at different viewport widths — here, full viewport width (`100vw`) on screens 600px or narrower, and half the viewport width (`50vw`) otherwise.
- The browser combines this with the device's actual screen size and pixel density to pick the *smallest sufficient* file from `srcset` — a phone might download `photo-400w.jpg`, while a desktop downloads `photo-1200w.jpg`.
- **`src`** remains as a fallback for browsers that don't support `srcset`.

This is a genuinely significant performance technique — mobile users, who may be on constrained connections, never download desktop-resolution images they don't need.

---

# The `<picture>` Element — Art Direction

`srcset` picks *resolutions* of the same image; `<picture>` lets you serve genuinely *different crops or images* at different breakpoints:

```html
<picture>
  <source media="(max-width: 600px)" srcset="banner-mobile.jpg">
  <source media="(min-width: 601px)" srcset="banner-desktop.jpg">
  <img src="banner-desktop.jpg" alt="Promotional banner">
</picture>
```

The browser evaluates each `<source>`'s `media` condition top to bottom and uses the first match; the `<img>` at the end is both the fallback and required for accessibility/older-browser support.

---

# Responsive Video

```html
<video controls style="max-width: 100%; height: auto;">
  <source src="demo.mp4" type="video/mp4">
</video>
```

The same fluid-media rule applies directly to `<video>` — with the added note that video files aren't resolution-switched via `srcset` (that's an image-only attribute); serving multiple video resolutions typically requires either separate `<source>` elements with `media` conditions (mirroring the `<picture>` pattern) or, for real production use, a streaming format like HLS that adapts automatically.

---

# Practical Example: A Responsive Hero Image

```html
<picture>
  <source media="(max-width: 600px)" srcset="hero-mobile.jpg">
  <img
    src="hero-desktop.jpg"
    srcset="hero-desktop.jpg 1200w, hero-desktop-2x.jpg 2400w"
    sizes="100vw"
    alt="Hero banner"
    style="width: 100%; height: 400px; object-fit: cover;"
  >
</picture>
```

Mobile devices get a genuinely different, tighter crop (`hero-mobile.jpg`); desktop devices get the wide version, additionally resolution-matched via `srcset` for standard vs. high-DPI ("retina") screens — and `object-fit: cover` keeps it filling its 400px-tall box regardless of the source image's actual aspect ratio.

---

# Revision Questions

1. What two CSS properties form the baseline fix for media overflowing their containers?
2. What's the difference between what `srcset` and `<picture>` are each used for?
3. Why does serving smaller images to mobile devices matter beyond just visual fit?

<details><summary>Answers</summary>

1. `max-width: 100%` and `height: auto`.
2. `srcset` lets the browser pick the best resolution of the *same* image based on screen size/density; `<picture>` lets you serve genuinely *different* images or crops depending on the matched media condition (art direction).
3. Performance — mobile devices are often on more constrained connections, so downloading a smaller, appropriately-sized image instead of a full desktop-resolution one saves bandwidth and load time with no visual downside.

</details>
