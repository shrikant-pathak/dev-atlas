# Module 04 Quiz — Borders, Shadows & Visual Effects

**1. Why does `border-red-500` alone (no width utility) render no visible border?**
a) `border-red-500` is not a valid class
b) Preflight sets border-width to 0 by default
c) Red borders require a special plugin
d) It only works on `<div>` elements

**2. What does `divide-y` do?**
a) Splits an element into two columns
b) Adds a border between every child except the first
c) Adds vertical padding to all children
d) Hides every other child element

**3. What CSS property does `ring-*` use under the hood?**
a) `outline`
b) `border`
c) `box-shadow`
d) `filter`

**4. What changed about the bare `ring` class between v3 and v4?**
a) It was removed entirely
b) Its default width changed from 3px to 1px
c) Its default color changed
d) It now requires a width suffix to work at all

**5. What's new about `text-shadow-*` as of Tailwind v4?**
a) It no longer accepts custom colors
b) It's a first-class utility scale; previously only achievable via arbitrary values
c) It only works on headings
d) It replaced `shadow-*` entirely

**6. What's the key difference between `opacity-50` and `bg-black/50`?**
a) They are functionally identical
b) `opacity-50` dims the whole element and its children; `bg-black/50` only affects the background color
c) `bg-black/50` only works on `<img>` tags
d) `opacity-50` cannot be combined with transitions

**7. What must an element typically have for `backdrop-blur-md` to produce a visible effect?**
a) A fixed width
b) Some background transparency, so there's content behind it to blur
c) A `shadow-*` utility also applied
d) `display: grid`

**8. What does `mask-b-from-80%` do to an image?**
a) Crops the image to 80% of its size
b) Fades the image to transparent starting 80% of the way down, toward the bottom
c) Blurs the bottom 80% of the image
d) Rotates the image 80 degrees

**9. What does `transition-colors` do differently from `transition-all`?**
a) It's faster by default
b) It only animates color-related properties, rather than every animatable property
c) It only works on `<button>` elements
d) It disables hover states

**10. What v4 addition enables a 3D flip-card effect using only utility classes?**
a) `rotate-180`
b) `rotate-x/y/z-*`, `perspective-*`, `transform-3d`, and `backface-hidden`
c) `scale-x-[-1]`
d) `flip-card` utility class

---
### Answer Key
1-b, 2-b, 3-c, 4-b, 5-b, 6-b, 7-b, 8-b, 9-b, 10-b
