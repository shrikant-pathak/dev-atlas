# Module 11 Exercises

## Exercise 1 — First Custom Build (Lesson 01)
Set up npm + sass, create a `custom.scss` overriding `$primary`, and compile it successfully.

## Exercise 2 — Custom Theme Color and Spacing (Lesson 02)
Add a new `"brand"` color to `$theme-colors` and change `$spacer`; verify `.btn-brand` and the resized spacing scale both work.

## Exercise 3 — Trimmed Build (Lesson 03)
Rebuild using only selective imports for grid, buttons, and cards (skip every JS-driven component); confirm the page still renders correctly.

## Exercise 4 — Sass vs. Runtime Override (Lesson 04)
Set a permanent Sass-level `$primary`, then layer Module 10's `data-bs-theme="dark"` toggle on top; confirm both work together without conflict.

## Exercise 5 — Full Custom Theme (Lesson 05)
Build a multi-file theme (`_variables.scss` + `_maps.scss` + `custom.scss`) applied across a navbar, card, alert, and badge.

## Exercise 6 — Size Comparison (Lesson 06)
Compile both a full build and a trimmed build of the same page; compare the resulting file sizes with `ls -lh`.

## Exercise 7 — RTL Test Page (Lesson 07)
Compile an RTL build (`$rtl: true`), then build a page with `dir="rtl"` using spacing, border, and offcanvas classes; confirm they visually flip correctly.

## Challenge — Full Custom Themed, Optimized, RTL-Ready Build
Combine all seven lessons: a multi-file custom theme, selectively imported to only used components, compiled in both LTR and RTL variants, layered with a Module 10 dark-mode toggle.
