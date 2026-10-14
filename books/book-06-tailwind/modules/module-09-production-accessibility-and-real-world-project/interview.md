# Module 09 Interview Questions — Production, Accessibility & Real-World Project

## Beginner

<details>
<summary>1. Does Tailwind make a site accessible?</summary>

No. It's a styling tool. Accessibility comes from semantic HTML, keyboard support, ARIA where needed, contrast and testing; Tailwind just makes some mistakes (removing outlines, hiding content wrongly) easy.
</details>

<details>
<summary>2. What does `sr-only` do?</summary>

Hides content visually while keeping it available to screen readers (and focusable). `not-sr-only` reverses it, e.g. to show a skip link on focus.
</details>

<details>
<summary>3. Which Tailwind variants respond to reduced motion and dark mode?</summary>

`motion-reduce:` / `motion-safe:` for `prefers-reduced-motion`; `dark:` for color scheme.
</details>

<details>
<summary>4. What are Tailwind v4's minimum browsers?</summary>

Safari 16.4, Chrome 111, Firefox 128 (per the compatibility docs; check the current page).
</details>

<details>
<summary>5. How do you run the v3 → v4 upgrade tool?</summary>

`npx @tailwindcss/upgrade` (Node 20+), on a branch, then review the diff and test.
</details>

## Intermediate

<details>
<summary>6. Why is `opacity-0` a poor way to hide an interactive control?</summary>

It stays focusable and in the accessibility tree. Use `hidden`, `invisible` or `inert`.
</details>

<details>
<summary>7. Why do `ring-*` focus styles fail in forced-colors mode?</summary>

Rings are box-shadows, which forced-colors mode removes. Outlines are preserved, so use `outline` (and `outline-hidden` keeps a transparent outline for this).
</details>

<details>
<summary>8. What's the difference between `contrast-more:` and `contrast-125`?</summary>

`contrast-more:` is a variant for the user's increased-contrast preference. `contrast-125` is a CSS filter.
</details>

<details>
<summary>9. Name five v3 → v4 changes that commonly cause visual differences.</summary>

Default border color is `currentColor`; default ring is 1px `currentColor`; placeholder color changed; buttons use `cursor: default`; `hover:` only applies on hover-capable devices; shifted shadow/blur/rounded names; `space-*`/`divide-*` selector changes; `container` no longer centers.
</details>

<details>
<summary>10. How do you keep production CSS small and verify it?</summary>

Avoid huge `@source inline` ranges and scanning generated folders, trim library CSS, finish framework migrations, and measure raw/gzip/brotli sizes in CI against a budget.
</details>

<details>
<summary>11. How do you provide a fallback for an unsupported CSS feature?</summary>

Write the safe default first, then layer the enhancement behind `supports-[…]:` (and `not-supports-[…]:` where needed), so the page works without it.
</details>

## Advanced

<details>
<summary>12. How would you migrate a Bootstrap site to Tailwind with low risk?</summary>

Audit, recreate the theme as tokens (including Bootstrap's breakpoints), let both coexist using cascade layers (Bootstrap in `components`, Tailwind theme + utilities, no Preflight), rebuild components, migrate page by page with visual diffs, remove Bootstrap JS then CSS, and finally enable Preflight.
</details>

<details>
<summary>13. How does Tailwind's RTL support differ from Bootstrap's?</summary>

Bootstrap generates a separate RTL stylesheet. Tailwind uses logical utilities (`ms-*`, `pe-*`, `text-start`, `rounded-s-*`) that follow `dir`, plus `rtl:`/`ltr:` variants for things that don't flip (icons, transforms).
</details>

<details>
<summary>14. Why does Tailwind v4 not run on old browsers, and what do you do if you need them?</summary>

It relies on `@property`, `color-mix()` and cascade layers. Stay on v3.4 (or drop/degrade those browsers).
</details>

<details>
<summary>15. What makes a good design-system component?</summary>

Variants as props (cva), accepts `className` merged with `cn()`, passes native props through, owns accessibility, no outer margins, uses semantic tokens only, covers all states and user preferences.
</details>

<details>
<summary>16. What would you check when reviewing AI-generated Tailwind code?</summary>

v3-isms (`@tailwind`, `tailwind.config.js` tokens, `bg-opacity-*`, `flex-shrink-*`, `outline-none`, `bg-gradient-to-*`, `safelist`), dynamic class names, inaccessible markup, raw palette colors, and whether it assumes v3's default scale (`shadow-sm`).
</details>

<details>
<summary>17. Which accessibility problems can automated tools not catch?</summary>

Logical focus order, meaningful alt text and labels, keyboard traps in custom widgets, screen reader announcements, and many contrast/state issues that depend on context. Manual testing is required.
</details>
