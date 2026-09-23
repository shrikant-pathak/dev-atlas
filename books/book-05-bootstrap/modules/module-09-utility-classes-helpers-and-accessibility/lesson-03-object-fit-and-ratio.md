# Lesson 03: Object Fit and Ratio

## Learning Objectives
- Apply `.object-fit-*` utilities to control how replaced content (images/video) fills its box
- Use `.ratio` and `.ratio-*` to maintain a fixed aspect ratio for responsive embeds
- Combine object-fit with fixed-size containers for consistent image grids
- Understand why aspect-ratio utilities matter specifically for embedded video

## Introduction
This lesson addresses a problem you've brushed against since Module 04's sizing utilities (`.mw-100`) but haven't fully solved: what happens when you need an image or video to fill a specific box size WITHOUT distorting its natural proportions, or need a responsive video embed that maintains a consistent aspect ratio regardless of viewport width?

## Object Fit
`.object-fit-*` controls how an image or video behaves when its container's dimensions don't match its natural aspect ratio:

```html
<img src="photo.jpg" class="object-fit-cover" style="width: 200px; height: 200px;" alt="...">
<img src="photo.jpg" class="object-fit-contain" style="width: 200px; height: 200px;" alt="...">
<img src="photo.jpg" class="object-fit-fill" style="width: 200px; height: 200px;" alt="...">
```

- **`.object-fit-cover`** — scales the image to fill the entire box, cropping any overflow; this is the standard choice for a consistent-looking image grid where source photos have varying proportions
- **`.object-fit-contain`** — scales the image to fit entirely within the box without cropping, potentially leaving empty space (letterboxing) on one axis
- **`.object-fit-fill`** — stretches the image to exactly fill the box, distorting its aspect ratio if it doesn't match (generally the option you want least often)

This directly complements `.mw-100` from Module 04, Lesson 05: `.mw-100` prevents an image from overflowing its parent, but doesn't control cropping/fitting behavior when the container has a FIXED size rather than just a max constraint — that's specifically what object-fit solves.

## Aspect Ratio
`.ratio` maintains a fixed width-to-height proportion for its content, regardless of the container's actual rendered width — critical for responsive video embeds, since an `<iframe>` (e.g. an embedded YouTube video) has no inherent responsive behavior of its own:

```html
<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/example" title="Video" allowfullscreen></iframe>
</div>
```

Built-in ratio options: `.ratio-1x1`, `.ratio-4x3`, `.ratio-16x9`, `.ratio-21x9`. For a custom ratio not covered by these presets, set the `--bs-aspect-ratio` custom property directly — the exact same CSS-variable-override pattern from Module 04's theme colors and Module 07's breadcrumb divider:

```html
<div class="ratio" style="--bs-aspect-ratio: 50%;">
  <iframe src="..." title="Video"></iframe>
</div>
```

## Why This Matters More for Video Than Images
Images have an intrinsic aspect ratio the browser respects by default when only one dimension is constrained (e.g. `width: 100%` with `height: auto` keeps proportions correct automatically). An `<iframe>` has no such intrinsic sizing behavior — without `.ratio`, an embedded video would either need a fixed pixel height (breaking on narrow screens) or would need to be manually recalculated with JavaScript on every resize. `.ratio` solves this with pure CSS, using a padding-based aspect-ratio trick that works reliably across all browsers.

## Practical Example
A blog post layout combining a cropped cover-image grid and a responsive embedded video:

```html
<div class="row row-cols-3 g-2 mb-4">
  <div class="col">
    <img src="photo1.jpg" class="object-fit-cover w-100" style="height: 150px;" alt="Photo 1">
  </div>
  <div class="col">
    <img src="photo2.jpg" class="object-fit-cover w-100" style="height: 150px;" alt="Photo 2">
  </div>
  <div class="col">
    <img src="photo3.jpg" class="object-fit-cover w-100" style="height: 150px;" alt="Photo 3">
  </div>
</div>

<div class="ratio ratio-16x9">
  <iframe src="https://www.youtube.com/embed/example" title="Behind the scenes" allowfullscreen></iframe>
</div>
```

## Revision Questions

<details>
<summary>1. What's the difference between `.object-fit-cover` and `.object-fit-contain`?</summary>
`.object-fit-cover` scales the image to fill the entire box, cropping overflow; `.object-fit-contain` scales it to fit entirely within the box without cropping, potentially leaving empty space on one axis.
</details>

<details>
<summary>2. How does `.object-fit-*` complement `.mw-100` from Module 04 rather than replace it?</summary>
`.mw-100` prevents overflow relative to a parent's max width; object-fit controls cropping/fitting behavior specifically when the container has a fixed size rather than just a max constraint — they solve related but distinct sizing problems.
</details>

<details>
<summary>3. Why does `.ratio` matter more for an embedded `<iframe>` video than for a plain `<img>`?</summary>
Images have an intrinsic aspect ratio the browser respects automatically when only one dimension is constrained; an iframe has no such intrinsic behavior, so without `.ratio` it would need a fixed pixel height (breaking responsively) or JS-based recalculation on resize.
</details>

<details>
<summary>4. How would you apply a custom aspect ratio not covered by the built-in `.ratio-*` presets?</summary>
Override the `--bs-aspect-ratio` CSS custom property directly (e.g. via inline `style`), the same variable-override pattern used for theme colors (Module 04) and the breadcrumb divider (Module 07).
</details>
