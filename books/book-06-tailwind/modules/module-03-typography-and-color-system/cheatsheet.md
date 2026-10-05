# Module 03 Cheatsheet — Typography & Color System

## Font
`font-sans`/`font-serif`/`font-mono` · `text-xs`…`text-9xl` (bundles default `leading-*`) · `font-thin`(100)…`font-black`(900) · arbitrary: `text-[15px]/[1.4]`

## Line Height & Tracking
`leading-none`(1) `leading-tight`(1.25) `leading-normal`(1.5) `leading-loose`(2) · `tracking-tighter/tight/normal/wide/wider/widest`

## Color, Alignment, Decoration
`text-{color}-{shade}` · `text-left/center/right/justify` + `text-start`/`text-end` (RTL-aware) · `underline`/`line-through`/`no-underline` · `decoration-{color}/{width}/{style}` `underline-offset-*`

## Wrap & Truncate
`text-wrap`/`text-nowrap` · `text-balance` (even headline lines) `text-pretty` (avoid orphans) · `truncate` (1 line + ellipsis, needs a width) · `line-clamp-1`…`6` (multi-line + ellipsis)

## Lists & Typography Plugin
`list-disc`/`list-decimal`/`list-none` · `list-inside`/`list-outside` · `@tailwindcss/typography`: `prose` `prose-sm/lg/xl` `prose-invert` (dark mode) `prose-headings:*` (overrides)

## Web Fonts & Features
Register via `@theme { --font-sans: "Inter", ui-sans-serif, ...; }` · `tabular-nums` (aligned digit columns) `lining-nums`/`oldstyle-nums`/`diagonal-fractions` · `antialiased`

## Color Palette
11 shades per family: `50`…`950` · `500` = base shade · v4 palette defined in **OKLCH** (wider P3 gamut, perceptually uniform steps) · same class syntax as always, e.g. `bg-blue-500`

## Opacity (v4 slash syntax)
`bg-black/50` `text-blue-600/75` `border-gray-900/20` · arbitrary: `bg-black/[0.37]` · replaces legacy v3 `bg-opacity-*`/`text-opacity-*`

## Gradients
`bg-linear-to-r` (+ `tr/t/tl/l/bl/b/br`) · `from-*` `via-*` `to-*` color stops · `bg-linear-45` (arbitrary angle) · `bg-radial` and `bg-conic` (new in v4)

## Background Images
`bg-[url('/img.jpg')]` · `bg-cover`/`bg-contain` · `bg-center`/`bg-top`/etc. · `bg-no-repeat`/`bg-repeat`
