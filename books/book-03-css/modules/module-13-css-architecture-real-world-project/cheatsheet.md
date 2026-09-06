# Module 13 Cheatsheet — CSS Architecture & Real-World Project

## BEM Naming
```css
.block { }
.block__element { }
.block--modifier { }
.block__element--modifier { }
```

## ITCSS Ordering (broad → specific)
Settings → Tools → Generic → Elements → Objects → Components → Utilities


## File Structure
styles/
├── base/ (variables, reset, typography)
├── layout/ (grid, header)
├── components/ (one file per BEM block)
├── utilities/ (single-purpose overrides)
└── main.css (flat import list, in ITCSS order)


## Performance
```css
/* Prefer compositor-only properties */
transition: transform 0.2s, opacity 0.2s;

/* Skip offscreen rendering work */
.item { content-visibility: auto; contain-intrinsic-size: 0 200px; }
```
Render pipeline: **Layout** (expensive) → **Paint** → **Composite** (cheap; transform/opacity only)

## Sass Quick Reference (compiles to plain CSS)
```scss
$primary: #4a90d9;              // compile-time variable
@mixin button-base { ... }      // reusable block, no native equivalent
.btn { @include button-base; }
.card { &:hover { ... } }       // nesting (native CSS now supports this too)
```

## Capstone Checklist Categories
Foundations · Layout · Responsiveness · Visual Polish · Components · Motion · Modern CSS · Architecture & Performance
