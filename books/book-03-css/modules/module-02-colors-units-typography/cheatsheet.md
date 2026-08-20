# 📄 Cheat Sheet — Colors, Units & Typography

## Color Formats

```css
color: tomato;                        /* named */
color: #3498db;                        /* hex */
color: rgb(52, 152, 219);               /* RGB */
color: rgba(0, 0, 0, 0.5);               /* RGB + alpha */
color: hsl(204, 70%, 53%);                 /* HSL */
color: hsla(204, 70%, 53%, 0.3);            /* HSL + alpha */
```

## Units

| Unit | Relative to | Common use |
|---|---|---|
| `px` | Nothing (absolute) | Fixed, precise details |
| `%` | Parent element | Fluid widths |
| `em` | Current/parent font-size (compounds) | Component-relative spacing |
| `rem` | Root `<html>` font-size (no compounding) | Font sizes (default choice) |
| `vw` / `vh` | Viewport width/height | Full-screen sections |

## Font Stack

```css
font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
```
Always end with a generic family: `serif`, `sans-serif`, or `monospace`.

## Web Fonts

```html
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
```

```css
@font-face {
  font-family: "MyFont";
  src: url("fonts/myfont.woff2") format("woff2");
  font-display: swap;
}
```

## Text Properties

```css
text-align: center | left | right | justify;
text-decoration: none | underline | line-through;
text-transform: uppercase | lowercase | capitalize;
line-height: 1.6;                    /* unitless preferred */
letter-spacing: 2px;
word-spacing: 5px;
```

## Icons

| Approach | Best For |
|---|---|
| Emoji | Quick/casual projects |
| Icon fonts (Font Awesome) | Fast setup, large icon sets |
| SVG | Production, accessibility, styling flexibility |
