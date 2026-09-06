# Module 07 Exercises — CSS Grid

## Lesson 01 — Grid Intro
1. Create a container with `display: grid` and four child `div`s. Without any other Grid properties, describe what layout you get and why.
2. Convert a two-item Flexbox row (from Module 06) into a two-column Grid layout using `grid-template-columns: 1fr 1fr`.

## Lesson 02 — Container Properties
3. Build a 3-column grid using `repeat()` where the middle column is twice as wide as the outer two.
4. Build a responsive card gallery using `repeat(auto-fit, minmax(180px, 1fr))` and test it at three different viewport widths.
5. Center a single item both horizontally and vertically within a grid container using `justify-content` and `align-content`.

## Lesson 03 — Item Properties
6. Place an item so it spans the first two columns and the first two rows of a 4x4 grid.
7. Create two overlapping items using `grid-area`, and use `z-index` to control which renders on top.
8. Override one item's alignment with `justify-self: end` while the rest of the grid uses `justify-items: start`.

## Lesson 04 — Template Areas
9. Rebuild the "Holy Grail" layout (header, nav, main, aside, footer) using `grid-template-areas`.
10. Add a responsive breakpoint that collapses the Holy Grail layout to a single column, reordering areas as: header, nav, main, aside, footer.

## Lesson 05 — 12-Column Layout
11. Build a 12-column grid and lay out a 3-column card row using spans of 4 each.
12. Recreate a Bootstrap-style offset (`grid-column: 4 / span 6`) and explain what it visually produces.

## Lesson 06 — @supports
13. Write a layout that uses Flexbox as a fallback and Grid as the enhancement, using `@supports (display: grid)`.
14. Write an `@supports` rule using `and` to check for support of two properties at once.
15. Explain, in your own words, why `@supports` is less critical for Grid today than it would have been in 2018.
