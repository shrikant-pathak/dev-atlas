# Quiz — Colors, Units & Typography

## Multiple Choice
1. What does the "A" in RGBA stand for?
   a) Angle  b) Alpha  c) Absolute  d) Array

2. Which unit is relative to the root `<html>` element's font-size?
   a) em  b) rem  c) px  d) %

3. Which generic font family is used for displaying code?
   a) serif  b) sans-serif  c) monospace  d) cursive

4. Which property removes the default underline from a link?
   a) `text-transform: none`  b) `text-decoration: none`  c) `text-align: none`  d) `font-style: none`

---

## True / False
1. `em` values compound through nested elements, but `rem` values do not. (True/False)
2. A font stack should always end with a generic family name. (True/False)
3. SVG icons are generally considered less accessible than icon fonts. (True/False)

---

## Short Answer
1. Explain the difference between HSL's Hue, Saturation, and Lightness values.
2. Why are unitless `line-height` values generally preferred over fixed pixel values?
3. What does `font-display: swap` accomplish?

---

## Coding Questions
1. Write a CSS rule setting a paragraph's text color to a 50%-transparent blue using RGBA.
2. Write a `@font-face` rule loading a font called "Brand Sans" from `fonts/brand-sans.woff2`.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-b, 3-c, 4-b

**True/False:** 1-True, 2-True, 3-False (SVG is generally considered MORE accessible than icon fonts)

**Coding Question 1:**
```css
p {
  color: rgba(0, 0, 255, 0.5);
}
```

**Coding Question 2:**
```css
@font-face {
  font-family: "Brand Sans";
  src: url("fonts/brand-sans.woff2") format("woff2");
}
```

</details>
