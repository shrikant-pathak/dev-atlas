# Lesson 04: Min/Max Sizing and Container

## Learning Objectives
- Apply `min-w-*`, `max-w-*`, `min-h-*`, and `max-h-*` utilities
- Use the `container` class to build a centered, breakpoint-aware content wrapper
- Understand max-width's role in readable line lengths and responsive design

## Introduction
Fixed widths (Lesson 3) are often too rigid — content should grow with its container up to a point, then stop. `min-w-*`/`max-w-*` and `min-h-*`/`max-h-*` express these constraints directly, and are some of the most-used utilities in any real layout.

## Min and Max Width/Height

```html
<div class="min-h-screen">
  <!-- content that should fill at least the full viewport height, but can grow taller -->
</div>

<p class="max-w-prose">
  This paragraph won't grow wider than a comfortable reading measure, no matter how
  wide its parent container is.
</p>
```

`max-w-*` has a special named scale beyond plain size values — `max-w-xs`, `sm`, `md`, `lg`, `xl`, `2xl` through `7xl`, plus `max-w-prose` (a comfortable reading width, roughly 65 characters) and `max-w-full`/`max-w-screen-*`. This named scale exists because max-width is disproportionately common for content containers, so Tailwind gives it dedicated, semantically-named steps rather than forcing you to guess a raw spacing value.

`min-h-screen` (or `min-h-dvh`, combining with Lesson 3's dynamic viewport units) is one of the most common utilities in any layout — it ensures a page's content area is at least full-height, so a short page doesn't leave your footer floating in the middle of the screen, while still letting the content grow taller than the viewport if there's more of it.

## The `container` Class

`container` is a special utility that sets an element's `max-width` to match the current breakpoint, and centers it:

```html
<div class="container mx-auto px-4">
  <!-- content constrained to a sensible max-width at every breakpoint -->
</div>
```

At each responsive breakpoint (Module 05 covers breakpoints fully), `container`'s max-width snaps to that breakpoint's value — so content never gets uncomfortably wide on a large monitor, while still using the full available width on mobile. Note `container` doesn't include `mx-auto` centering or padding by default — you add those explicitly, as shown above, which is why they're so often seen together.

## Practical Example

A typical page shell combining `min-h-screen`, `container`, and `max-w-prose` for an article body:

```html
<body class="min-h-screen bg-gray-50">
  <main class="container mx-auto px-4 py-8">
    <article class="mx-auto max-w-prose">
      <h1 class="mb-4 text-3xl font-bold">Article Title</h1>
      <p>Article content stays at a comfortable reading width...</p>
    </article>
  </main>
</body>
```

## Summary
`min-w-*`/`max-w-*`/`min-h-*`/`max-h-*` set flexible size boundaries. `max-w-*` has a dedicated named scale (`max-w-prose`, `max-w-lg`, etc.) because content-width constraints are so common. `container` centers content and caps its width per breakpoint, typically paired with `mx-auto` and horizontal padding.

## Revision Questions

<details>
<summary>1. Why is `min-h-screen` (or `min-h-dvh`) so commonly used on a page's root element?</summary>

It ensures the content area is at least full viewport height — so a page with little content doesn't leave the footer floating mid-screen — while still allowing the content to grow taller than the viewport when there's more of it.
</details>

<details>
<summary>2. What does `max-w-prose` do, and why does it exist as a named value rather than a raw scale number?</summary>

It caps width at a comfortable reading measure (roughly 65 characters). It's named because content-width readability constraints are extremely common, so Tailwind gives them semantic names instead of forcing developers to guess a raw pixel/rem value.
</details>

<details>
<summary>3. Does the `container` class center itself by default? What do you need to add for that?</summary>

No — `container` only sets max-width per breakpoint. You add `mx-auto` for centering (and typically horizontal padding like `px-4`) separately.
</details>
