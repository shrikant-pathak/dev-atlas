# Module 09 Interview Questions

1. **What's the underlying relationship between `.d-flex` and the rest of the `.d-*` display utility family?**
   Expected answer: `.d-flex` is simply one value (`flex`) of the same general-purpose `.d-*` display utility that also includes `.d-none`, `.d-block`, `.d-grid`, etc. — not a separate system.

2. **Walk through exactly how the notification-badge positioning combo works: `.position-relative`, `.position-absolute`, `.top-0`, `.start-100`, `.translate-middle`.**
   Expected answer: `.position-relative` on the parent establishes a positioning anchor; `.position-absolute` + `.top-0`/`.start-100` places the child's edge at a percentage point relative to that anchor; `.translate-middle` then shifts the element back by half its own size to center precisely on that point.

3. **Why does `.ratio` matter specifically for embedded iframes/video, more than for plain images?**
   Expected answer: images have an intrinsic aspect ratio the browser respects automatically with only one dimension constrained; an iframe has no such intrinsic sizing, so without `.ratio` it needs a fixed pixel height (breaking responsively) or JS recalculation on resize.

4. **Why is `.stretched-link` generally preferred over wrapping an entire card in a single `<a>` tag?**
   Expected answer: cards often contain other interactive elements (buttons, secondary links); nesting interactive elements inside an outer `<a>` is invalid HTML with unpredictable behavior, while `.stretched-link` keeps one valid link and leaves other elements independently clickable.

5. **Why does `.text-truncate` sometimes silently fail inside a flex item, and what fixes it?**
   Expected answer: flex items default to a minimum width based on their content, preventing them from shrinking enough to truncate; adding `min-width: 0` to the flex item overrides that default and allows truncation to work.

6. **What's the critical functional difference between `.visually-hidden` and `.d-none`, and what accessibility mistake does confusing them cause?**
   Expected answer: `.d-none` removes content from both the visual page and the accessibility tree; `.visually-hidden` hides it only visually while keeping it announced to screen readers — using `.d-none` on screen-reader-only text accidentally hides it from the very audience it was written for.

7. **Why should the default focus outline never simply be removed without a replacement?**
   Expected answer: keyboard-only users rely entirely on the focus ring to track which element is currently active while tabbing; removing it with no replacement makes the page unusable for keyboard navigation, even if it looks visually cleaner to mouse users.

8. **Name the seven recurring accessibility patterns this module identifies across the whole book, and give one example component for each.**
   Expected answer: label association (form controls), state syncing (tabs/accordion), hidden-but-announced text (icon buttons), live region announcement (alerts/toasts), landmark labeling (navbar/breadcrumb `<nav>`), focus management (modal focus trap), semantic structure (`role="tablist"`, breadcrumb `<ol>`).
