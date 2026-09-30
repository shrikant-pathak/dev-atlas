# Lesson 03: Width, Height, and Size

## Learning Objectives
- Apply fixed, fractional, and viewport-relative width/height utilities
- Use the v4 `size-*` utility to set width and height together
- Choose between `w-full`, `w-screen`, and dynamic viewport units for different scenarios

## Introduction
Width and height use the same numeric spacing scale from Lesson 2, plus a set of special keyword and fractional values for common layout needs — full-width elements, half-width columns, and viewport-based sizing.

## Fixed Sizes

```html
<div class="h-32 w-32 bg-blue-500"></div>   <!-- 8rem × 8rem -->
<div class="h-64 w-full bg-blue-500"></div> <!-- 16rem tall, full width -->
```

## Fractional Widths

For column-style layouts without Grid (Lesson 10), fractional utilities express width as a percentage:

```html
<div class="flex">
  <div class="w-1/3 bg-red-200">Sidebar</div>
  <div class="w-2/3 bg-blue-200">Main content</div>
</div>
```

`w-1/3` = `33.333%`, `w-2/3` = `66.667%`, and so on for halves, thirds, quarters, fifths, sixths, and twelfths.

## Keyword Sizes

| Class | CSS |
|---|---|
| `w-full` / `h-full` | `100%` (relative to parent) |
| `w-screen` | `100vw` |
| `h-screen` | `100vh` |
| `w-auto` | `auto` |
| `w-min` / `w-max` / `w-fit` | `min-content` / `max-content` / `fit-content` |

`w-full` and `w-screen` are easy to confuse: `w-full` is 100% of the **parent's** width, while `w-screen` is 100% of the **viewport**, regardless of any parent constraints — reach for `w-screen` on an element that needs to break out of a centered, max-width container.

## Dynamic Viewport Units

Mobile browsers have a well-known quirk: `100vh` doesn't account for the address bar showing/hiding as you scroll, causing content to jump or get clipped. Modern CSS added dynamic viewport units to solve this, and Tailwind exposes them directly: `h-dvh` (dynamic viewport height, adjusts as browser chrome shows/hides), `h-svh` (small viewport height, assumes browser UI is visible), `h-lvh` (large viewport height, assumes it's hidden). For a full-height mobile layout that shouldn't jump around, `h-dvh` is usually the right choice over the older `h-screen`.

## The `size-*` Utility (v4)

A very common pattern — setting equal width and height, especially for icons and avatars — used to require two classes:

```html
<!-- v3 style, still works -->
<img class="h-10 w-10 rounded-full" src="/avatar.jpg" alt="Avatar" />
```

Tailwind v4 added `size-*`, which sets both `width` and `height` from a single class:

```html
<!-- v4 shorthand -->
<img class="size-10 rounded-full" src="/avatar.jpg" alt="Avatar" />
```

`size-10` is equivalent to `h-10 w-10`. Use it whenever an element's width and height should match — it's shorter and communicates the intent ("this is a fixed square/circle") more clearly than two separate classes.

## Practical Example

A responsive hero section using `h-dvh` to avoid mobile viewport jumping, with an avatar sized via `size-*`:

```html
<section class="flex h-dvh flex-col items-center justify-center gap-4">
  <img class="size-20 rounded-full" src="/avatar.jpg" alt="Profile" />
  <h1 class="text-3xl font-bold">Welcome</h1>
</section>
```

## Summary
Width and height utilities cover fixed scale values, percentage fractions (`w-1/3`), keyword sizes (`w-full`, `w-screen`, `w-min`/`max`/`fit`), and dynamic viewport units (`h-dvh`, `h-svh`, `h-lvh`) that solve mobile browser chrome jumping. The v4 `size-*` utility sets width and height together in one class.

## Revision Questions

<details>
<summary>1. What's the difference between `w-full` and `w-screen`?</summary>

`w-full` is 100% of the parent element's width; `w-screen` is 100% of the viewport width, regardless of any parent container constraints.
</details>

<details>
<summary>2. Why might `h-dvh` be preferable to `h-screen` on a mobile landing page?</summary>

`h-screen` (`100vh`) doesn't account for mobile browser chrome (address bar) showing or hiding, which can cause content to jump or get clipped. `h-dvh` (dynamic viewport height) adjusts as the browser UI changes, avoiding that jump.
</details>

<details>
<summary>3. What does `size-10` do, and what would you have written instead in v3?</summary>

It sets both width and height to the scale value `10` (2.5rem) in one class. In v3 you'd write `h-10 w-10` as two separate classes.
</details>
