# 📄 Cheat Sheet — Positioning & Layout Fundamentals

## Display

```css
display: block | inline | inline-block | none | flex | grid;
```
`display: none` removes from layout entirely; `visibility: hidden` keeps the space reserved.

## Position

| Value | Removed from flow? | Relative to |
|---|---|---|
| static (default) | No | N/A |
| relative | No | Its own original position |
| absolute | Yes | Nearest positioned ancestor |
| fixed | Yes | Viewport |
| sticky | No (until threshold) | Own position → viewport |

```css
.parent { position: relative; }   /* positioning context */
.child { position: absolute; top: 0; right: 0; }
```

## Z-index & Stacking Context

```css
.el { position: relative; z-index: 10; } /* z-index needs non-static position */
```
New stacking contexts are created by: positioned + z-index, `opacity < 1`, `transform`, `filter`.

## Overflow

```css
overflow: visible | hidden | scroll | auto;
overflow-x: hidden;
overflow-y: auto;
```

## Float & Clear (legacy layout, still valid for text-wrap)

```css
img { float: left; margin-right: 15px; }
.clearfix::after { content: ""; display: table; clear: both; }
```

## Inline-block

```css
.item {
  display: inline-block;
  width: 100px;
  vertical-align: middle;
}
```

## Max/Min Constraints

```css
.container { width: 100%; max-width: 1200px; margin: 0 auto; }
img, video { max-width: 100%; height: auto; }
.card { min-height: 250px; }
.scroll-box { max-height: 400px; overflow-y: auto; }
```
