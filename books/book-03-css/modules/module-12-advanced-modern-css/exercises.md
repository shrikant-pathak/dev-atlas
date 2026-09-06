# Module 12 Exercises — Advanced & Modern CSS

## Lesson 01 — Custom Properties
1. Define a set of `:root` color variables and use them across three different components.
2. Build a `.card-dark` variant that overrides a `--card-bg` custom property scoped to itself.

## Lesson 02 — calc/clamp/min/max
3. Build a sidebar layout where the main content uses `calc(100% - 250px)` for its width.
4. Build a container whose width uses `min(100% - 2rem, 1100px)`.
5. Rewrite a `clamp()` expression as an equivalent nested `max(min())` expression.

## Lesson 03 — Container Queries
6. Set up a `.card-wrapper` with `container-type: inline-size` and switch a card's layout at 400px.
7. Explain a scenario where a container query succeeds where a media query would fail.

## Lesson 04 — :has() and Modern Selectors
8. Style a form group differently when it contains an `:invalid` input, using `:has()`.
9. Rewrite a repetitive selector list (`header a, main a, footer a`) using `:is()`.
10. Explain when you'd choose `:where()` over `:is()`.

## Lesson 05 — CSS Nesting
11. Convert a flat stylesheet with `.card`, `.card h3`, `.card:hover` into a single nested `.card` rule using `&`.
12. Nest a media query inside a component rule instead of writing it separately.

## Lesson 06 — @property and Accessibility
13. Register a custom property with `@property` and use it to animate a `conic-gradient()` angle.
14. Build a visually-hidden label for an icon-only button.
15. Add a `prefers-reduced-motion` override that disables an existing hover animation.

## Lesson 07 — shape-outside and Masking
16. Build a circular avatar with text wrapping around it using both `shape-outside` and `clip-path`.
17. Build a hexagonal image crop using `clip-path: polygon()`.
18. Build a scrollable list that fades at its bottom edge using `mask-image`.
