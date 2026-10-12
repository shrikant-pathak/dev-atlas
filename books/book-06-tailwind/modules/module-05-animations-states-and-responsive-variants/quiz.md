# Module 05 Quiz — Animations, States & Responsive Variants

15 questions. Answers are at the bottom — try first!

**1.** Which class defines a spinner animation?
- A) `spin-1`
- B) `animate-spin`
- C) `rotate-loop`
- D) `transition-spin`

**2.** Where are custom keyframes defined in Tailwind v4?
- A) `tailwind.config.js` only
- B) Inside `@theme` in your CSS
- C) In an HTML `<style>` tag only
- D) In `package.json`

**3.** `delay-300` affects…
- A) Animations
- B) Transitions
- C) Both
- D) Scroll snap

**4.** Which variant shows a focus ring only for keyboard users?
- A) `focus:`
- B) `focus-within:`
- C) `focus-visible:`
- D) `active:`

**5.** In v4, stacked variants (`md:hover:bg-red-500`) are applied…
- A) Right to left
- B) Left to right
- C) Alphabetically
- D) Randomly

**6.** What does `peer-checked:` require?
- A) The checkbox to be a parent
- B) The `peer` element to come **before** the styled element, as a sibling
- C) JavaScript
- D) A named group

**7.** Which variant styles a parent when it contains a checked input?
- A) `group-checked:`
- B) `peer-checked:`
- C) `has-checked:`
- D) `in-checked:`

**8.** `not-first:border-t` means…
- A) Border top on the first item only
- B) Border top on every item except the first
- C) No border at all
- D) Border on the last item

**9.** Which matches `<button aria-expanded="true">`?
- A) `aria-expanded:`
- B) `data-expanded:`
- C) `expanded:`
- D) `open:`

**10.** In React, which prop correctly works with `data-active:` presence styling?
- A) `data-active={false}`
- B) `data-active={isActive ? "" : undefined}`
- C) `data-active="false"`
- D) `data-active={0}`

**11.** Which variant adds an ::after pseudo-element style?
- A) `post:`
- B) `after:`
- C) `pseudo-after:`
- D) `end:`

**12.** `sm:` in Tailwind means…
- A) Only on small screens
- B) From the small breakpoint (640px) and up
- C) Below 640px
- D) Small devices only

**13.** How do you create a custom `xs` breakpoint in v4?
- A) `@theme { --breakpoint-xs: 30rem; }`
- B) `theme.screens.xs = '480px'` only
- C) `@media xs { }`
- D) It's not possible

**14.** Which makes an element a container-query context?
- A) `container`
- B) `@container`
- C) `query`
- D) `contain-inline`

**15.** `@md:flex-row` is applied when…
- A) The viewport is ≥ 768px
- B) The nearest `@container` ancestor is ≥ 28rem wide
- C) The element itself is ≥ 28rem wide
- D) The user is on a medium device

---

<details>
<summary>✅ Answers</summary>

1. **B** — `animate-spin`
2. **B** — inside `@theme` (v4 CSS-first config)
3. **B** — `delay-*` is `transition-delay`; use `[animation-delay:…]` for animations
4. **C** — `focus-visible:`
5. **B** — left to right in v4
6. **B** — peer must be an earlier sibling (sibling combinator looks forward)
7. **C** — `has-checked:`
8. **B** — every item except the first
9. **A** — `aria-expanded:` matches `[aria-expanded="true"]`
10. **B** — `undefined`/`""` avoids rendering `"false"`
11. **B** — `after:`
12. **B** — from 640px (40rem) and up
13. **A** — `--breakpoint-xs` in `@theme`
14. **B** — `@container`
15. **B** — `@md` is container-based (28rem), not viewport-based; styles apply to descendants of the container

**Score:** 13–15 Excellent · 10–12 Good · below 10 → revisit Lessons 04–07 and 09–10.
</details>
