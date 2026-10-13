# Module 08 Interview Questions — Tailwind with Frameworks & Ecosystem

## Beginner

<details>
<summary>1. How do you add Tailwind v4 to a Vite project?</summary>

Install `tailwindcss` and `@tailwindcss/vite`, add `tailwindcss()` to the Vite plugins, and put `@import "tailwindcss";` in your CSS. No `tailwind.config.js` is needed.
</details>

<details>
<summary>2. Why does a fresh Vite template look wrong after adding Tailwind?</summary>

The starter's CSS sets body flex centering, `#root`/`#app` padding and button styles that conflict. Remove it.
</details>

<details>
<summary>3. What does `clsx` do?</summary>

Builds a class string from strings, arrays, objects and conditions, dropping falsy values.
</details>

<details>
<summary>4. What does `tailwind-merge` do?</summary>

Removes conflicting Tailwind utilities from a class string so the last one wins.
</details>

<details>
<summary>5. What's the `cn()` helper?</summary>

`twMerge(clsx(inputs))` — the standard helper for conditional + conflict-free classes.
</details>

## Intermediate

<details>
<summary>6. Why must dynamic class names be avoided in React/Vue?</summary>

Tailwind scans source text for complete class strings. `` `bg-${color}-500` `` doesn't exist as text, so no CSS is generated. Use lookup maps, CSS variables, or `@source inline()`.
</details>

<details>
<summary>7. How do you let a parent override a component's styles safely?</summary>

Accept `className` (React) or a `class` prop (Vue), and merge it last with `cn()` so conflicting utilities are resolved in the caller's favor.
</details>

<details>
<summary>8. What is `cva` and what is the status of its v1?</summary>

A helper that maps variant props to class strings. The stable package is `class-variance-authority` 0.7.x (`cva(base, options)`, maintenance mode). The `cva` package v1 uses `cva({ base, variants })` and `defineConfig` for merge behavior, but is still in beta.
</details>

<details>
<summary>9. Why might `twMerge` break custom tokens, and how do you fix it?</summary>

It doesn't read your theme, so a custom `text-eyebrow` (font size) can be mistaken for a text color and dropped. Register tokens with `extendTailwindMerge`.
</details>

<details>
<summary>10. Why does `@apply` need `@reference` in a Vue `<style>` or a CSS Module?</summary>

Those stylesheets are compiled in isolation and don't know your theme or utilities. `@reference` makes them available without duplicating CSS.
</details>

<details>
<summary>11. What's the React/Vue gotcha with `data-*` boolean attributes?</summary>

`false` renders `data-x="false"`, and `data-x:` matches presence. Pass `undefined`/`""` or match the value explicitly.
</details>

## Advanced

<details>
<summary>12. Compare Headless UI, shadcn/ui and daisyUI.</summary>

Headless UI: unstyled behavior/accessibility, you style everything with `data-*` variants. shadcn/ui: a CLI copies styled components (on Radix/Base UI + `cva` + `cn`) into your repo; you own them and theme with CSS variables via `@theme inline`. daisyUI: a plugin of semantic component classes (`btn`, `card`) with themes, no behavior.
</details>

<details>
<summary>13. How does shadcn/ui theming relate to Tailwind v4?</summary>

It defines semantic CSS variables (`--background`, `--primary`…) per theme and exposes them to Tailwind with `@theme inline`, so components use `bg-background text-foreground` and switch themes without `dark:` everywhere. There's no `tailwind.config.js`.
</details>

<details>
<summary>14. NativeWind v4 vs v5?</summary>

v4 is stable and built on Tailwind v3 with a JS config and JSX transform. v5 is a release candidate on Tailwind v4.1+ with CSS-first config, `react-native-css`, Reanimated CSS animations and `styled()` instead of `cssInterop`; it requires modern React Native and isn't recommended for production yet.
</details>

<details>
<summary>15. What are the main differences between web Tailwind and NativeWind?</summary>

No CSS grid on native, flex column by default, `Text` doesn't inherit from `View`, limited pseudo-elements/effects, platform variants (`ios:`, `android:`, `native:`, `web:`), and utilities are applied only where the platform supports them.
</details>

<details>
<summary>16. Which official plugins are still separate in v4, and which are now core?</summary>

Typography and forms remain separate (`@plugin`). Container queries, aspect-ratio and line-clamp are core.
</details>

<details>
<summary>17. How would you evaluate a third-party Tailwind plugin?</summary>

Check whether core already covers it, whether it supports Tailwind v4 (`@plugin`/CSS-first), whether it's maintained, whether you could write it with `@utility`/`@custom-variant`, and pin its version.
</details>

<details>
<summary>18. When is Tailwind Plus worth buying?</summary>

When you want professionally designed, accessible blocks and templates (plus Catalyst for React) to ship faster and learn from the Tailwind team's code, and the license fits your use. It's a one-time purchase, and you still maintain the copied code.
</details>
