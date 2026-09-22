# Module 06 Cheatsheet

## Buttons
`.btn` + `.btn-{color}` · `.btn-outline-{color}` · `.btn-sm` / `.btn-lg`
`disabled` (native) vs `.active` (visual only) · `role="button"` on `<a>`

## Button Groups
`.btn-group` + `role="group"` + `aria-label` · `.btn-group-vertical` · `.btn-group-sm/lg` (on wrapper)
`.btn-check` (hidden input) + `.btn` label · `.btn-toolbar`

## Badges
`.badge` + `.bg-{color}` · `.rounded-pill` · position pattern: `.position-relative` (parent) + `.position-absolute .top-0 .start-100 .translate-middle` (badge)

## Alerts
`.alert` + `.alert-{color}` · `role="alert"` · `.alert-heading` · `.alert-link`
Dismissible: `.alert-dismissible .fade .show` + `.btn-close` + `data-bs-dismiss="alert"`

## Cards
`.card` · `.card-body` · `.card-title` · `.card-subtitle` · `.card-text`
`.card-img-top` · `.card-header` · `.card-footer`
`.list-group .list-group-flush` (inside cards) · `.h-100` (equal-height card rows)

## Close Button
`.btn-close` + `aria-label="Close"` (mandatory) · `.btn-close-white` (dark bg)
`data-bs-dismiss="{alert|toast|modal|...}"`

## Progress Bars
`.progress` (track, ARIA lives here) + `.progress-bar` (fill, inline `style="width:X%"`)
Required: `role="progressbar"` `aria-valuenow` `aria-valuemin` `aria-valuemax`
`.progress-bar-striped` · `.progress-bar-animated` · `.bg-{color}` for fill color
