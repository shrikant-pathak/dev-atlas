# Module 01 Cheatsheet — Bootstrap Fundamentals

## CDN Setup
```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
```

## npm Setup
```bash
npm install bootstrap@5.3.8
```
```js
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
```

## File Reference
| File | Purpose |
|---|---|
| `bootstrap.min.css` | Minified CSS |
| `bootstrap.bundle.min.js` | JS + Popper (use this by default) |
| `bootstrap.min.js` | JS only, no Popper |

## Starter Template Skeleton
```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>...</title>
  <link href="..." rel="stylesheet">
</head>
<body>
  ...
  <script src="..."></script>
</body>
</html>
```

## Data Attribute Triggers
```html
<button data-bs-toggle="modal" data-bs-target="#myModal">Open</button>
```

## Programmatic API
```js
const modal = new bootstrap.Modal(document.getElementById('myModal'));
modal.show();
modal.hide();
```

## Manual Init Required For
- Tooltips: `new bootstrap.Tooltip(el)`
- Popovers: `new bootstrap.Popover(el)`

## Component Events Pattern
```js
el.addEventListener('shown.bs.modal', () => { /* ... */ });
```
Naming pattern: `<event>.bs.<component>` (e.g. `show.bs.modal`, `hidden.bs.dropdown`).

## Browser Support
- Latest Chrome, Firefox, Safari, Edge (desktop + mobile)
- No Internet Explorer support (dropped in 5.0)
