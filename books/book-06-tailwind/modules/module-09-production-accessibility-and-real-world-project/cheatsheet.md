# Module 09 Cheatsheet — Production, Accessibility & Real-World Project

## Accessibility quick rules

| Need | Do |
|---|---|
| Action / navigation | `<button>` / `<a href>` — never a clickable `div` |
| Hide visually, keep for AT | `sr-only` (reveal with `not-sr-only`) |
| Remove from everything | `hidden` / `invisible` / `inert` (**not** `opacity-0`) |
| Skip link | `sr-only focus:not-sr-only focus:fixed …` |
| Focus | One global `:focus-visible` outline; prefer `outline` over `ring` |
| Sticky header offset | `scroll-mt-*` / `scroll-pt-*` |
| Targets | ≥ 24px min, 44px touch (`size-11`, `min-h-11`, `pointer-coarse:`) |
| Contrast | 4.5:1 text · 3:1 large text & UI components · not color alone |
| Lists after reset | `role="list"` |
| Order | Don't change meaning with `order-*` / `flex-row-reverse` |
| Sizes | rem-based (`text-xs`), `min-h-*`, reflow at 320px |

## User-preference variants

| Variant | Meaning |
|---|---|
| `motion-safe:` / `motion-reduce:` | prefers-reduced-motion |
| `contrast-more:` / `contrast-less:` | prefers-contrast (not the `contrast-*` filter!) |
| `forced-colors:` / `not-forced-colors:` | Forced colors mode |
| `inverted-colors:` | OS inverted colors |
| `pointer-fine:` `pointer-coarse:` `pointer-none:` | Primary pointer |
| `any-pointer-fine:` `any-pointer-coarse:` | Any pointer |
| `dark:` | Color scheme |
| `noscript:` | JavaScript disabled |
| `print:` | Print |
| `supports-[…]:` / `not-supports-[…]:` | `@supports` |

Forced colors: shadows/rings vanish; outlines & borders stay. System colors: `Canvas`, `CanvasText`, `LinkText`, `ButtonFace`, `ButtonText`, `Highlight`, `HighlightText`, `GrayText`. `forced-color-adjust-none` only where color *is* the content.

## Performance

```bash
npm run build
npx @tailwindcss/cli -i src/styles.css -o dist/out.css --minify
```

| Bloat | Fix |
|---|---|
| Huge `@source inline` / safelist | Narrow the ranges |
| Scanning generated dirs | `.gitignore`, `@source not` |
| Plugin/library CSS | Limit themes/components |
| Two frameworks | Finish migration |
| `@theme static` | Plain `@theme` |

Fonts: WOFF2, subset, variable, preload 1–2, `font-display: swap`. Images: width/height or `aspect-*`, AVIF/WebP, `loading="lazy"` (not the LCP image). Runtime: avoid `transition-all`, animating layout, big `backdrop-blur`.

## Browser support

v4 baseline: **Safari 16.4 · Chrome 111 · Firefox 128**. Older → stay on v3.4. Features: widely available = use; newly available = enhance with fallback; limited = fallback/avoid. Test in Chromium + WebKit + Firefox.

## v3 → v4

| v3 | v4 |
|---|---|
| `@tailwind base/components/utilities` | `@import "tailwindcss";` |
| `bg-opacity-50` | `bg-black/50` |
| `flex-shrink-0` / `flex-grow` | `shrink-0` / `grow` |
| `overflow-ellipsis` | `text-ellipsis` |
| `shadow-sm` / `shadow` | `shadow-xs` / `shadow-sm` |
| `blur-sm` / `blur` | `blur-xs` / `blur-sm` |
| `rounded-sm` / `rounded` | `rounded-xs` / `rounded-sm` |
| `outline-none` | `outline-hidden` |
| `ring` | `ring-3` |
| `bg-gradient-to-r` | `bg-linear-to-r` |
| `bg-[--x]` | `bg-(--x)` |
| `!p-4` | `p-4!` |
| `prefix: 'tw-'` | `@import "tailwindcss" prefix(tw);` → `tw:flex` |
| `@layer utilities {.x{}}` | `@utility x { … }` |
| `theme('colors.x')` | `var(--color-x)` |
| `container` config | `@utility container {…}` |

Default changes: border color → `currentColor`; ring → 1px `currentColor`; placeholder → 50% text color; buttons `cursor: default`; `hover:` only when hover-capable; variants stack left→right.

## Bootstrap → Tailwind

| Bootstrap | Tailwind |
|---|---|
| `row/col-md-6` | `grid md:grid-cols-2` |
| `g-3` | `gap-4` |
| `d-none d-md-block` | `hidden md:block` |
| `visually-hidden` | `sr-only` |
| `p-3` / `p-4` / `p-5` | `p-4` / `p-6` / `p-12` |
| `rounded-pill` | `rounded-full` |
| `fs-5` | `text-xl` |
| `btn btn-primary` | Button component |
| `modal` | `<dialog>` |

Breakpoints to mirror Bootstrap: 36 / 48 / 62 / 75 / 87.5 rem. Coexist with layers: `@layer theme, base, components, utilities;` + Bootstrap in `components` + Tailwind theme/utilities, no Preflight until the end.

## RTL

| Physical | Logical |
|---|---|
| `ml-*` `mr-*` | `ms-*` `me-*` |
| `pl-*` `pr-*` | `ps-*` `pe-*` |
| `left-*` `right-*` | `start-*` `end-*` (see version note) |
| `text-left/right` | `text-start/end` |
| `border-l/r` · `rounded-l/r` | `border-s/e` · `rounded-s/e` |

`rtl:` / `ltr:` for icons and transforms (`rtl:-scale-x-100`, `ltr:-translate-x-full rtl:translate-x-full`); prefer `gap-*`.

## Review greps

```bash
rg -n "@tailwind (base|components|utilities)|bg-opacity-|flex-(shrink|grow)|outline-none|bg-gradient-to-" src
rg -n "\b(bg|text|border|ring)-(slate|gray|red|blue|green|indigo)-[0-9]{2,3}\b" src/features
rg -n "\b(ml|mr|pl|pr|text-left|text-right|rounded-[lr]|border-[lr])\b" src
```
