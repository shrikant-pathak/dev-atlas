# Lesson 05: Sizing Utilities

## Learning Objectives
- Apply percentage-based width and height utilities (`.w-*`, `.h-*`)
- Use viewport-relative sizing (`.vw-100`, `.vh-100`, `.min-vh-100`)
- Understand `.mw-100` and `.mh-100` for responsive media constraints
- Combine sizing utilities with spacing and flex utilities from earlier lessons

## Introduction
This closes out the module by covering how elements are sized, tying together everything from the last four lessons. Colors, borders, and spacing all style an element — sizing determines how much room it actually takes up. You've already used fixed pixel widths inline in a few earlier examples in this module; here you'll learn Bootstrap's utility-based alternative, which keeps sizing responsive without extra CSS.

## Width and Height Percentages
The `.w-*` and `.h-*` utilities set width/height as a percentage of the parent container:

```html
<div class="w-25">25% width</div>
<div class="w-50">50% width</div>
<div class="w-75">75% width</div>
<div class="w-100">100% width</div>
<div class="w-auto">Auto width (content-based)</div>
```

The same scale (`25`, `50`, `75`, `100`, `auto`) applies to `.h-*` for height. Because these are percentages, the element's size is always relative to its parent — resize the parent, and the child resizes proportionally, with zero extra media queries.

## Viewport-Relative Sizing
For sizing relative to the *browser window* rather than the parent element, Bootstrap provides viewport variants:

```html
<div class="vw-100">Full viewport width</div>
<div class="vh-100">Full viewport height</div>
```

More commonly used in practice are the **min-height** viewport utilities, which set a floor without preventing the element from growing taller if its content needs more room:

```html
<div class="min-vh-100 d-flex align-items-center justify-content-center">
  This section is always at least the full screen height,
  but can grow taller if content overflows.
</div>
```

This is the standard pattern for a full-screen hero section or landing page header — using `.vh-100` directly would clip content that's taller than the screen, whereas `.min-vh-100` guarantees a minimum without that risk.

## Max-Width and Max-Height for Media
`.mw-100` and `.mh-100` cap an element at 100% of its parent, which is the single most common fix for images and media overflowing their container:

```html
<div style="width: 300px;">
  <img src="photo.jpg" class="mw-100" alt="Responsive image">
</div>
```

Without `.mw-100`, an image wider than its container will overflow and break the layout. With it, the image scales down to fit but is never forced to stretch beyond its natural size, since `max-width` only constrains — it never enlarges.

## Combining Sizing with Flex and Spacing
Sizing utilities are rarely used alone — they're almost always combined with the flex utilities from Module 02 and the spacing utilities from Lesson 04:

```html
<div class="d-flex min-vh-100 flex-column justify-content-between p-4">
  <header>Site Header</header>
  <main class="w-100">Main content grows to fill available width</main>
  <footer>Site Footer</footer>
</div>
```

## Practical Example
A responsive avatar-and-bio layout using width, height, and max-width together:

```html
<div class="d-flex align-items-start p-3 border rounded-3" style="max-width: 500px;">
  <img src="avatar.jpg" class="rounded-circle mw-100" style="width: 15%;" alt="Avatar">
  <div class="ms-3 w-75">
    <h6 class="mb-1">Priya Nair</h6>
    <p class="text-body-secondary mb-0">
      Frontend engineer focused on accessible, responsive interfaces.
    </p>
  </div>
</div>
```

Here the avatar takes 15% of the container's width (scaling with it), the bio text takes 75%, and `.mw-100` on the image guarantees it never overflows even if the percentage math produces a value larger than the image's natural size.

## Revision Questions

<details>
<summary>1. What's the difference between `.vh-100` and `.min-vh-100`?</summary>
`.vh-100` sets height to exactly 100% of the viewport, which can clip content taller than the screen. `.min-vh-100` sets a minimum height of 100% of the viewport but allows the element to grow taller if its content needs more space.
</details>

<details>
<summary>2. Why is `.mw-100` the standard fix for images that overflow their container?</summary>
`max-width: 100%` caps the image at its parent's width without ever stretching it larger than its natural size, so it scales down responsively but never overflows or over-enlarges.
</details>

<details>
<summary>3. Are `.w-50` and similar width utilities relative to the viewport or the parent element?</summary>
The parent element — they're percentage-based relative to the containing block, not the browser viewport.
</details>

<details>
<summary>4. Name one common real-world layout pattern that relies on `.min-vh-100`.</summary>
A full-screen hero/landing section, or a sticky-footer page layout where the body must be at least full screen height regardless of content length.
</details>
