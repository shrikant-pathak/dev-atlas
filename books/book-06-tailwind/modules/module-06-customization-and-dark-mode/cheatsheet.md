# Module 06 Cheatsheet — Customization & Dark Mode

## Dark mode

```css
/* class strategy */
@custom-variant dark (&:where(.dark, .dark *));
/* attribute strategy */
@custom-variant dark (&:where([data-theme=dark], [data-theme=dark] *));
```

```js
document.documentElement.classList.toggle("dark",
  localStorage.theme === "dark" ||
  (!("theme" in localStorage) && matchMedia("(prefers-color-scheme: dark)").matches));
```

| Class | CSS |
|---|---|
| `scheme-light` / `scheme-dark` / `scheme-light-dark` | `color-scheme` |

Put the theme script in `<head>` to avoid a flash.

## `@theme`

| Namespace | Generates |
|---|---|
| `--color-*` | `bg-*` `text-*` `border-*` `ring-*` … |
| `--font-*` | `font-*` (family) |
| `--text-*` (+ `--text-*--line-height`) | `text-*` (size) |
| `--font-weight-*` / `--tracking-*` / `--leading-*` | weight / tracking / leading |
| `--spacing` (+ `--spacing-*`) | `p-*` `m-*` `w-*` `gap-*` … |
| `--radius-*` / `--shadow-*` / `--blur-*` | `rounded-*` / `shadow-*` / `blur-*` |
| `--breakpoint-*` / `--container-*` | `md:` / `@md:` + `max-w-*` |
| `--ease-*` / `--animate-*` | `ease-*` / `animate-*` |

| Syntax | Effect |
|---|---|
| `@theme { … }` | Tokens → variables + utilities (emitted only if used) |
| `@theme static { … }` | Always emit |
| `@theme inline { … }` | Utility uses the value directly (needed for `var()` tokens & theme switching) |
| `--color-*: initial;` | Remove a namespace |
| `--*: initial;` | Remove whole default theme |
| `--default-font-family`, `--default-ring-width`, `--default-border-width`, … | Global defaults |

`@theme` must be top-level. Use `:root {}` for variables that shouldn't make utilities.

## Arbitrary values

| Syntax | Meaning |
|---|---|
| `w-[117px]` `grid-cols-[1fr_500px_2fr]` | Arbitrary value (`_` = space) |
| `bg-(--brand)` | CSS variable shorthand |
| `text-(length:--s)` / `text-[color:var(--c)]` | Type hint |
| `[mask-type:luminance]` | Arbitrary property |
| `[--x:10px]` | Set a CSS variable |
| `[&>li]:py-1` | Arbitrary variant |
| `bg-red-500!` | Important (v4: suffix) |
| `@import "tailwindcss" prefix(tw);` → `tw:flex` | Class prefix (v4) |

❌ `bg-${color}-500` — never works. Use full-string maps or CSS variables.

## `@utility`

```css
@utility no-scrollbar { scrollbar-width: none; &::-webkit-scrollbar { display: none } }

@utility tab-* { tab-size: --value(--tab-size-*, integer, [integer]); }
```

- Works with all variants (`md:no-scrollbar`).
- Replaces `@layer utilities` in v4.
- `--value()` sources: `--theme-ns-*`, `integer`, `number`, `percentage`, `color`, `[type]`.

## `@custom-variant` / `@variant`

```css
@custom-variant theme-midnight (&:where([data-theme=midnight] *));
@custom-variant pointer-coarse (@media (pointer: coarse));
@custom-variant any-hover { @media (any-hover: hover) { &:hover { @slot; } } }
@custom-variant hover (&:hover);              /* override built-in */

.card { background: white; @variant dark { background: black; } }
```

## Layers, `@apply`, functions

```
@layer theme, base, components, utilities;   /* later wins; unlayered beats all */
```

| Directive | Use |
|---|---|
| `@layer base { h1 {…} }` | Element defaults |
| `@layer components { .card {…} }` | Plain component classes (no variants!) |
| `@apply px-4 hover:bg-x!;` | Inline utilities into CSS |
| `@reference "../app.css";` | Needed for `@apply` in Vue SFC / CSS Modules |
| `--spacing(4)` / `--alpha(color / 50%)` / `--theme(--breakpoint-xl)` | CSS functions |

Legacy `layer(components)` import for third-party CSS: `@import "x.css" layer(components);`

## Sources, plugins, config

```css
@import "tailwindcss" source("../src");     /* base folder */
@import "tailwindcss" source(none);         /* disable auto-detect */
@source "../node_modules/ui-lib";           /* add path */
@source not "../src/legacy";                /* exclude */
@source inline("{hover:,}bg-red-{100..900..100}");   /* force-generate (v4.1+) */
@plugin "@tailwindcss/typography";
@config "../tailwind.config.js";            /* legacy JS config */
```

Not supported in `@config`: `corePlugins`, `safelist`, `separator`.

## Semantic multi-theme pattern

```css
:root  { --surface: oklch(1 0 0);    --foreground: oklch(0.2 0 0); }
.dark  { --surface: oklch(0.18 0 0); --foreground: oklch(0.96 0 0); }
@theme inline { --color-surface: var(--surface); --color-foreground: var(--foreground); }
```

`bg-surface text-foreground` → no `dark:` needed. Add themes with `[data-theme="x"] { … }`.
