# Lesson 07: Color Palette and OKLCH

## Learning Objectives
- Navigate Tailwind's default color palette and its 50–950 shade scale
- Explain what OKLCH is and why v4 switched to it from v3's RGB-based palette
- Recognize the practical benefits OKLCH provides for perceptual consistency

## Introduction
Color is the most-used category of utility in any real Tailwind project. This lesson covers the shape of the default palette, and an important under-the-hood change in v4: the color space the palette itself is defined in.

## The Default Palette

Tailwind ships a broad set of named color families — `slate`, `gray`, `zinc`, `neutral`, `stone` (neutrals with subtly different undertones), and a full spectrum of chromatic colors: `red`, `orange`, `amber`, `yellow`, `lime`, `green`, `emerald`, `teal`, `cyan`, `sky`, `blue`, `indigo`, `violet`, `purple`, `fuchsia`, `pink`, `rose`.

Each family has eleven shades, numbered 50 (lightest) through 950 (darkest):

```html
<div class="bg-blue-50"></div>  <!-- very light tint -->
<div class="bg-blue-500"></div> <!-- base/mid shade -->
<div class="bg-blue-950"></div> <!-- very dark shade -->
```

`500` is generally the "base" shade of each family — the one you'd reach for as a primary brand color before adjusting lighter/darker for hover states, borders, or text.

## Why OKLCH? (The v4 Change)

In v3, Tailwind's default palette was defined using standard RGB/hex values. v4 redefined the entire default palette using **OKLCH** — a perceptually uniform color space designed so that equal numeric steps correspond to roughly equal *perceived* steps in lightness, and so that mixing or adjusting colors behaves more predictably than it does in RGB.

Practically, this matters in two ways:

1. **Wider gamut support.** OKLCH can express colors outside the older sRGB gamut, taking advantage of the wider color range (P3) that most modern displays (recent phones, laptops, monitors) can actually show — resulting in more vivid colors on supporting hardware, with automatic graceful fallback on older displays.
2. **More predictable shade scales.** Because OKLCH is perceptually uniform, the jump from `blue-400` to `blue-500` looks like a similarly-sized lightness step as the jump from `blue-500` to `blue-600` — in RGB-based systems, equal numeric steps don't always correspond to equal *visual* steps, since human color perception isn't linear in RGB space.

You don't need to write OKLCH values by hand to use the default palette — every named color/shade class works exactly as before. OKLCH becomes directly relevant once you start customizing the palette yourself (Module 06), where you'll define new colors using `oklch(...)` function syntax rather than hex codes.

## Practical Example

A simple alert component relying on the default palette's consistent shade relationships — a light background, a readable text color, and a matching border, all from the same color family:

```html
<div class="rounded-lg border border-red-200 bg-red-50 p-4 text-red-800">
  <p class="font-semibold">Error</p>
  <p class="text-sm">Something went wrong. Please try again.</p>
</div>
```

Because every shade within the `red` family is perceptually balanced relative to the others (thanks to OKLCH), `red-50`/`red-200`/`red-800` reliably produce a harmonious, readable combination without manual tuning — a pattern you can repeat with any color family and get similarly good results.

## Summary
Tailwind's default palette spans a wide set of named color families, each with eleven shades (50–950). v4 redefined this palette using OKLCH instead of RGB, giving wider color gamut (P3) support on modern displays and more perceptually consistent shade steps — you use the palette exactly the same way as before; the change is under the hood.

## Revision Questions

<details>
<summary>1. What two practical benefits does OKLCH provide over v3's RGB-based palette?</summary>

Wider color gamut support (taking advantage of P3 displays for more vivid colors) and more perceptually uniform shade steps (equal numeric jumps correspond more closely to equal visually-perceived lightness changes).
</details>

<details>
<summary>2. Which shade number is typically considered a color family's "base" shade?</summary>

500
</details>

<details>
<summary>3. Does switching to OKLCH change how you write a class like `bg-blue-500` in your HTML?</summary>

No — the named color/shade classes work identically to before. OKLCH only changes how the palette's underlying color values are defined; it becomes directly relevant when you customize the palette yourself with `oklch(...)` values.
</details>
