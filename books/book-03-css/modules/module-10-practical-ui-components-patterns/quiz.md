# Module 10 Quiz — Practical UI Components & Patterns

1. Which Flexbox property spaces a navbar's brand and links to opposite ends?
   a) `align-items: stretch`
   b) `justify-content: space-between`
   c) `flex-wrap: wrap`
   d) `gap: auto`

2. What's the main accessibility limitation of a `:hover`-only dropdown?
   a) It doesn't work in Chrome
   b) Keyboard and touch-only users can't trigger a hover state
   c) It requires JavaScript
   d) It only works with `<select>` elements

3. Which pseudo-class shows a focus outline only for likely keyboard navigation?
   a) `:focus`
   b) `:active`
   c) `:focus-visible`
   d) `:target`

4. What combination of Grid properties creates a gallery that reflows columns automatically?
   a) `grid-template-columns: repeat(auto-fit, minmax(200px, 1fr))`
   b) `grid-template-columns: 1fr`
   c) `display: flex; flex-wrap: nowrap;`
   d) `grid-auto-flow: dense`

5. Why were CSS sprite sheets historically used?
   a) To improve image quality
   b) To reduce the number of separate HTTP requests for small icons
   c) To enable animations
   d) To support dark mode

6. What CSS property allows a link-based element to be effectively "disabled" since `<a>` has no native disabled attribute?
   a) `display: none`
   b) `pointer-events: none`
   c) `visibility: hidden`
   d) `z-index: -1`

7. What does `.checkbox-input:checked + .checkbox-box` rely on to work?
   a) The `:target` pseudo-class
   b) The adjacent sibling combinator
   c) `background-clip: text`
   d) `container-type`

8. How does a CSS-only `:target` modal typically close?
   a) A JavaScript `onclick` handler
   b) A link to a bare `#`, which clears the URL fragment so `:target` no longer matches
   c) Setting `opacity: 1`
   d) It can't be closed without JavaScript

<details><summary>Answer Key</summary>

1. b
2. b
3. c
4. a
5. b
6. b
7. b
8. b

</details>
