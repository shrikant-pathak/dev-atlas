# Lesson 05: Masks and Backdrop Effects

## Learning Objectives
- Apply backdrop filters to blur or adjust whatever renders behind an element
- Use v4's new `mask-*` utilities to create gradient-faded edges and shaped crops
- Combine masking and backdrop effects for modern glass-like UI treatments

## Introduction
This lesson covers two related but distinct effect categories: backdrop filters (which affect what's visually *behind* an element, seen through it) and masks (which control which parts of an element itself are visible) — both genuinely useful, modern CSS capabilities, with masking being new to Tailwind in v4.

## Backdrop Filters

Backdrop filters apply a filter effect (Lesson 4's vocabulary) to whatever is rendered *behind* an element, visible through any transparency the element has — rather than to the element's own content:

```html
<div class="bg-white/30 backdrop-blur-md">
  Frosted glass panel — content behind this blurs, this panel's own text stays sharp
</div>
```

| Class | Effect |
|---|---|
| `backdrop-blur-sm`/`md`/`lg`/`xl` | blurs what's behind |
| `backdrop-brightness-*` | adjusts brightness of what's behind |
| `backdrop-saturate-*` | adjusts saturation of what's behind |
| `backdrop-opacity-*` | adjusts opacity specifically of the backdrop filter stack |

This is the standard technique for the "frosted glass" effect seen throughout modern UI design (notification panels, navigation bars over content, modal overlays) — requiring the element to have some transparency (via `bg-white/NN`, Module 03's slash syntax) so there's actually something visible for the backdrop filter to blur.

## Masks (New in v4)

Masks control which parts of an element are visible, using a mask image (often a gradient) rather than simple clipping. v4 added a set of gradient-based mask utilities that didn't exist before:

```html
<img class="mask-b-from-80% h-48 w-full object-cover" src="/photo.jpg" alt="" />
```

`mask-b-from-80%` fades the image to transparent starting at 80% down, toward the bottom edge — a soft fade-out effect that's visually much nicer than a hard cutoff, commonly used where an image transitions into a solid-colored section below it (so the image appears to dissolve into the background rather than ending abruptly). Directional variants (`mask-t-from-*`, `mask-r-from-*`, `mask-l-from-*`) fade from the other edges, and `mask-radial-*`/`mask-linear-*` provide more complex gradient-shaped masks for non-edge-based fades.

Before v4, achieving this kind of fade required a manual `mask-image` arbitrary value with hand-written gradient syntax — the new utilities make a very common design need (image fading into a background) achievable with simple, composable classes.

## Practical Example

A hero image that fades into the page background below it, with a frosted-glass navigation bar floating over the top of it:

```html
<div class="relative">
  <img class="mask-b-from-70% h-96 w-full object-cover" src="/hero.jpg" alt="" />
  <nav class="absolute inset-x-0 top-0 bg-white/20 p-4 backdrop-blur-md">
    <span class="font-bold text-white">Brand</span>
  </nav>
</div>
```

The navigation bar's content is sharp (`backdrop-blur-md` only blurs what's *behind* it, the hero image), while the hero image itself softly dissolves into the page background below it (`mask-b-from-70%`), rather than ending with a hard edge.

## Summary
Backdrop filters (`backdrop-blur-*`, `backdrop-brightness-*`, etc.) apply filter effects to whatever renders behind a semi-transparent element — the standard mechanism for frosted-glass UI panels. Mask utilities, new in v4 (`mask-b-from-*`, `mask-radial-*`, etc.), fade an element's edges using gradient-based masking, replacing what previously required hand-written arbitrary `mask-image` values.

## Revision Questions

<details>
<summary>1. Why does a `backdrop-blur-md` panel need some background transparency (like `bg-white/30`) to actually show a visible effect?</summary>

Backdrop filters affect whatever is rendered behind the element, visible through its own transparency — with a fully opaque background, there's nothing behind it visible through the element for the blur to apply to, so the effect would be invisible.
</details>

<details>
<summary>2. What does `mask-b-from-80%` do to an image, and what would you have needed to write to achieve the same effect in Tailwind v3?</summary>

It fades the image to transparent starting at 80% down toward the bottom edge, creating a soft dissolve rather than a hard cutoff. In v3, this would require a hand-written arbitrary value for the `mask-image` CSS property, since no first-class mask utilities existed yet.
</details>

<details>
<summary>3. What's the key difference between what `backdrop-blur-*` affects versus what `mask-*` affects?</summary>

`backdrop-blur-*` affects content rendered behind a semi-transparent element, visible through it. `mask-*` controls which parts of the element's own content are visible, using a gradient or shape — an entirely different layer of the rendering.
</details>
