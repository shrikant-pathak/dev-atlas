# Module 08 Cheatsheet

## Modal
`.modal.fade` + `tabindex="-1"` + `aria-hidden="true"` · `.modal-dialog` (+ `-sm/lg/xl`, `-centered`, `-scrollable`)
`.modal-content` → `.modal-header/body/footer`
`data-bs-toggle="modal"` + `data-bs-target` · dismiss: `data-bs-dismiss="modal"`
Static: `data-bs-backdrop="static"` + `data-bs-keyboard="false"`

## Accordion
`.accordion` → `.accordion-item` → `.accordion-header` + `.accordion-button` (`.collapsed` when closed)
`.accordion-collapse.collapse[.show]` + `data-bs-parent="#id"` (single-open) — omit for always-open
`.accordion-flush` (borderless variant)

## Collapse
`.collapse[.show]` + `data-bs-toggle="collapse"` + `data-bs-target="#id"` (or `.class` for multi-target)
`.collapse-horizontal` (animates width, needs explicit width)
JS API: `new bootstrap.Collapse(el, {toggle:false})` → `.show()/.hide()/.toggle()`

## Carousel
`.carousel.slide` → `.carousel-inner` → `.carousel-item[.active]`
Controls: `.carousel-control-prev/next` + `data-bs-slide="prev/next"`
Indicators: `data-bs-slide-to="N"` · Captions: `.carousel-caption`
Autoplay: `data-bs-ride="carousel"` + `data-bs-interval` (ms) · Fade: `.carousel-fade`

## Tooltips (manual init required)
`data-bs-toggle="tooltip"` + `data-bs-title` + `data-bs-placement`
`new bootstrap.Tooltip(el)` per element · `data-bs-html="true"` only for trusted content

## Popovers (manual init required)
`data-bs-toggle="popover"` + `data-bs-title` + `data-bs-content`
Default trigger: click · `data-bs-trigger="focus"` for click-elsewhere dismiss
`new bootstrap.Popover(el)`

## Toasts
`.toast` + `role="alert"` + `aria-live="assertive|polite"` + `aria-atomic="true"`
`.toast-header` / `.toast-body` · dismiss: `.btn-close` + `data-bs-dismiss="toast"`
Shown via JS only: `new bootstrap.Toast(el).show()`
`data-bs-autohide="false"` (persist) · `data-bs-delay="ms"` · `.toast-container` (stacking/position)

## Scrollspy
`data-bs-spy="scroll"` + `data-bs-target="#navId"` + `data-bs-offset` on scrollable container
Nav link `href="#section"` must match section `id="section"`

## Spinners (no JS/data attrs needed)
`.spinner-border` / `.spinner-grow` + `role="status"` + `.visually-hidden` text
`.text-{color}` for color · `.spinner-border-sm` (only small variant exists)
In-button: `aria-hidden="true"` on spinner when adjacent visible text already says "Loading..."
