# 📄 Cheat Sheet — CSS Fundamentals

## Rule Anatomy

```css
selector {
  property: value;
}
```

## Adding CSS

```html
<!-- Inline -->
<p style="color: blue;">...</p>

<!-- Internal -->
<style> p { color: blue; } </style>

<!-- External (professional standard) -->
<link rel="stylesheet" href="styles.css">
```

## Basic Selectors

| Selector | Targets | Example |
|---|---|---|
| Element | Every instance of a tag | `p { }` |
| `.class` | Elements with that class | `.highlight { }` |
| `#id` | The one element with that ID | `#main-header { }` |
| `*` | Every element | `* { }` |
| `p.class` | `<p>` elements with that class | `p.intro { }` |
| `h1, h2, h3` | Multiple selectors, comma-separated | shared styling |

## Specificity Weights

| Type | Weight |
|---|---|
| Inline style | 1000 |
| ID (`#id`) | 100 |
| Class/attribute/pseudo-class | 10 |
| Element/pseudo-element | 1 |
| Universal (`*`) | 0 |

**Tiebreaker:** same specificity → later rule in source wins.

## Inheritance

| Inherits by default | Does NOT inherit |
|---|---|
| `color`, `font-family`, `font-size`, `line-height`, `text-align` | `margin`, `padding`, `border`, `width`, `height`, `background` |

Force inheritance: `property: inherit;`

## Comments

```css
/* CSS comment syntax */
```
