# Lesson 06: List Styling

## Learning Objectives
By the end of this lesson, you will be able to:
- Control list bullet/number appearance using `list-style` properties.
- Remove default list styling correctly for navigation menus.
- Use custom markers for lists.

---

# Introduction

Recall Book 02, Module 02's list elements (`<ul>`, `<ol>`, `<dl>`) and Module 03's navigation menu pattern (`<nav><ul>`). This lesson gives you the CSS to control exactly how those lists actually look.

---

# `list-style-type`

Controls the marker/bullet style:

```css
ul { list-style-type: disc; }      /* default filled circle */
ul.square { list-style-type: square; }
ol { list-style-type: decimal; }    /* default, 1, 2, 3... */
ol.roman { list-style-type: upper-roman; }  /* I, II, III... */
ol.alpha { list-style-type: lower-alpha; }   /* a, b, c... */
```

Common values for `<ul>`: `disc` (default), `circle`, `square`, `none`. For `<ol>`: `decimal` (default), `decimal-leading-zero`, `lower-roman`/`upper-roman`, `lower-alpha`/`upper-alpha`.

---

# `list-style-position`

```css
li {
  list-style-position: outside; /* default - marker sits outside the content box */
}
li.inside {
  list-style-position: inside;   /* marker sits inside, text wraps beneath it */
}
```

`outside` (the default) generally looks cleaner for most designs — `inside` can cause wrapped multi-line list items to look visually misaligned with the marker.

---

# Removing List Styling: The Navigation Pattern

Recall Book 02, Module 03's navigation menu, built as `<nav><ul><li><a>`. By default, this renders with bullet points — genuinely not what a navigation bar visually needs:

```css
nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
```

This exact three-line pattern (`list-style-type: none` + resetting the default margin/padding a `<ul>` has) is genuinely one of the most common, near-universal CSS snippets you'll write — the essential first step of styling nearly any navigation menu you'll ever build.

---

# Shorthand: `list-style`

```css
ul {
  list-style: square inside;
}
```
Combines `list-style-type`, `list-style-position`, and optionally `list-style-image` (a rarely-used property for using a custom image as the bullet, generally superseded by the more flexible custom marker approach below).

---

# Custom Markers with `::marker` (Modern Approach)

```css
li::marker {
  color: #3498db;
  font-size: 1.2em;
}
```

The `::marker` pseudo-element (a preview — full pseudo-element depth in Module 04) lets you style a list item's actual bullet/number directly — genuinely more flexible than the older `list-style-image` property, letting you control color, size, and more, not just swap in a different image.

---

# Practical Example

```css
/* Reset for navigation */
nav ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex; /* preview of Module 06 */
}

nav li {
  margin-right: 20px;
}

/* Styled content list */
.article-list {
  list-style-type: square;
  padding-left: 20px;
}

.article-list li::marker {
  color: #e74c3c;
}
```

---

# Revision Questions

1. What CSS pattern is almost universally applied to a `<ul>` used for navigation, and why?
2. What's the difference between `list-style-position: outside` and `inside`?
3. What does `::marker` let you control that `list-style-type` alone cannot?

<details><summary>Answers</summary>

1. `list-style-type: none` combined with resetting `margin`/`padding` to `0` — because navigation menus don't visually need bullet points, and the default `<ul>` spacing doesn't suit a horizontal nav bar layout.
2. `outside` places the marker outside the content box (default, generally cleaner for wrapped text); `inside` places it inside, with wrapped text appearing beneath the marker rather than aligned to it.
3. Direct styling of the marker itself — color, size, and more — rather than being limited to swapping in a different bullet shape or image.

</details>
