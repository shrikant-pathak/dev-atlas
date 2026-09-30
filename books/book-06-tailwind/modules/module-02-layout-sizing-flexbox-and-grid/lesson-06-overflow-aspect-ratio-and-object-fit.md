# Lesson 06: Overflow, Aspect Ratio, and Object Fit

## Learning Objectives
- Control content overflow with `overflow-*` utilities
- Set fixed aspect ratios with `aspect-*`, including arbitrary values
- Control how replaced elements like images fill their box with `object-*`

## Introduction
This lesson covers three related utilities for controlling how content and media fit inside their container — a frequent need whenever you're embedding images, videos, or scrollable panels.

## Overflow

| Class | CSS |
|---|---|
| `overflow-auto` | `overflow: auto` — scrollbar appears only if needed |
| `overflow-hidden` | `overflow: hidden` — clips overflowing content |
| `overflow-visible` | `overflow: visible` — content can spill out (default) |
| `overflow-scroll` | `overflow: scroll` — scrollbar always shown |
| `overflow-x-*` / `overflow-y-*` | same values, single axis only |

```html
<div class="h-48 overflow-y-auto rounded border p-4">
  <!-- long content that scrolls vertically once it exceeds 12rem -->
</div>
```

`overflow-hidden` is also commonly combined with `rounded-*` to clip a child image to its parent's rounded corners — without it, a square image inside a rounded container would visually poke past the rounded edges.

## Aspect Ratio

The `aspect-*` utilities set the CSS `aspect-ratio` property, keeping an element's width-to-height ratio fixed regardless of its actual rendered size — essential for responsive video embeds and image placeholders that shouldn't jump around as they load.

```html
<div class="aspect-video w-full">
  <iframe class="h-full w-full" src="https://www.youtube.com/embed/..." title="Video"></iframe>
</div>
```

`aspect-video` is `16 / 9`, `aspect-square` is `1 / 1`. For any other ratio, use an arbitrary value: `aspect-[4/3]` or `aspect-[3/2]`.

Native `aspect-ratio` support (which is what these utilities generate) has been well-supported across modern browsers for several years — this used to require the separate `@tailwindcss/aspect-ratio` plugin in older Tailwind versions with padding-percentage hacks, but that's no longer necessary since the underlying CSS property does the job directly.

## Object Fit and Object Position

Once you have an aspect-ratio box, `object-*` controls how an image or video fills it, using the CSS `object-fit` property:

| Class | Effect |
|---|---|
| `object-contain` | Scales to fit entirely inside the box, preserving ratio (may letterbox) |
| `object-cover` | Fills the box completely, preserving ratio (may crop) |
| `object-fill` | Stretches to fill exactly, ignoring ratio (may distort) |
| `object-none` | Renders at natural size, ignoring the box |
| `object-scale-down` | Like `contain`, but never scales up past natural size |

`object-position` utilities (`object-top`, `object-center`, `object-bottom`, etc.) control which part of the image stays visible when `object-cover` crops it.

```html
<div class="aspect-square h-48 w-48 overflow-hidden rounded-full">
  <img class="h-full w-full object-cover object-top" src="/portrait.jpg" alt="Profile" />
</div>
```

Here, `object-cover object-top` ensures a portrait photo fills a circular avatar frame completely, cropping from the bottom while keeping the top of the image (typically where a face is) visible.

## Practical Example

A responsive video thumbnail grid using aspect ratio and object-fit together:

```html
<div class="grid grid-cols-3 gap-4">
  <div class="aspect-video overflow-hidden rounded-lg">
    <img class="h-full w-full object-cover" src="/thumb1.jpg" alt="" />
  </div>
  <div class="aspect-video overflow-hidden rounded-lg">
    <img class="h-full w-full object-cover" src="/thumb2.jpg" alt="" />
  </div>
  <div class="aspect-video overflow-hidden rounded-lg">
    <img class="h-full w-full object-cover" src="/thumb3.jpg" alt="" />
  </div>
</div>
```

## Summary
`overflow-*` controls whether excess content clips, scrolls, or spills out. `aspect-*` locks an element's width-to-height ratio using the native CSS `aspect-ratio` property, with `aspect-video`/`aspect-square` as named shortcuts and `aspect-[w/h]` for arbitrary ratios. `object-*` controls how a replaced element (image/video) fills its box, most often paired with `object-cover` for cropped, ratio-preserving fills.

## Revision Questions

<details>
<summary>1. Why is `overflow-hidden` frequently paired with `rounded-*` on a container holding an image?</summary>

Without it, a square image inside a rounded container would visually extend past the rounded corners; `overflow-hidden` clips it to the rounded shape.
</details>

<details>
<summary>2. What ratio does `aspect-video` represent, and how would you set a custom 3:2 ratio?</summary>

`16 / 9`. A custom ratio uses an arbitrary value: `aspect-[3/2]`.
</details>

<details>
<summary>3. What's the difference between `object-cover` and `object-contain`?</summary>

`object-cover` fills the box completely, preserving aspect ratio, cropping whatever doesn't fit. `object-contain` scales the content to fit entirely inside the box while preserving ratio, which may leave empty space (letterboxing) rather than cropping.
</details>
