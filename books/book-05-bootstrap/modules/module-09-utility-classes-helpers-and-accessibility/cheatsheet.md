# Module 09 Cheatsheet

## Flex
`.d-flex` / `.d-inline-flex` · `.flex-row/-column` (+ `-reverse`) · `.flex-wrap/-nowrap`
`.justify-content-{start|center|end|between|around|evenly}` (main axis)
`.align-items-{start|center|end}` (cross axis) · `.flex-grow-1` · `.flex-shrink-*` · `.flex-fill`

## Display & Position
`.d-{none|inline|inline-block|block|flex|grid}` + responsive infix (`.d-md-none`)
`.position-{static|relative|absolute|fixed|sticky}` · `.sticky-top`
`.top-0/.start-100/.end-0/.bottom-0` (percent of container) + `.translate-middle`

## Object Fit & Ratio
`.object-fit-{cover|contain|fill|scale-down|none}`
`.ratio` + `.ratio-{1x1|4x3|16x9|21x9}` · custom: `style="--bs-aspect-ratio: 50%;"`

## Stacks & Stretched Link
`.vstack` = `d-flex flex-column` shorthand · `.hstack` = `d-flex flex-row` shorthand (+ `gap-*`)
`.stretched-link` — needs `.position-relative` on the ancestor; keep only ONE real link, never wrap whole card in `<a>`

## Truncation & Visually Hidden
`.text-truncate` — needs block/inline-block display + a constrained width; in flex, also needs `min-width: 0`
`.visually-hidden` (hidden visually, announced to screen readers — NOT the same as `.d-none`)
`.visually-hidden-focusable` (hidden until keyboard focus — "skip to content" links)

## Clearfix & Vertical Rule
`.clearfix` (contains floated children) · `.float-start/-end`
`.vr` (flex-height-matching divider) vs `.border-start/-end` (edge border on existing element)

## Colored Links & Icon Link
`.link-{color}` (proper hover/focus, NOT `.text-{color}`) · `.link-opacity-{25|50|75|100}[-hover]`
`.link-underline-opacity-{0|100}[-hover]` (underline-on-hover pattern)
`.icon-link` + `.icon-link-hover` — SVG icon: `fill="currentColor"`

## Focus Ring
`.focus-ring` (only for custom `tabindex="0"` elements — native components already handle this)
`.focus-ring-{color}` · `.focus-ring-opacity-{value}` · relies on `:focus-visible`

## Accessibility (7 recurring patterns)
1. Label association (`for`/`id`) 2. State syncing (`aria-expanded/selected/current`)
3. Hidden-but-announced (`.visually-hidden`) 4. Live region (`role="alert"/"status"`, `aria-live`)
5. Landmark labeling (`aria-label` on `<nav>`) 6. Focus management (`tabindex`, focus trapping)
7. Semantic structure (`role="tablist"` etc., `<ol>` for breadcrumb)
