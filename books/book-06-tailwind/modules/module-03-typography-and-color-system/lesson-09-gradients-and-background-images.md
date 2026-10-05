# Lesson 09: Gradients and Background Images

## Learning Objectives
- Build linear gradients using direction and color-stop utilities
- Use v4's new radial and conic gradient utilities
- Apply background image utilities for sizing, position, and repeat behavior

## Introduction
This lesson closes out the module by covering gradients and background images — effects that combine everything learned so far (color palette, opacity) into richer visual treatments.

## Linear Gradients

A linear gradient is built from a direction utility plus one or more color-stop utilities:

```html
<div class="h-32 bg-linear-to-r from-indigo-500 via-purple-500 to-pink-500"></div>
```

| Part | Role |
|---|---|
| `bg-linear-to-r` | gradient direction (to the right) |
| `from-indigo-500` | starting color stop |
| `via-purple-500` | optional middle color stop |
| `to-pink-500` | ending color stop |

Direction utilities cover all eight compass points: `bg-linear-to-t/tr/r/br/b/bl/l/tl`. For a precise custom angle, use an arbitrary value: `bg-linear-45` (45 degrees) — this arbitrary-angle syntax is new in v4, which renamed the gradient utilities from v3's `bg-gradient-*` to `bg-linear-*` to make room for the new gradient types below.

## Radial and Conic Gradients (New in v4)

v4 added two additional gradient shapes beyond linear:

```html
<div class="h-32 w-32 rounded-full bg-radial from-yellow-300 to-orange-500"></div>
<div class="h-32 w-32 rounded-full bg-conic from-blue-500 via-purple-500 to-pink-500"></div>
```

`bg-radial` radiates color stops outward from a center point (commonly paired with a circular shape, as above). `bg-conic` sweeps color stops around a center point like a color wheel — useful for pie-chart-style visuals or decorative conic effects that simply weren't achievable with utility classes before v4.

## Background Images

For actual image backgrounds (as opposed to gradients), Tailwind provides sizing, position, and repeat control:

```html
<div class="h-64 bg-[url('/hero.jpg')] bg-cover bg-center bg-no-repeat"></div>
```

| Class | Effect |
|---|---|
| `bg-cover` | scales the image to fully cover the element, cropping as needed (parallel to `object-cover` from Module 02) |
| `bg-contain` | scales the image to fit entirely inside, without cropping |
| `bg-center` / `bg-top` / `bg-bottom` etc. | positions the image within its box |
| `bg-no-repeat` | prevents the image from tiling |
| `bg-repeat` | tiles the image (default) |

The image source itself is set via an arbitrary value, as shown above (`bg-[url('/hero.jpg')]`), since there's no finite named scale of possible image URLs the way there is for colors or spacing.

## Practical Example

A hero banner combining a background image with a gradient overlay for text legibility — a very common real-world pattern:

```html
<section class="relative h-96 bg-[url('/hero.jpg')] bg-cover bg-center">
  <div class="absolute inset-0 bg-linear-to-t from-black/70 to-transparent"></div>
  <div class="relative flex h-full items-end p-8">
    <h1 class="text-4xl font-bold text-white">Explore the Collection</h1>
  </div>
</section>
```

Here, an absolutely positioned gradient overlay (`from-black/70 to-transparent`, using Lesson 8's opacity syntax) sits between the background image and the text, darkening the bottom of the image just enough to keep white text legible without obscuring the photo entirely.

## Summary
Linear gradients combine a `bg-linear-to-*` direction with `from-*`/`via-*`/`to-*` color stops; v4 added `bg-radial` and `bg-conic` for additional gradient shapes, and arbitrary-angle linear gradients (`bg-linear-45`). Background images use `bg-[url(...)]` combined with `bg-cover`/`bg-contain`, position, and repeat utilities — commonly layered under a gradient overlay for text legibility over photos.

## Revision Questions

<details>
<summary>1. What three utility categories combine to build a three-color linear gradient?</summary>

A direction utility (`bg-linear-to-r`), a starting color stop (`from-*`), an optional middle stop (`via-*`), and an ending stop (`to-*`).
</details>

<details>
<summary>2. What two gradient shapes did v4 add beyond linear gradients?</summary>

Radial (`bg-radial`) and conic (`bg-conic`).
</details>

<details>
<summary>3. Why is a semi-transparent gradient overlay often layered on top of a hero background image?</summary>

To darken part of the image (typically using `from-black/NN to-transparent` opacity syntax) just enough to keep overlaid text legible, without fully obscuring the photo itself.
</details>
