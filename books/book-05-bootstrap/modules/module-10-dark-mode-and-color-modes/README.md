# Module 10: Dark Mode and Color Modes

## Overview
This module covers Bootstrap's built-in light/dark theming system: the `data-bs-theme` attribute, detecting and reacting to OS-level `prefers-color-scheme`, defining fully custom named color modes, and building a complete, persisted Light/Dark/Auto theme toggler.

## Lessons
1. **`data-bs-theme` Basics** — the switching attribute, why it works via CSS variables, scoping to page sections
2. **`prefers-color-scheme` and System Detection** — the OS-level media feature, `window.matchMedia`, reacting to live changes
3. **Building Custom Color Modes** — defining a third named mode, which variables to override, limits vs. Sass-level customization
4. **JS Theme Toggler** — `localStorage` persistence, full resolution priority logic, avoiding flash-of-wrong-theme

## Prerequisites
- Module 04 (Colors, Backgrounds & Spacing) — the `--bs-*` CSS variable system this entire module depends on
- Module 06 (Core Components I) — `.btn-group` reused for the toggle UI
- Book 04, Module 04 (DOM, Events & Navigation) — `addEventListener`, DOM API patterns extended here with `matchMedia` and `localStorage`

## What's Next
Module 11 (Customization, Sass Build and RTL) goes one level deeper than this module's CSS-variable overrides — rebuilding Bootstrap's variables at the Sass source level, which Lesson 03 flagged as necessary for a truly comprehensive custom theme.
