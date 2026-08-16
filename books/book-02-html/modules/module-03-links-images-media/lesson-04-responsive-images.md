cat > lesson-04-responsive-images.md << 'EOF'
# Lesson 04: Responsive Images

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain why a single fixed image doesn't work well across all devices.
- Use `srcset` to serve different image resolutions.
- Use `<picture>` to serve entirely different images based on context.

---

# Introduction

A single `<img>` with one fixed `src` sends the *exact same file* to a phone on a slow connection and a 4K desktop monitor — wasteful at best, genuinely poor UX at worst. This lesson covers HTML's built-in solutions, which work *before* any CSS or JavaScript gets involved.

---

# The Problem: One Size Fits None

Recall from Book 01's networking modules — a large image takes real time to download over a network. Sending a 3000px-wide image to a 375px-wide phone screen wastes bandwidth and slows page load, for zero visual benefit.

---

# `srcset`: Multiple Resolutions, Same Image

`srcset` lets you offer the browser several versions of the same image at different resolutions, letting the browser pick the most appropriate one based on the device's actual screen size and pixel density:

```html
<img
  src="photo-800w.jpg"
  srcset="photo-400w.jpg 400w, photo-800w.jpg 800w, photo-1200w.jpg 1200w"
  sizes="(max-width: 600px) 400px, 800px"
  alt="A golden retriever running on a beach"
>
```

- Each entry in `srcset` pairs a file with its actual width (`400w` means "this file is 400 pixels wide").
- `sizes` tells the browser how wide the image will actually be displayed at different viewport widths, so it can choose the best-fitting source.
- `src` remains as a fallback for browsers that don't support `srcset`.

The browser — not your code — decides which file to actually download, based on the visitor's specific device and connection.

---

# `<picture>`: Different Images for Different Contexts

While `srcset` serves the *same image* at different resolutions, `<picture>` lets you serve genuinely *different images* — useful for art direction (e.g., a cropped close-up on mobile vs. a wide landscape shot on desktop) or serving modern image formats with fallbacks:

```html
<picture>
  <source media="(max-width: 600px)" srcset="photo-mobile.jpg">
  <source media="(min-width: 601px)" srcset="photo-desktop.jpg">
  <img src="photo-desktop.jpg" alt="A golden retriever running on a beach">
</picture>
```

The browser evaluates each `<source>`'s `media` condition in order and uses the first match; the `<img>` at the end is the required fallback.

**Format fallback pattern** (serving a modern, smaller format like WebP with a safe fallback):
```html
<picture>
  <source srcset="photo.webp" type="image/webp">
  <img src="photo.jpg" alt="A golden retriever running on a beach">
</picture>
```

---

# `srcset` vs. `<picture>`: When to Use Which

| Situation | Use |
|---|---|
| Same image, different resolutions for performance | `srcset` |
| Genuinely different images for different screen sizes (art direction) | `<picture>` |
| Serving a modern format with a fallback | `<picture>` |

---

# Practical Example

```html
<picture>
  <source media="(max-width: 500px)" srcset="banner-mobile.jpg">
  <source srcset="banner-desktop.jpg">
  <img
    src="banner-desktop.jpg"
    srcset="banner-desktop-1x.jpg 1x, banner-desktop-2x.jpg 2x"
    alt="Dev Atlas roadmap banner"
  >
</picture>
```

---

# Revision Questions

1. What problem does `srcset` solve that a plain `<img src="...">` doesn't?
2. What's the key difference between `srcset` and `<picture>`?
3. Why is the `<img>` tag still required inside a `<picture>` element?

<details><summary>Answers</summary>

1. It lets the browser choose an appropriately-sized image file based on the actual device/screen, avoiding sending unnecessarily large files to smaller screens.
2. `srcset` offers different resolutions of the *same* image; `<picture>` can serve genuinely *different* images based on conditions like screen size or format support.
3. It serves as the required fallback for browsers that don't support `<picture>`/`<source>`, and defines the default image and alt text.

</details>
EOF