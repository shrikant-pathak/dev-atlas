# Module 12 Cheatsheet — Advanced & Modern CSS

## Custom Properties
```css
:root { --primary: #4a90d9; }
.box { color: var(--primary, #333); }
.card { --accent: green; } /* scoped override */
```

## Math Functions
```css
width: calc(100% - 250px);
width: min(90%, 600px);
width: max(300px, 50%);
font-size: clamp(1rem, 4vw, 2rem); /* = max(1rem, min(4vw, 2rem)) */
```

## Container Queries
```css
.wrapper { container-type: inline-size; }
@container (min-width: 400px) { .card { flex-direction: row; } }
```

## Modern Selectors
```css
.card:has(img) { padding: 0; }
:is(header, main, footer) a { color: blue; }
:where(header, main, footer) a { color: blue; } /* zero specificity */
```

## CSS Nesting
```css
.card {
  padding: 1.5rem;
  &:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
  h3 { margin-bottom: 0.5rem; }
  @media (min-width: 600px) { padding: 2rem; }
}
```

## @property
```css
@property --angle {
  syntax: '<angle>';
  inherits: false;
  initial-value: 0deg;
}
```

## Accessibility Patterns
```css
.visually-hidden { position: absolute; width: 1px; height: 1px; overflow: hidden; clip-path: inset(50%); }
@media (prefers-reduced-motion: reduce) { * { animation: none; transition: none; } }
```

## Shapes & Masking
```css
.avatar { float: left; shape-outside: circle(50%); clip-path: circle(50%); }
.hexagon { clip-path: polygon(25% 0%, 75% 0%, 100% 50%, 75% 100%, 25% 100%, 0% 50%); }
.fade { mask-image: linear-gradient(to bottom, black 70%, transparent 100%); }
```
