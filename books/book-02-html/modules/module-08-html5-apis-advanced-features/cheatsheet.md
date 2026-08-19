# 📄 Cheat Sheet — HTML5 APIs & Advanced Features

## Canvas vs. SVG

| | Canvas | SVG |
|---|---|---|
| Output | Raw pixels | Real DOM elements |
| Scales without quality loss | No | Yes |
| CSS styleable | No (JS redraw only) | Yes |
| Best for | Games, pixel manipulation, data-heavy viz | Icons, logos, illustrations |

```html
<canvas id="c" width="400" height="300"></canvas>

<svg width="200" height="200">
  <circle cx="100" cy="100" r="80" fill="blue" />
</svg>
```

## Drag & Drop

```html
<div draggable="true">Drag me</div>
```
Events (JS): `dragstart`, `dragover`, `drop`, `dragend`

## Web Storage

| | localStorage | sessionStorage |
|---|---|---|
| Persists | Until manually cleared | Until tab closes |
| Scope | All tabs, same origin | Single tab |

```javascript
localStorage.setItem('key', 'value');
localStorage.getItem('key');
localStorage.removeItem('key');
localStorage.clear();
```

## Geolocation

```javascript
navigator.geolocation.getCurrentPosition(
  (position) => { /* success */ },
  (error) => { /* denied/unavailable */ }
);
```
⚠️ Always request in response to a clear user action, never on page load.

## Web Components

```html
<user-card name="..." role="..."></user-card>
```
Custom, reusable elements — the native precursor to framework components (React, Book 09).

## Validation

**validator.w3.org** — checks HTML against the official spec; catches errors browsers silently "fix."
