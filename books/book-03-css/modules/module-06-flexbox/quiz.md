# Quiz — Flexbox

## Multiple Choice
1. What CSS property activates Flexbox on a container?
   a) `flex: true`  b) `display: flex`  c) `layout: flex`  d) `position: flex`

2. Which property controls distribution of items along the main axis?
   a) align-items  b) align-content  c) justify-content  d) flex-wrap

3. What does `flex: 1` set as shorthand?
   a) flex-grow only  b) flex-grow, flex-shrink, flex-basis  c) just flex-basis  d) align-self

4. Which property lets a single flex item override the container's cross-axis alignment?
   a) order  b) align-self  c) justify-self  d) flex-basis

---

## True / False
1. Flexbox's main axis is always horizontal, regardless of `flex-direction`. (True/False)
2. `align-content` only has a visible effect when `flex-wrap` produces multiple lines. (True/False)
3. The `order` property changes both visual order and screen reader/tab order. (True/False)

---

## Short Answer
1. Explain the difference between `flex-grow` and `flex-shrink`.
2. What combination of properties achieves both horizontal and vertical centering in Flexbox?
3. Why is Flexbox considered one-dimensional?

---

## Coding Questions
1. Write a nav bar with a logo on the left and links on the right using Flexbox.
2. Write CSS for a sidebar that's always exactly 250px wide next to a main content area that fills the rest of the space.

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-b, 4-b

**True/False:** 1-False (direction depends on `flex-direction`), 2-True, 3-False (order only changes visual order, not screen reader/tab order)

**Coding Question 1:**
```css
.nav-bar {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
```

**Coding Question 2:**
```css
.sidebar { flex: 0 0 250px; }
.main-content { flex: 1; }
```

</details>
