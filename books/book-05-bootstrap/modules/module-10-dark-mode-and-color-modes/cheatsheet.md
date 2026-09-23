# Module 10 Cheatsheet

## Basic Theme Switch
`data-bs-theme="dark"` / `"light"` — on `<html>` (whole page) or any container (scoped section)
Works because components use `var(--bs-*)`, never hardcoded colors

## System Detection
```js
window.matchMedia('(prefers-color-scheme: dark)').matches  // boolean
```
React to live change:
```js
window.matchMedia('(prefers-color-scheme: dark)')
  .addEventListener('change', e => { /* e.matches */ });
```

## Custom Color Mode
```css
[data-bs-theme="custom-name"] {
  --bs-body-bg: ...;
  --bs-body-color: ...;
  --bs-primary: ...;
  --bs-border-color: ...;
}
```
Base variables only — deep component-internal overrides need Sass (Module 11)

## localStorage (persistence)
```js
localStorage.setItem('theme', 'dark');
localStorage.getItem('theme');   // null if unset
localStorage.removeItem('theme'); // "Auto" = clear saved choice
```

## Full Resolution Priority (on load)
1. `localStorage.getItem('theme')` (manual choice) →
2. else `matchMedia('(prefers-color-scheme: dark)').matches` (system) →
3. set `data-bs-theme` accordingly

## Avoid Flash of Wrong Theme
Run resolution as an IIFE in `<head>`, before page content renders:
```js
(function() { /* resolve + setAttribute here */ })();
```
