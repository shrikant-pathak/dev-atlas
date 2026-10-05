# Lesson 06: Transitions and Easing

## Learning Objectives
- Enable smooth property transitions with `transition-*` utilities
- Control transition speed and timing with `duration-*` and `ease-*`
- Use `delay-*` to stagger multiple transitions

## Introduction
So far, state changes (hover colors, grayscale toggles) have happened instantly. This lesson covers smoothing those changes into animated transitions — a small addition that makes an interface feel considerably more polished.

## Enabling Transitions

```html
<button class="bg-blue-500 transition hover:bg-blue-700">
  Hover me
</button>
```

`transition` enables smooth animation for a sensible default set of commonly-animated properties (color, background-color, border-color, text-decoration-color, fill, stroke, opacity, box-shadow, transform, filter). Without it, the `hover:bg-blue-700` change from Lesson 4's pattern (and the grayscale example) would happen instantly rather than smoothly.

More targeted variants scope the transition to specific property categories, avoiding unintended animation on properties you didn't mean to transition:

| Class | Transitions |
|---|---|
| `transition-none` | disables transitions entirely |
| `transition-all` | every animatable property |
| `transition-colors` | color-related properties only |
| `transition-opacity` | opacity only |
| `transition-shadow` | box-shadow only |
| `transition-transform` | transform only (Lesson 7) |

## Duration

```html
<button class="transition-colors duration-300 hover:bg-blue-700">
```

`duration-*` sets how long the transition takes, in milliseconds: `duration-75`, `duration-150`, `duration-300`, `duration-500`, `duration-1000`, and others. A short duration (`75`–`150`ms) suits small UI feedback like a button hover; a longer duration (`300`–`500`ms) suits larger visual changes, like a modal fade-in.

## Easing

```html
<button class="transition-transform duration-300 ease-in-out hover:scale-105">
```

`ease-linear` (constant speed throughout), `ease-in` (starts slow, accelerates), `ease-out` (starts fast, decelerates), `ease-in-out` (slow at both ends, faster in the middle — generally the most natural-feeling default for UI animations).

## Delay

```html
<div class="opacity-0 transition-opacity delay-150 duration-300 hover:opacity-100">
```

`delay-*` postpones when a transition begins, using the same millisecond scale as `duration-*`. Combining different delays across several elements creates a staggered animation effect — useful for a list of items that should each fade in slightly after the previous one, rather than all animating simultaneously.

## Practical Example

A card that lifts and gains a stronger shadow on hover, combining transform (previewed here, covered fully in Lesson 7), shadow, and a smooth, natural-feeling transition:

```html
<div class="rounded-lg bg-white p-6 shadow-md transition-all duration-300 ease-in-out hover:-translate-y-1 hover:shadow-xl">
  <h3 class="font-semibold">Hover to lift</h3>
</div>
```

`transition-all` here covers both the `shadow-*` and `transform` changes in one smooth, synchronized animation, rather than requiring two separate transition utilities.

## Summary
`transition` (or a more targeted `transition-colors`/`transition-opacity`/etc.) enables smooth animation for state changes that would otherwise happen instantly. `duration-*` sets how long the transition takes; `ease-*` controls its acceleration curve, with `ease-in-out` generally feeling most natural for UI; `delay-*` postpones the start, useful for staggering multiple elements' animations.

## Revision Questions

<details>
<summary>1. Why would a hover color change appear instant rather than smooth without a `transition` utility applied?</summary>

Without `transition`, CSS property changes (like a background-color swap on hover) apply immediately with no animation — `transition` tells the browser to interpolate smoothly between the old and new values over a duration instead.
</details>

<details>
<summary>2. What's the difference between `transition-all` and `transition-colors`, and when would you prefer the more targeted option?</summary>

`transition-all` animates every animatable property that changes; `transition-colors` only animates color-related properties. The targeted option is preferable when you only want specific properties animated and want to avoid accidentally animating other properties that might change unintentionally (which can sometimes cause subtle visual glitches).
</details>

<details>
<summary>3. How would you make three list items fade in with a staggered, slightly offset timing rather than all at once?</summary>

Apply increasing `delay-*` values to each item in sequence (e.g., `delay-0`, `delay-150`, `delay-300`), so each item's transition begins slightly later than the one before it.
</details>
