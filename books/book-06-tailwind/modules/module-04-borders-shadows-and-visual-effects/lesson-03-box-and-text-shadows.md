# Lesson 03: Box and Text Shadows

## Learning Objectives
- Apply the `shadow-*` elevation scale to box shadows
- Customize shadow color, including with opacity
- Apply the v4 `text-shadow-*` utilities — a capability that didn't exist as a first-class utility in v3

## Introduction
Shadows communicate elevation and depth — a card that's "lifted" above the page, a dropdown floating over content. This lesson covers Tailwind's box-shadow scale and color customization, plus text shadows, a genuinely new utility category introduced in v4.

## The Box Shadow Scale

```html
<div class="rounded-lg bg-white p-6 shadow-sm">Subtle</div>
<div class="rounded-lg bg-white p-6 shadow-md">Medium</div>
<div class="rounded-lg bg-white p-6 shadow-lg">Prominent</div>
<div class="rounded-lg bg-white p-6 shadow-2xl">Very prominent</div>
```

The scale runs `shadow-xs`, `shadow-sm`, `shadow` (default/base), `shadow-md`, `shadow-lg`, `shadow-xl`, `shadow-2xl`, plus `shadow-inner` (an inset shadow, for a pressed/recessed look) and `shadow-none`. As a rule of thumb: larger values suit elements that should feel more "lifted" off the page — a resting card might use `shadow-sm`, while a modal or popover floating above everything else might use `shadow-xl` or `shadow-2xl`.

## Shadow Color

By default, shadows render in a neutral dark tone. You can tint them using the shared color palette (Module 03), including the opacity slash syntax:

```html
<div class="rounded-lg bg-white p-6 shadow-lg shadow-indigo-500/50">
  A shadow tinted indigo at 50% opacity
</div>
```

Colored shadows are a common technique for giving an element a soft, glowing effect that matches a brand color — particularly effective on buttons or call-to-action cards, used more subtly than a flat-colored border would allow.

## Text Shadow (New in v4)

Text shadows are a genuinely new utility category in v4 — in v3, achieving a text shadow required an arbitrary value (`[text-shadow:_0_1px_2px_rgb(0_0_0_/_0.3)]`) since no first-class utility existed. v4 added a proper scale:

```html
<h1 class="text-4xl font-bold text-white text-shadow-lg">
  Readable Over a Busy Background
</h1>
```

The scale mirrors box shadow's naming: `text-shadow-2xs`, `text-shadow-xs`, `text-shadow-sm`, `text-shadow` (default), `text-shadow-md`, `text-shadow-lg`, plus `text-shadow-none`. Like box shadows, text shadow color can be customized with `text-shadow-{color}` and opacity.

Text shadows are especially useful for text overlaid on photos or busy gradients (Module 03's hero banner pattern) — a subtle dark text-shadow can preserve legibility even where the gradient overlay alone isn't quite enough contrast.

## Practical Example

A pricing card using elevation shadow, and a hero heading using the new text-shadow utility over a background image:

```html
<div class="rounded-xl bg-white p-8 shadow-xl shadow-indigo-500/20">
  <h3 class="text-2xl font-bold">Pro Plan</h3>
  <p class="mt-2 text-gray-600">Everything you need to scale.</p>
</div>

<section class="relative flex h-64 items-center justify-center bg-[url('/hero.jpg')] bg-cover">
  <h1 class="text-shadow-lg text-5xl font-bold text-white">
    Welcome
  </h1>
</section>
```

## Summary
`shadow-*` provides a named elevation scale from `shadow-xs` to `shadow-2xl`, plus `shadow-inner` for a recessed look; shadow color can be customized using the shared palette and opacity syntax, often for subtle brand-colored glows. `text-shadow-*`, new in v4, brings the same capability to text — previously only possible via arbitrary values — commonly used to preserve legibility for text overlaid on photos.

## Revision Questions

<details>
<summary>1. What's the difference between `shadow-lg` and `shadow-inner`?</summary>

`shadow-lg` is a standard outward drop shadow suggesting the element is elevated above the page. `shadow-inner` is an inset shadow drawn inside the element's edges, suggesting it's recessed or pressed into the page instead.
</details>

<details>
<summary>2. How would you apply a soft, brand-colored glow using `shadow-lg` tinted indigo at 30% opacity?</summary>

`shadow-lg shadow-indigo-500/30`
</details>

<details>
<summary>3. How would a developer have achieved a text shadow in Tailwind v3, before `text-shadow-*` existed as a first-class utility?</summary>

Using an arbitrary value with the raw CSS property, e.g. `[text-shadow:_0_1px_2px_rgb(0_0_0_/_0.3)]`, since no dedicated `text-shadow-*` utility scale existed prior to v4.
</details>
