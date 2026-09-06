# Module 10 Cheatsheet — Practical UI Components & Patterns

## Navbar
```css
.navbar { display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; }
```

## Dropdown / Tooltip
```css
.dropdown:hover .dropdown-menu, .dropdown:focus-within .dropdown-menu { display: block; }
.tooltip::after { content: attr(data-tooltip); position: absolute; }
```

## Buttons
```css
.btn:hover { }
.btn:active { transform: scale(0.98); }
.btn:focus-visible { outline: 3px solid #a3c9f1; }
.btn:disabled { opacity: 0.5; cursor: not-allowed; }
```

## Gallery
```css
.gallery { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); }
.gallery img { aspect-ratio: 1/1; object-fit: cover; }
```

## Sprite
```css
.icon { background-image: url("sprite.png"); background-position: -32px 0; }
```

## Pagination
```css
.page-btn { display: inline-flex; align-items: center; justify-content: center; }
.page-btn.disabled { opacity: 0.4; pointer-events: none; }
```

## Multi-Column
```css
.article { columns: 3 250px; column-gap: 2rem; column-rule: 1px solid #ddd; }
.article figure { break-inside: avoid; }
```

## Forms
```css
.input:focus { outline: none; box-shadow: 0 0 0 3px rgba(74,144,217,0.2); }
.input:invalid:not(:placeholder-shown) { border-color: #e05252; }
.checkbox-input:checked + .checkbox-box { background: #4a90d9; }
```

## Modal / Lightbox
```css
.modal { display: none; position: fixed; inset: 0; }
.modal:target { display: flex; }
```
