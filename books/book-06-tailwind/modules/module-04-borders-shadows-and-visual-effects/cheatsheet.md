# Module 04 Cheatsheet — Borders, Shadows & Visual Effects

## Borders & Radius
`border` `border-2` `border-t`/`r`/`b`/`l` · `border-{color}-{shade}` · `border-dashed`/`dotted`/`double` · `rounded-{none|sm|md|lg|xl|2xl|3xl|full}` · per-corner `rounded-tl-*` etc. · logical `rounded-s-*`/`rounded-e-*` · `divide-x`/`divide-y` (border between siblings, mirrors `space-x`/`space-y`)

## Outline vs. Ring
| | Outline | Ring |
|---|---|---|
| CSS | `outline` | `box-shadow` |
| Stacks with `shadow-*`? | Can conflict | Clean |
`outline-2 outline-offset-2 outline-blue-500` · `ring-2 ring-blue-500 ring-offset-2` · ⚠️ **v4: bare `ring` default width changed 3px → 1px** — specify width explicitly

## Shadows
`shadow-xs/sm/md/lg/xl/2xl` `shadow-inner` `shadow-none` · colored: `shadow-lg shadow-indigo-500/50` · **v4 new:** `text-shadow-sm/md/lg` `text-shadow-{color}`

## Opacity & Blend & Filters
`opacity-50` (whole element, vs. Module 03's `bg-black/50` which is color-only) · `mix-blend-multiply/screen/overlay` `bg-blend-*` · `blur-md` `brightness-125` `contrast-125` `grayscale` `sepia` `saturate-150` `invert` `hue-rotate-90` `drop-shadow-lg` (follows transparent shape, unlike `shadow-*`)

## Masks & Backdrop (v4 masks are new)
`backdrop-blur-md` `backdrop-brightness-*` `backdrop-saturate-*` (needs element transparency to show) · **v4 new:** `mask-b-from-80%` `mask-t-from-*` `mask-radial-*` `mask-linear-*`

## Transitions
`transition` (default property set) `transition-colors/opacity/shadow/transform/all` `transition-none` · `duration-150/300/500/1000` · `ease-linear/in/out/in-out` · `delay-150/300` (stagger animations)

## Transforms
2D: `scale-105` `scale-x-*`/`scale-y-*` `rotate-45` `translate-x-4`/`translate-y-4` `skew-x-6` · `origin-top-left` (pivot point) · **v4 new 3D:** `rotate-x-*`/`rotate-y-*`/`rotate-z-*` `perspective-*` `transform-3d` (preserve-3d) `backface-hidden` (flip-card effects)
