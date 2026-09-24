# Module 12 Cheatsheet

## Bootstrap Icons — Inclusion Methods
```html
<!-- CDN webfont -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.min.css">
<i class="bi bi-heart"></i>
```
```bash
npm install bootstrap-icons   # for Module 11 Sass builds
```
```html
<!-- SVG sprite -->
<svg class="bi" width="16" height="16" fill="currentColor"><use xlink:href="bootstrap-icons.svg#heart"/></svg>
```

## Icon Sizing/Color
Webfont: `.fs-*` + `.text-{color}` (behaves like text)
SVG: `width`/`height` attrs + `fill="currentColor"` (inherits CSS `color`)

## Icon Accessibility
- Icon + adjacent visible text → icon gets `aria-hidden="true"` only
- Icon-only, no visible text → `aria-hidden="true"` on icon + `.visually-hidden` span with label

## Bootstrap JS Events
Pattern: `{stage}.bs.{component}` — e.g. `show.bs.modal`, `shown.bs.modal`, `hide.bs.collapse`, `hidden.bs.offcanvas`
```js
el.addEventListener('shown.bs.modal', () => { /* ... */ });
```

## Bootstrap JS API
```js
const modal = new bootstrap.Modal(el);
modal.show(); modal.hide(); modal.toggle();

bootstrap.Modal.getInstance(el);  // retrieve existing instance elsewhere in code
```

## Capstone Project Structure
3 pages (index / services / contact) + shared navbar/footer + one custom.css (Module 11) + dark-mode toggler (Module 10) + Bootstrap Icons (Lesson 01)
Build order: theme/Sass setup → shared partials → landing → services → contact → accessibility pass → responsive pass
