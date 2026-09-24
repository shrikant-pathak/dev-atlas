# Module 11: Customization, Sass Build and RTL

## Overview
This module goes beneath the CSS-variable customization from Module 10 into Bootstrap's Sass source: npm/build setup, overriding variables and maps, selective imports, the Sass-vs-CSS-custom-property relationship, assembling a full custom theme, optimizing bundle size, and enabling RTL output — cashing in the logical-property naming convention (`.border-start`, `.ms-auto`) used since Module 04.

## Lessons
1. **npm and Sass Build Setup** — installing Bootstrap's Sass source, compiling with the `sass` package, project structure
2. **Sass Variables and Maps** — `!default`, override order, the `$theme-colors`/`$grid-breakpoints` maps
3. **Compiling a Custom Bootstrap Build** — selective partial imports, required foundational files, npm scripts
4. **CSS Custom Properties in Bootstrap** — the Sass (build-time) vs. CSS variable (runtime) relationship, `_root.scss`
5. **Building a Custom Theme** — multi-file Sass structure, applying a theme across the book's components, contrast verification
6. **Optimizing Bundle Size** — component-level and `$utilities`-map-level trimming, the convenience-vs-size tradeoff
7. **RTL Support** — `$rtl: true`, `dir="rtl"`, what flips automatically vs. what needs manual handling

## Prerequisites
- Module 04 (Colors, Backgrounds & Spacing) — theme colors, spacing scale, logical border-property naming, all directly overridden/explained at the Sass level here
- Module 02 (Layout and Grid System) — `$grid-breakpoints` map extended in Lesson 02
- Module 10 (Dark Mode and Color Modes) — the CSS-custom-property runtime layer this module's Sass layer connects to (Lesson 04)
- Book 04 npm/tooling familiarity — general package.json/npm-script conventions reused in Lesson 03

## What's Next
Module 12 (Icons and Real-World Project) is the book's capstone — applying every module's techniques, including this module's custom theme build, to a complete real-world project.
