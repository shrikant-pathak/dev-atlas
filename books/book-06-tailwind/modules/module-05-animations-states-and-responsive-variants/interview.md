# Module 05 Interview Questions — Animations, States & Responsive Variants

## Beginner

<details>
<summary>1. What is a "variant" in Tailwind?</summary>

A prefix (`hover:`, `md:`, `dark:`, `aria-expanded:`) that applies a utility only when a condition is true. Variants can be stacked.
</details>

<details>
<summary>2. What does "mobile-first" mean in Tailwind?</summary>

Unprefixed utilities apply at all sizes; breakpoint prefixes (`md:`) apply at that width **and up**. You style the smallest screen first, then layer on changes.
</details>

<details>
<summary>3. What's the difference between `focus:` and `focus-visible:`?</summary>

`focus:` applies for any kind of focus (including mouse clicks). `focus-visible:` applies only when the browser determines focus should be shown, usually keyboard navigation.
</details>

<details>
<summary>4. How do you add a custom animation in Tailwind v4?</summary>

Define `--animate-name: …` and the matching `@keyframes` inside `@theme` in your CSS. That generates `animate-name`.
</details>

<details>
<summary>5. How do you respect users who prefer reduced motion?</summary>

Use `motion-safe:` to apply motion only when allowed, or `motion-reduce:` to turn it off (e.g. `motion-reduce:animate-none`).
</details>

## Intermediate

<details>
<summary>6. Explain `group` vs `peer`.</summary>

`group` lets descendants react to an ancestor's state (`group-hover:`). `peer` lets later siblings react to a sibling's state (`peer-checked:`). Peer only works forward in DOM order because it compiles to the `~` combinator.
</details>

<details>
<summary>7. How would you build a CSS-only toggle switch?</summary>

A visually hidden (`sr-only`) checkbox with `peer`, then sibling elements using `peer-checked:` and `peer-focus-visible:` for the track and knob. Using `sr-only` keeps it accessible.
</details>

<details>
<summary>8. What does `has-*` give you that older approaches didn't?</summary>

Parent selection based on descendants (`has-checked:`, `has-[img]:`) without JavaScript or wrapper hacks. It builds on the native `:has()` selector.
</details>

<details>
<summary>9. Why style from `aria-*` / `data-*` attributes instead of toggling classes?</summary>

The attributes carry accessible state and often must exist anyway; styling from them avoids keeping two representations in sync. It's also exactly how headless libraries like Radix expose state.
</details>

<details>
<summary>10. What's the React gotcha with `data-*` attributes and Tailwind?</summary>

React renders `data-active={false}` as `data-active="false"`. Since `data-active:` matches presence, it still applies. Use `undefined`/`""` or match values explicitly (`data-[active=true]:`).
</details>

<details>
<summary>11. What changed with `hover:` in v4?</summary>

It's wrapped in `@media (hover: hover)` so touch devices don't get sticky hover styles. You can restore the old behavior with `@custom-variant hover (&:hover);`.
</details>

## Advanced

<details>
<summary>12. What problem does `@starting-style` / `starting:` solve?</summary>

Elements that are newly rendered (or go from `display: none`) have no prior style, so they can't transition. `starting:` provides the "from" style so entry animations work without JavaScript. Pair with `transition-discrete` for `display` transitions.
</details>

<details>
<summary>13. Media queries vs container queries — when do you use each?</summary>

Media queries for page-level layout based on viewport; container queries for reusable components that should adapt to the space they're placed in. They're complementary.
</details>

<details>
<summary>14. How would you add `xs` and `3xl` breakpoints in v4?</summary>

`@theme { --breakpoint-xs: 30rem; --breakpoint-3xl: 120rem; }`. To replace all defaults first reset with `--breakpoint-*: initial;`.
</details>

<details>
<summary>15. Why can't you write `md:grid-cols-${n}`?</summary>

Tailwind generates CSS by scanning source for complete class strings. Dynamically assembled names aren't found. Use full-string lookup maps or `@source inline(…)` (Module 06).
</details>

<details>
<summary>16. A sticky header hides anchor targets. How do you fix it?</summary>

`scroll-mt-*` on the targets (or `scroll-pt-*` on the scroll container), sized to the header height.
</details>

<details>
<summary>17. Which animation properties are performant and why?</summary>

`transform` and `opacity` — they don't trigger layout or paint of surrounding content and can be GPU-composited. Avoid animating `width`, `height`, `top`, `left`.
</details>

<details>
<summary>18. What does `delay-200` do, and how do you delay an animation?</summary>

`delay-200` sets `transition-delay`. For animations use `[animation-delay:200ms]` or an inline style.
</details>
