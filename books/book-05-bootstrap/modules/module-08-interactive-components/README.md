# Module 08: Interactive Components

## Overview
This module covers Bootstrap's most JavaScript-dependent components: modal, accordion, collapse, carousel, tooltips, popovers, toasts, scrollspy, and spinners. It's the heaviest module in the book for accessibility attributes (`aria-live`, focus trapping, `role="status"`) and the first to require manual JS initialization for some components (tooltips, popovers, toasts).

## Lessons
1. **Modal** — dialog structure, trigger/dismiss, focus trapping, static backdrop
2. **Accordion** — single-open collapse groups, `data-bs-parent`, always-open variant
3. **Collapse** — the general show/hide mechanism underlying accordion and navbar
4. **Carousel** — slides, controls, indicators, captions, autoplay accessibility
5. **Tooltips** — manual JS initialization, placement, HTML content safety
6. **Popovers** — title/content structure, click vs. focus trigger
7. **Toasts** — `aria-live`, JS-triggered display, autohide, stacking
8. **Scrollspy** — scroll-driven nav highlighting, id/href matching
9. **Spinners** — pure-CSS loading indicators, button-embedded loading state

## Prerequisites
- Module 06 (Core Components I) — `.btn-close`/`data-bs-dismiss` pattern (modal, offcanvas, toast), `.card` structure (modal-header/body/footer parallel)
- Module 07 (Core Components II) — `data-bs-toggle`/`data-bs-target` convention (collapse, accordion), Popper positioning (dropdowns → tooltips/popovers), `.active` state pattern (scrollspy)
- Book 04, Module 04 (DOM, Events & Navigation) — `addEventListener`, used directly in the spinner and JS-initialization examples

## What's Next
Module 09 (Utility Classes, Helpers & Accessibility) shifts focus from components back to the underlying utility system, consolidating and extending the accessibility patterns (`.visually-hidden`, ARIA attributes) used throughout this module.
