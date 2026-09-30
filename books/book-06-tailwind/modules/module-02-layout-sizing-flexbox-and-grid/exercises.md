# Module 02 Exercises — Layout, Sizing, Flexbox & Grid

## Exercise 1: Display States
Build three versions of a 3-item row where the middle item is: (a) removed via `hidden`, (b) hidden via `invisible`, (c) visually hidden but screen-reader-accessible via `sr-only`. Explain in writing what visually differs between (a) and (b).

## Exercise 2: Sidebar Layout, Two Ways
Build the same fixed-sidebar-plus-flexible-content layout twice: once using Flexbox (`flex-none` + `flex-1`), once using Grid (`grid-cols-[240px_1fr]`). Note any differences in behavior when content overflows.

## Exercise 3: Responsive Card Grid
Build a product grid that shows 1 column on mobile, 2 columns at `md`, and 4 columns at `lg`, using `grid-cols-*` with responsive prefixes. Add a `gap-6` and confirm spacing stays consistent as columns change.

## Exercise 4: Featured Item in a Grid
Using `col-span-*` and `row-span-*`, build a 4-column, 2-row grid where one item is visually "featured" — spanning 2 columns and both rows — while the remaining items each occupy a single cell.

## Exercise 5: Sticky Footer + Modal
Build a full page using the sticky footer recipe (header, growing main, footer). Add a button that reveals a centered modal overlay using `fixed inset-0` and Flexbox centering. Confirm the modal correctly stacks above the page content using `z-*`.

## Exercise 6: Aspect Ratio Video Grid
Build a 3-column grid of `aspect-video` boxes, each containing an `<img>` with `object-cover`, and confirm every thumbnail maintains a consistent 16:9 shape regardless of the source image's natural dimensions.
