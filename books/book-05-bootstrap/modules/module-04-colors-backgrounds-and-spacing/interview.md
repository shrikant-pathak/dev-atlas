# Module 04 Interview Questions

1. **What problem does Bootstrap's theme color system solve compared to hardcoding hex values throughout a project?**
   Expected answer: centralizes a small set of semantic colors so they can be referenced consistently across every component and updated globally via CSS variables/Sass, rather than duplicated and manually kept in sync.

2. **Why would you choose `.text-body-secondary` over `.text-muted` in a new project?**
   Expected answer: `.text-body-secondary` is theme-aware and adapts under dark mode; `.text-muted` is a static gray that doesn't adjust and can become unreadable on dark backgrounds.

3. **Explain the "subtle" utility pattern and when you'd reach for it instead of full-strength theme colors.**
   Expected answer: `.bg-{color}-subtle` + `.text-{color}-emphasis` (+ optional `.border-{color}-subtle`) create a soft-toned, low-intensity version of a theme color, useful for tags/pills/callouts where full-strength `bg-danger` etc. would be visually too loud.

4. **Why does Bootstrap use `border-start`/`border-end` rather than `border-left`/`border-right`?**
   Expected answer: logical/direction-aware naming so the utility flips correctly for right-to-left languages, without needing separate RTL-specific classes.

5. **Walk through decoding the class `px-md-4`.**
   Expected answer: padding on the left and right (x-axis), size 4, applied starting at the `md` breakpoint and up (mobile-first override).

6. **What's the practical difference between `.vh-100` and `.min-vh-100`, and which would you use for a landing page hero?**
   Expected answer: `.vh-100` fixes height at exactly the viewport height and can clip overflowing content; `.min-vh-100` sets a floor but allows growth — almost always the safer, correct choice for a hero section.

7. **Why is `.mw-100` commonly applied to images inside flexible containers?**
   Expected answer: it caps the image at 100% of its parent's width, preventing overflow, while never stretching the image beyond its natural size since `max-width` only constrains downward.
