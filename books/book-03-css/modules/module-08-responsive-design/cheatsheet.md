# Module 08 Cheatsheet — Responsive Design

## Viewport Meta Tag (required, in `<head>`)
```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

## Media Queries
```css
@media (min-width: 768px) { /* mobile-first: builds UP */ }
@media (max-width: 767px) { /* desktop-first: builds DOWN */ }
@media (min-width: 600px) and (max-width: 900px) { /* range */ }
@media (max-width: 600px), (orientation: portrait) { /* OR */ }
@media (prefers-color-scheme: dark) { /* auto dark mode */ }
```

## Mobile-First Pattern
```css
.grid { grid-template-columns: 1fr; }          /* base: mobile */
@media (min-width: 600px)  { .grid { grid-template-columns: repeat(2, 1fr); } }
@media (min-width: 1000px) { .grid { grid-template-columns: repeat(3, 1fr); } }
```

## Fluid Typography
```css
font-size: clamp(MIN, PREFERRED, MAX);
font-size: clamp(1rem, 0.75rem + 1vw, 1.5rem);
padding: clamp(1rem, 5vw, 4rem);
```

## Responsive Images & Video
```css
img, video { max-width: 100%; height: auto; }
```
```html
<img src="photo-800w.jpg"
     srcset="photo-400w.jpg 400w, photo-800w.jpg 800w"
     sizes="(max-width: 600px) 100vw, 50vw"
     alt="...">

<picture>
  <source media="(max-width: 600px)" srcset="mobile.jpg">
  <img src="desktop.jpg" alt="...">
</picture>
```

## aspect-ratio
```css
.box { aspect-ratio: 16 / 9; }
.square { aspect-ratio: 1 / 1; }
img { width: 100%; aspect-ratio: 16 / 9; object-fit: cover; }
```
