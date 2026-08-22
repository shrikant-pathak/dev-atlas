# 📄 Cheat Sheet — The Box Model

## The Four Layers

margin → border → padding → content

## Shorthand Order (TRouBLe)
```css
padding: 10px 20px 10px 20px;  /* Top Right Bottom Left */
margin: 10px 20px;               /* vertical horizontal */
border: 2px solid black;          /* width style color */
```

## Margin Collapsing
Adjacent vertical margins: the **larger** wins, doesn't add.

## Box-Sizing (apply globally)
```css
*, *::before, *::after {
  box-sizing: border-box;
}
```

## Centering a Block Element
```css
.container {
  width: 800px;
  margin: 0 auto;
}
```

## Outline vs Border

| | Outline | Border |
|---|---|---|
| Affects layout size | No | Yes |
| Individual sides | No | Yes |
| Common use | Focus indicators | Visual edges |

⚠️ Never `outline: none` without a replacement focus style.

## Rounded Corners
```css
border-radius: 10px;        /* all corners */
border-radius: 50%;          /* circle (on square element) */
border-radius: 999px;         /* pill shape */
```

## Navigation List Reset
```css
nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
```

## Table Styling Essentials
```css
table { border-collapse: collapse; }
tbody tr:nth-child(even) { background-color: #f2f2f2; }
tbody tr:hover { background-color: #e8f4fc; }
```

## object-fit
```css
img {
  width: 200px;
  height: 200px;
  object-fit: cover;    /* fills box, crops, no distortion */
  object-position: center;
}
```
