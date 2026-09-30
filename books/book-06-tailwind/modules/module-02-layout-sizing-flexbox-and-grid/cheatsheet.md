# Module 02 Cheatsheet — Layout, Sizing, Flexbox & Grid

## Display & Visibility
`block` `inline-block` `inline` `flex` `grid` `hidden` (removes from layout) `invisible` (hides, keeps space) `sr-only` (accessible, visually hidden)

## Spacing
`p-4` `px-4` `py-4` `pt-/pr-/pb-/pl-4` · `m-4` (+ same directional set) · `-m-4` (negative) · `space-x-4` / `space-y-4` (margin between siblings)

## Sizing
`w-1/2` `w-full` `w-screen` `h-dvh`/`h-svh`/`h-lvh` (mobile-safe viewport units) · `size-10` (width + height together, v4) · `min-w-*` `max-w-*` `min-h-*` `max-h-*` · `max-w-prose` (readable measure) · `container` + `mx-auto` (centered, breakpoint-capped wrapper)

## Position & Z-Index
`static` `relative` `absolute` `fixed` `sticky` · `inset-0` `inset-x-*` `inset-y-*` `top-/right-/bottom-/left-*` · `start-*`/`end-*` (RTL-aware logical) · `z-0` … `z-50` (only affects positioned elements)

## Overflow / Aspect / Object
`overflow-auto/hidden/scroll/visible` (+ `-x`/`-y`) · `aspect-video` (16/9) `aspect-square` `aspect-[4/3]` · `object-cover` (fill, crop) `object-contain` (fit, letterbox) `object-fill` (stretch)

## Flexbox
`flex` `inline-flex` · `flex-row`/`flex-col` (+ `-reverse`) · `flex-wrap`/`flex-nowrap` · `flex-1` (grow/shrink freely) `flex-none` (fixed) `flex-auto` `flex-initial` · `order-*` (visual only, not DOM order)

## Alignment & Gap
`justify-start/center/end/between/around/evenly` (main axis) · `items-start/center/end/stretch/baseline` (cross axis) · `self-*` (per-item override) · `gap-4` `gap-x-4` `gap-y-4` (flex/grid only, CSS `gap` property)

## Grid
`grid` · `grid-cols-1`…`12` `grid-rows-1`…`6` · `grid-cols-[200px_1fr_200px]` (arbitrary tracks) · `auto-cols-*`/`auto-rows-*` `grid-flow-col` · `col-span-*`/`row-span-*` · `col-start-*`/`col-end-*` · `grid-cols-subgrid` (inherit parent tracks)

## Recipes
- **Center:** `flex items-center justify-center` or `grid place-items-center`
- **Sticky footer:** `flex min-h-screen flex-col` on wrapper, `flex-1` on main
- **Modal overlay:** `fixed inset-0 z-50 flex items-center justify-center bg-black/50`
