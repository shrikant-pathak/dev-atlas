# Module 08 Exercises — Responsive Design

## Lesson 01 — Media Queries (& Viewport)
1. Add the correct viewport meta tag to a blank HTML page and explain what each of its two values does.
2. Write a media query that applies styles only when the viewport is between 600px and 900px wide.
3. Write a media query combo using a comma (`,`) that applies the same style for both narrow screens and portrait orientation.

## Lesson 02 — Mobile-First Approach
4. Rewrite a desktop-first stylesheet (base styles + `max-width` overrides) into an equivalent mobile-first version (base styles + `min-width` overrides).
5. Explain, in your own words, why mobile-first is generally considered better practice today.

## Lesson 03 — Responsive Typography
6. Convert a heading that currently jumps between three fixed font sizes at three breakpoints into a single `clamp()` declaration.
7. Apply `clamp()` to a section's padding so it scales smoothly between 1rem and 3rem.

## Lesson 04 — Responsive Images & Video
8. Add `max-width: 100%; height: auto;` to a page with an oversized image and observe the fix.
9. Build an `<img>` with a `srcset` and `sizes` attribute serving three different resolutions.
10. Build a `<picture>` element that serves a different crop on mobile vs. desktop.

## Lesson 05 — aspect-ratio
11. Build a video embed that maintains a 16:9 ratio at any width using `aspect-ratio`, with no padding hack.
12. Build a circular avatar using only `width` + `aspect-ratio: 1 / 1` + `border-radius: 50%`.
13. Explain how `aspect-ratio` helps prevent layout shift when images load.
