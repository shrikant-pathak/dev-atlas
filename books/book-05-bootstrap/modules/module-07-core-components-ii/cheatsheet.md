# Module 07 Cheatsheet

## Navbar
`.navbar .navbar-expand-{bp} .navbar-light/dark .bg-*`
`.navbar-brand` · `.navbar-toggler` + `.navbar-toggler-icon` · `.collapse .navbar-collapse`
`.navbar-nav` · `.nav-item` · `.nav-link` (+ `.active`)
Toggle: `data-bs-toggle="collapse"` + `data-bs-target="#id"`

## Nav & Tabs
`.nav` · `.nav-pills` / `.nav-tabs` · `.flex-column` (vertical)
Functional: `role="tablist/tab/tabpanel"` · `data-bs-toggle="tab"` + `data-bs-target`
`aria-selected` · `aria-controls` / `aria-labelledby` · `.tab-content` / `.tab-pane.fade.show.active`

## Breadcrumb
`<nav aria-label="breadcrumb"><ol class="breadcrumb">`
`.breadcrumb-item` · `.active` + `aria-current="page"` (last item, no link)
Custom separator: `--bs-breadcrumb-divider`

## Pagination
`<nav aria-label="..."><ul class="pagination">`
`.page-item` / `.page-link` · `.active` + `aria-current="page"`
`.disabled` + `tabindex="-1"` + `aria-disabled="true"` (on `<a>`, no native disabled)
`.pagination-sm/lg` (wrapper) · `.justify-content-center/end` (alignment)

## Dropdowns
`.dropdown` · `.dropdown-toggle` + `data-bs-toggle="dropdown"` · `.dropdown-menu` + `.dropdown-item`
`.dropdown-header` · `.dropdown-divider` · `.dropdown-item.disabled`
Split: `.btn-group` + `.dropdown-toggle-split`
Direction: `.dropup` `.dropend` `.dropstart` · Align: `.dropdown-menu-end`

## Offcanvas
`.offcanvas` + `.offcanvas-start/end/top/bottom`
`data-bs-toggle="offcanvas"` + `data-bs-target` · dismiss: `.btn-close` + `data-bs-dismiss="offcanvas"`
`.offcanvas-header` / `.offcanvas-title` / `.offcanvas-body`
`data-bs-backdrop="false"` · `data-bs-scroll="true"` · Responsive: `.offcanvas-{bp}`

## List Groups
`.list-group` + `.list-group-item` · `.active` + `aria-current`
`.list-group-item-{color}` (built-in subtle tint) · `.list-group-item-action` (clickable, use `<a>`/`<button>`)
`.list-group-horizontal-{bp}` · `.list-group-flush`
