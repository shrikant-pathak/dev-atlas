# Module 12 Quiz — Advanced & Modern CSS

1. Which symbol must a custom property name start with?
   a) `$`
   b) `--`
   c) `@`
   d) `#`

2. What does `width: min(90%, 600px)` do?
   a) Always renders at exactly 600px
   b) Uses whichever value is smaller at any given time
   c) Uses whichever value is larger
   d) Ignores the percentage entirely

3. `clamp(MIN, PREFERRED, MAX)` is equivalent to:
   a) `min(MIN, max(PREFERRED, MAX))`
   b) `max(MIN, min(PREFERRED, MAX))`
   c) `calc(MIN + MAX)`
   d) `min(MAX, PREFERRED)`

4. What must be set on a parent element before `@container` queries work on its children?
   a) `position: relative`
   b) `container-type`
   c) `overflow: hidden`
   d) `display: contents`

5. What does `.card:has(img)` match?
   a) Any `img` inside a `.card`
   b) A `.card` element that contains an `img` somewhere inside it
   c) An `img` that is also a `.card`
   d) A `.card` with no images

6. What's the specificity contribution of `:where(header, main)`?
   a) The highest specificity among its arguments
   b) Zero, always
   c) The sum of all its arguments' specificity
   d) It depends on nesting depth

7. In native CSS nesting, what does `&` refer to?
   a) The document root
   b) The parent selector
   c) A random child element
   d) The next sibling only

8. What does `@property` primarily enable?
   a) Faster page loads
   b) Registering a custom property's type so it can be smoothly animated
   c) Automatic dark mode
   d) Removing unused CSS

<details><summary>Answer Key</summary>

1. b
2. b
3. b
4. b
5. b
6. b
7. b
8. b

</details>
