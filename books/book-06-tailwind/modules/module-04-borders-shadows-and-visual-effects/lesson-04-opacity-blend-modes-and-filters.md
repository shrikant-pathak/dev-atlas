# Lesson 04: Opacity, Blend Modes, and Filters

## Learning Objectives
- Apply element-wide opacity, distinct from Module 03's per-color opacity syntax
- Apply blend mode utilities for compositing effects between elements
- Apply filter utilities (blur, brightness, grayscale, etc.) to transform an element's rendering

## Introduction
Module 03 covered per-color opacity (`bg-black/50`). This lesson covers element-wide opacity (affecting everything inside an element, not just one property), blend modes, and CSS filters — a set of utilities for transforming how an element renders, independent of its actual content.

## Element Opacity: `opacity-*`

```html
<div class="opacity-50">Everything inside, including children, is 50% transparent</div>
```

`opacity-0` through `opacity-100` (in steps of 5 or 10, plus some finer increments) sets the CSS `opacity` property on the entire element — critically, this affects the whole element and everything nested inside it uniformly, unlike the slash syntax from Module 03, which only affects a single color property (like just the background) while leaving the rest of the element's content at full opacity.

```html
<!-- Only the background is translucent; text stays fully opaque -->
<div class="bg-black/50"><p class="text-white">Fully readable text</p></div>

<!-- Everything, including the text, becomes translucent together -->
<div class="bg-black opacity-50"><p class="text-white">Dimmer, translucent text too</p></div>
```

This distinction matters: disabled form elements often use `opacity-50` (dimming everything uniformly to signal "unavailable"), while a modal backdrop uses the slash syntax on just the background (so the backdrop dims without affecting anything layered on top of it).

## Blend Modes

`mix-blend-*` controls how an element's rendered content blends with whatever is behind it (other elements, the background):

```html
<div class="bg-blue-500 mix-blend-multiply">Blends with layers beneath it</div>
```

Common values: `mix-blend-normal` (default), `mix-blend-multiply`, `mix-blend-screen`, `mix-blend-overlay`, `mix-blend-darken`, `mix-blend-lighten` — these map directly to Photoshop-style blend modes, if you're familiar with design tools. `bg-blend-*` applies the same blending specifically between a background color and a background image on the same element.

## Filters

Filters transform how an element renders visually, without touching the underlying markup or content:

| Class | Effect |
|---|---|
| `blur-sm`/`blur`/`blur-lg`/`blur-xl` | Gaussian blur |
| `brightness-50`/`brightness-150` | brightness adjustment (below/above 100%) |
| `contrast-125` | contrast adjustment |
| `grayscale` | fully desaturates |
| `sepia` | sepia tone |
| `saturate-150` | saturation adjustment |
| `invert` | inverts colors |
| `hue-rotate-90` | rotates hue by a given degree |
| `drop-shadow-lg` | a shadow that follows an element's actual transparent shape (unlike `shadow-*`, which only follows the box's rectangular edges — relevant for non-rectangular content like an icon or a logo with transparency) |

```html
<img class="grayscale transition hover:grayscale-0" src="/photo.jpg" alt="" />
```

This is a common hover-reveal-color pattern: a photo starts desaturated (`grayscale`) and smoothly returns to full color on hover (`hover:grayscale-0`), combined with Lesson 6's `transition` utility for a smooth animated effect rather than an instant snap.

## Practical Example

A disabled button (element opacity), a photo gallery with grayscale-to-color hover, and a logo using `drop-shadow` to follow its actual silhouette rather than a rectangular box:

```html
<button class="opacity-50" disabled>Unavailable</button>

<img class="grayscale transition duration-300 hover:grayscale-0" src="/photo.jpg" alt="" />

<img class="drop-shadow-lg" src="/logo-transparent.png" alt="Logo" />
```

## Summary
`opacity-*` dims an entire element and its children uniformly, distinct from Module 03's slash syntax which only affects one color property. `mix-blend-*`/`bg-blend-*` composite elements using Photoshop-style blend modes. Filters (`blur-*`, `grayscale`, `brightness-*`, etc.) transform an element's rendering; `drop-shadow-*` is a filter-based shadow that follows an element's actual transparent shape, unlike `shadow-*`'s rectangular box shadow.

## Revision Questions

<details>
<summary>1. What's the key difference between `bg-black/50` and `bg-black opacity-50` applied to the same element?</summary>

`bg-black/50` only makes the background color translucent — any text or child content inside stays fully opaque. `opacity-50` dims the entire element, including all its children, uniformly.
</details>

<details>
<summary>2. Why would `drop-shadow-lg` be a better choice than `shadow-lg` for a logo image with transparent areas?</summary>

`shadow-*` casts a shadow based on the element's rectangular box, which would include the transparent padding around a logo's actual shape. `drop-shadow-*` is filter-based and follows the element's actual visible (non-transparent) silhouette instead.
</details>

<details>
<summary>3. Describe the hover effect created by combining `grayscale` and `hover:grayscale-0` on an image.</summary>

The image starts desaturated (black and white) by default, and transitions to full color when hovered, since `hover:grayscale-0` removes the grayscale filter on hover — commonly paired with a `transition` utility for a smooth animated color reveal instead of an instant change.
</details>
