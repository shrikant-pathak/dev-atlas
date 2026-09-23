# Module 10 Interview Questions

1. **Why can `data-bs-theme="dark"` re-theme every Bootstrap component on a page without any component-specific CSS changes?**
   Expected answer: Bootstrap's component CSS references color values via CSS custom properties (`var(--bs-*)`) rather than hardcoded colors; the attribute just redefines what those variables resolve to, and every component automatically picks up the new values.

2. **Is `prefers-color-scheme` a Bootstrap feature?**
   Expected answer: No — it's a standard CSS media feature reflecting the OS-level light/dark setting, independent of any framework.

3. **Walk through the correct priority order for resolving which theme to apply on page load, given both a possible saved preference and system preference.**
   Expected answer: check `localStorage` for a manually saved preference first; only fall back to `matchMedia('(prefers-color-scheme: dark)')` system detection if no manual preference was ever saved.

4. **Why doesn't clicking an "Auto" option set `data-bs-theme="auto"` directly?**
   Expected answer: `"auto"` isn't a real value Bootstrap's CSS understands — it's purely a UI-level concept meaning "follow the system," implemented by clearing any saved preference and re-running system detection to set an actual `"light"` or `"dark"` value.

5. **Why is the initial theme-resolution script placed in the `<head>` as an immediately-invoked function rather than at the end of the page?**
   Expected answer: to set the correct theme attribute before the page's content renders, avoiding a visible flash of the wrong theme that would occur if resolution happened after the page had already painted with a default theme.

6. **What's the limitation of overriding only a base variable like `--bs-primary` when building a custom color mode?**
   Expected answer: some component internals reference more specific derived variables calculated from base variables via Sass at build time, so a runtime CSS override of the base variable alone won't recalculate those already-compiled derived values — a comprehensive re-theme needs Sass-level customization instead.

7. **What does `localStorage` provide that every other JavaScript pattern used earlier in the book (event listeners, DOM reads) does not?**
   Expected answer: persistence across page reloads and browser restarts — earlier patterns only affect the current page load, while `localStorage` retains data between visits.
