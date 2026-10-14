# Module 09 Exercises — Production, Accessibility & Real-World Project

## Part A — Accessibility and preferences (Lessons 01–02)

**1. Audit** — Take the "before" snippet from Lesson 01 (or one of your Module 07 components) and list every accessibility problem. Fix each one, and say which WCAG idea it relates to.

**2. Hide it right** — Build one example each of `hidden`, `invisible`, `sr-only` and `opacity-0` containing a button. Tab through. Which are reachable? Which are announced?

**3. Skip link and sticky header** — Add a skip link and a sticky header, then make sure focusing an in-page target isn't hidden behind the header (`scroll-pt-*`/`scroll-mt-*`).

**4. Contrast pass** — Pick 6 text/background pairs from your Tailwind palette (light and dark). Measure the contrast ratio of each, label pass/fail for AA, and fix failures with the next shade.

**5. Reduced motion** — Take an animated hero (slide, bounce, fade). Make it respect `prefers-reduced-motion`: remove movement, keep a fade.

**6. Forced colors** — Build a toggle switch and a selected-tab style. Emulate `forced-colors` in DevTools. Show that the "before" version loses state, then fix with borders/`Highlight`.

**7. Preferences matrix** — For one component, take screenshots in: light, dark, increased contrast, forced colors, reduced motion. Write down what changed in each.

## Part B — Build and compatibility (Lessons 03–04)

**8. Measure** — Build any project and record CSS raw/gzip/brotli. Add a large `@source inline` range, re-measure, remove it, and explain the delta.

**9. Budget gate** — Write a CI script that fails if CSS exceeds a budget you choose. Prove it fails and passes.

**10. Fonts** — Self-host one variable font as subset WOFF2, preload it, set `font-display`, and compare Lighthouse before/after.

**11. Fallbacks** — Build a glass navbar with `supports-[backdrop-filter]:` and a grid with a flex fallback. Verify both paths by temporarily disabling the enhancement in DevTools (or editing the condition).

**12. No-JS / no-hover** — Add a `noscript:` message. Then find one hover-only interaction in your project and make it work on touch and keyboard.

**13. Print** — Add `print:` styles to an invoice-like page: hide nav, force black on white, avoid table breaks. Print preview.

## Part C — Migration and system (Lessons 05–06)

**14. v3 → v4** — Take a small v3 project (or a copy of an old one). Run `npx @tailwindcss/upgrade` on a branch. List what it changed automatically, what broke, and which default changes you noticed visually (borders, rings, buttons).

**15. Leftover hunt** — Run the v3-ism greps from Lesson 05 on your migrated project. Fix each hit and explain what it meant in v3 vs v4.

**16. Bootstrap coexistence** — Create a page using Bootstrap CSS and add Tailwind with the layer setup from Lesson 05. Prove that a Tailwind utility overrides a Bootstrap class, and that Bootstrap pages did not change.

**17. Convert a page** — Convert one Bootstrap page (navbar, form, cards, modal) to Tailwind using the mapping tables. Convert spacing **by size**, not digit.

**18. RTL** — Convert physical classes (`ml-*`, `left-*`, `text-left`, `rounded-l-*`) to logical ones in a Module 07 component. Set `dir="rtl"`, then fix icons and transforms with `rtl:` variants.

**19. Design system scaffold** — Split your CSS into `tokens/themes/base/utilities` files, build a `Button` using only semantic tokens, and add a CI guard that bans raw palette colors in feature code.

**20. Shared theme** — In a two-app mini-monorepo, share `theme.css` via `@import` and use `@source` for the UI package. Change one token and see both apps update.

## ⭐ Capstone (Lesson 07)

Build **Atlas Analytics** (landing + dashboard) and score yourself with the rubric. Then **swap with a peer** (or review it a day later yourself) using the PR checklist in Lesson 08 and fix at least five findings.

## ✅ Self-check

- [ ] Everything is keyboard operable with visible focus
- [ ] Verified in dark, reduced motion, increased contrast and forced colors
- [ ] CSS size measured and under a budget enforced in CI
- [ ] Browser baseline written down; enhancements have fallbacks
- [ ] No v3-isms, no dynamic classes, no raw palette colors in feature code
- [ ] Logical properties used, RTL spot-checked
