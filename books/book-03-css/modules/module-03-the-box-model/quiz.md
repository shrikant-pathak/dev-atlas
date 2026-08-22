# Quiz — The Box Model

## Multiple Choice
1. Which layer of the box model is closest to the actual content?
   a) Margin  b) Border  c) Padding  d) Outline

2. What does `box-sizing: border-box` include within the specified width?
   a) Only content  b) Content and padding only  c) Content, padding, and border  d) Margin only

3. Which `object-fit` value crops an image to completely fill its box without distortion?
   a) fill  b) contain  c) cover  d) none

4. What CSS pattern is the near-universal first step for styling a navigation `<ul>`?
   a) `display: flex` only  b) `list-style-type: none` + margin/padding reset  c) `border: none`  d) `text-decoration: none`

---

## True / False
1. Outline takes up space in the box model, just like border. (True/False)
2. Adjacent vertical margins add together rather than collapsing. (True/False)
3. `border-radius: 50%` on a perfect square creates a circle. (True/False)

---

## Short Answer
1. Explain why removing `outline: none` without a replacement is a genuine accessibility concern.
2. What's the difference between `object-fit: cover` and the default `fill` behavior?
3. Why does `border-collapse: collapse` matter for table styling?

---

## Coding Questions
1. Write CSS applying `box-sizing: border-box` to every element on a page.
2. Write CSS for a 150x150px image using `object-fit: cover` and rounding it into a circle.

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-c, 3-c, 4-b

**True/False:** 1-False (outline doesn't affect box model/layout), 2-False (the larger margin wins, they don't add), 3-True

**Coding Question 1:**
```css
*, *::before, *::after {
  box-sizing: border-box;
}
```

**Coding Question 2:**
```css
img {
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
}
```

</details>
