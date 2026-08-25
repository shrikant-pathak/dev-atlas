# Quiz — Positioning & Layout Fundamentals

## Multiple Choice
1. Which `display` value removes an element entirely from the layout, taking zero space?
   a) `visibility: hidden`  b) `display: none`  c) `opacity: 0`  d) `display: inline`

2. Which position value is positioned relative to the browser viewport and stays fixed while scrolling?
   a) relative  b) absolute  c) fixed  d) static

3. What prerequisite must an element have for `z-index` to work?
   a) A background color  b) A non-static `position` value  c) A `display: block`  d) A `width` set

4. What is float's still-valid, modern use case?
   a) Multi-column page layout  b) Text wrapping around an image  c) Centering elements  d) Sticky headers

---

## True / False
1. `overflow: auto` always shows scrollbars, even if content doesn't overflow. (True/False)
2. A container with only floated children automatically expands to contain their height. (True/False)
3. `max-width: 100%` prevents an image from ever exceeding its container's width. (True/False)

---

## Short Answer
1. Explain what happens to an absolutely positioned element if no ancestor has a non-static `position`.
2. Why is `position: sticky` described as a hybrid of `relative` and `fixed`?
3. What CSS pattern fixes the "container collapses to zero height" float problem?

---

## Coding Questions
1. Write CSS positioning a small badge in the top-right corner of a relatively-positioned card.
2. Write a responsive container: 100% width, max-width of 1000px, centered horizontally.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-b

**True/False:** 1-False (auto shows scrollbars only when needed; `scroll` always shows them), 2-False (it collapses to zero height, the opposite), 3-True

**Coding Question 1:**
```css
.card { position: relative; }
.badge { position: absolute; top: -8px; right: -8px; }
```

**Coding Question 2:**
```css
.container {
  width: 100%;
  max-width: 1000px;
  margin: 0 auto;
}
```

</details>
