# Module 09 Quiz — Production, Accessibility & Real-World Project

15 questions. Answers at the bottom. Try first!

**1.** Which hides content visually but keeps it for screen readers?
- A) `hidden`
- B) `invisible`
- C) `sr-only`
- D) `opacity-0`

**2.** Why is `opacity-0` on a button a problem?
- A) It's slow
- B) It stays focusable and announced
- C) It breaks dark mode
- D) It removes the button's layout

**3.** WCAG AA contrast for normal text is…
- A) 3:1
- B) 4.5:1
- C) 7:1
- D) 2:1

**4.** Which survives forced-colors mode?
- A) `ring-2` focus ring
- B) `shadow-lg`
- C) `outline` and `border`
- D) Background-color-only selected state

**5.** `contrast-more:` is…
- A) A CSS filter utility
- B) A variant for the user's increased-contrast preference
- C) A color utility
- D) Dark mode

**6.** Tailwind v4's minimum Chrome version is…
- A) 90
- B) 100
- C) 111
- D) 125

**7.** Which fallback pattern is correct for `backdrop-filter`?
- A) `backdrop-blur` only
- B) `bg-surface supports-[backdrop-filter]:bg-surface/70 supports-[backdrop-filter]:backdrop-blur`
- C) `@polyfill backdrop`
- D) `no-backdrop:bg-surface`

**8.** In v4, `shadow-sm` means…
- A) The same as v3's `shadow-sm`
- B) What v3 called `shadow`
- C) No shadow
- D) A large shadow

**9.** v3's `bg-opacity-50` becomes…
- A) `bg-50`
- B) An opacity modifier like `bg-black/50`
- C) `opacity-bg-50`
- D) It is unchanged

**10.** The default border color in v4 is…
- A) `gray-200`
- B) `black`
- C) `currentColor`
- D) `transparent`

**11.** How do Bootstrap and Tailwind coexist safely during migration?
- A) Load both without thought
- B) Cascade layers: Bootstrap in `components`, Tailwind utilities above it, no Preflight until the end
- C) Rename every class by hand first
- D) Impossible

**12.** Bootstrap's `p-3` (1rem) maps to Tailwind…
- A) `p-3`
- B) `p-4`
- C) `p-6`
- D) `p-12`

**13.** Which is a **logical** (RTL-friendly) utility?
- A) `ml-4`
- B) `text-left`
- C) `ms-4`
- D) `rounded-l-lg`

**14.** What makes the CSS budget check in CI useful?
- A) It speeds up builds
- B) It prevents unnoticed size regressions
- C) It minifies CSS
- D) It runs the tests

**15.** Which is the best response to a v3-style `bg-opacity-50` in an AI-generated v4 snippet?
- A) Ignore it
- B) Replace with the opacity modifier (`bg-black/50`) and check for other v3-isms
- C) Install the v3 plugin
- D) Add it to `safelist`

---

<details>
<summary>✅ Answers</summary>

1. **C** — `sr-only`
2. **B** — still focusable and announced
3. **B** — 4.5:1
4. **C** — outlines and borders
5. **B** — the preference variant
6. **C** — 111
7. **B** — safe default + `supports-*` enhancement
8. **B** — what v3 called `shadow`
9. **B** — `bg-black/50`
10. **C** — `currentColor`
11. **B** — layers; Bootstrap in `components`
12. **B** — `p-4` (by size)
13. **C** — `ms-4`
14. **B** — prevents regressions
15. **B** — replace and look for other v3-isms

**Score:** 13–15 Excellent · 10–12 Good · below 10 → revisit Lessons 01, 02, 04 and 05.
</details>
