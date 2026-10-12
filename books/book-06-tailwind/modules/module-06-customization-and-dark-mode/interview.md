# Module 06 Interview Questions — Customization & Dark Mode

## Beginner

<details>
<summary>1. How does Tailwind v4 configure the design system?</summary>

In CSS, with `@theme`, instead of `tailwind.config.js`. Theme variables become CSS custom properties and, based on their namespace, utilities.
</details>

<details>
<summary>2. How does `dark:` work by default?</summary>

It follows the OS preference through `prefers-color-scheme: dark`.
</details>

<details>
<summary>3. How do you add a custom color `brand` to Tailwind v4?</summary>

`@theme { --color-brand: oklch(…); }`, then use `bg-brand`, `text-brand`, etc.
</details>

<details>
<summary>4. What are arbitrary values?</summary>

Square-bracket values for one-off styles: `w-[117px]`, `bg-[#316ff6]`, `grid-cols-[1fr_500px_2fr]`.
</details>

<details>
<summary>5. Where does the important modifier go in v4?</summary>

At the end of the class: `bg-red-500!`.
</details>

## Intermediate

<details>
<summary>6. How do you implement a manual dark-mode toggle with a saved preference?</summary>

Redefine the `dark` variant with `@custom-variant dark (&:where(.dark, .dark *))`, toggle a `dark` class on `<html>`, store `light`/`dark` in `localStorage` (remove the key for "system"), and apply it in a blocking `<head>` script to avoid a flash.
</details>

<details>
<summary>7. What's the difference between `@theme` and `:root`?</summary>

`@theme` variables also generate utilities (by namespace) and are emitted only when used (unless `static`). `:root` variables are just variables.
</details>

<details>
<summary>8. When do you need `@theme inline`?</summary>

When a theme variable references another variable (`--color-surface: var(--surface)`). `inline` makes utilities use the referenced variable directly, so nested overrides (scoped themes) and externally-defined variables (like font loaders) resolve correctly.
</details>

<details>
<summary>9. How does the spacing scale work in v4?</summary>

Everything numeric is `calc(var(--spacing) * n)`. Change `--spacing` to rescale; any number works without registration.
</details>

<details>
<summary>10. Why was `@layer utilities` replaced by `@utility`?</summary>

v4 uses native cascade layers, where `@layer utilities` is plain CSS. `@utility` registers a real Tailwind utility so it works with variants and can accept values.
</details>

<details>
<summary>11. What are `@custom-variant` and `@slot`?</summary>

`@custom-variant` defines a named variant. In block form, `@slot` marks where the utility's declarations go inside your selector/at-rule structure.
</details>

## Advanced

<details>
<summary>12. Why might `.btn { padding: 20px }` beat `p-2`?</summary>

Unlayered CSS beats every cascade layer, including `utilities`. Put custom CSS in a layer, or import third-party CSS with `layer(components)`.
</details>

<details>
<summary>13. Why does `@apply` fail in a Vue `<style scoped>` block, and how do you fix it?</summary>

That stylesheet is processed in isolation and doesn't know the theme/utilities. Add `@reference "../app.css"` (it emits no duplicate CSS), or use CSS variables directly.
</details>

<details>
<summary>14. Explain why `bg-${color}-500` doesn't work and what replaces `safelist`.</summary>

Tailwind scans source text for complete class names; it doesn't execute code. Use full-string maps or CSS variables, or force generation with `@source inline("…")` (v4.1+), which replaces `safelist`.
</details>

<details>
<summary>15. How would you design theming for a white-label SaaS with per-tenant brand colors?</summary>

Semantic tokens (`--primary`, `--surface`…) exposed with `@theme inline`; components use `bg-primary` etc. Set the variables per tenant at runtime (style attribute or a `data-theme`/CSS file), with no per-tenant class generation and no rebuild.
</details>

<details>
<summary>16. How do you migrate a project that has a `tailwind.config.js`?</summary>

Run `npx @tailwindcss/upgrade`, or temporarily load it with `@config`. Note that `corePlugins`, `safelist` and `separator` aren't supported, and v4 doesn't auto-detect the file.
</details>

<details>
<summary>17. `light-dark()` vs semantic variables for theming?</summary>

`light-dark()` is concise but limited to two schemes tied to `color-scheme`. Semantic variables with `data-theme` handle any number of themes and scoped themes.
</details>
