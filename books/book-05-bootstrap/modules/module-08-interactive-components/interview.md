# Module 08 Interview Questions

1. **What does "focus trapping" mean for a modal, and how much of it do you need to implement manually?**
   Expected answer: while open, Tab/Shift+Tab cycle only through elements inside the modal, and closing returns focus to the trigger — all handled automatically by Bootstrap's JS via the standard data-attribute pattern, no manual code required.

2. **What single attribute turns a set of independent collapse panels into a true single-open accordion, and how would you allow multiple panels open at once?**
   Expected answer: `data-bs-parent` on each `.accordion-collapse`, pointing to the shared container id; omitting it from every panel allows them to open independently and simultaneously.

3. **Why do tooltips and popovers require manual JavaScript initialization, unlike almost every other component covered in this module?**
   Expected answer: for performance reasons — they involve continuous Popper-driven position recalculation while visible, so Bootstrap requires explicit opt-in rather than auto-activating every matching element on every page load.

4. **Why can't a toast typically be shown via a simple data-attribute click trigger?**
   Expected answer: toasts are usually triggered by application or background events (an upload completing, a message arriving) rather than a direct user click, so they must be shown by calling `.show()` via JavaScript.

5. **Why does `aria-live` matter specifically for toasts, more than for most other components in this book?**
   Expected answer: a toast can appear without any direct user action, so `aria-live` is what tells screen readers to automatically announce the new content the instant it appears, regardless of the user's current focus.

6. **What must match between a scrollspy-driven nav link and its target content section?**
   Expected answer: the nav link's `href` must match the `id` of its corresponding section — this pairing is how scrollspy determines which link corresponds to which section as the user scrolls.

7. **Why do carousel controls use `data-bs-slide="prev/next"` while carousel indicators use `data-bs-slide-to="N"`?**
   Expected answer: controls advance one slide at a time in a direction, while indicators need to jump directly to a specific, arbitrary slide index — two different navigation needs requiring two different data-attribute mechanisms.

8. **Why does a button-embedded spinner use `aria-hidden="true"` while a standalone spinner uses a `.visually-hidden` text span?**
   Expected answer: when adjacent visible button text ("Loading...") already conveys the same information, the spinner itself becomes purely decorative, so hiding it from assistive tech avoids redundant announcement — a standalone spinner has no such adjacent text, so it needs its own hidden label instead.
