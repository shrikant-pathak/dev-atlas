# Module 09 Quiz

1. What CSS property does the entire `.d-*` utility family control?
   a) `position`  b) `display`  c) `float`  d) `visibility`
   **Answer: b) `display`**

2. What must a parent element have for `.position-absolute` children to position relative to IT rather than the whole page?
   a) `.d-flex`  b) `.position-relative`  c) `.overflow-hidden`  d) Nothing extra is needed
   **Answer: b) `.position-relative`**

3. What's the key difference between `.object-fit-cover` and `.object-fit-contain`?
   a) Cover crops to fill the box; contain fits entirely without cropping  b) They're identical  c) Contain always distorts the image  d) Cover only works on video
   **Answer: a) Cover crops to fill the box; contain fits entirely without cropping**

4. Why does `.ratio` matter more for iframes than images?
   a) Iframes don't support width  b) Iframes have no intrinsic aspect ratio behavior the way images do  c) `.ratio` only works on iframes  d) It doesn't matter more, they're equivalent
   **Answer: b) Iframes have no intrinsic aspect ratio behavior the way images do**

5. What must a card have for `.stretched-link` to work correctly, scoped only to that card?
   a) `.d-flex`  b) `.position-relative` on the card  c) A fixed height  d) Nothing extra
   **Answer: b) `.position-relative` on the card**

6. Why might `.text-truncate` fail inside a flex item?
   a) Truncation doesn't work in flex layouts at all  b) The flex item's default min-width based on content can prevent shrinking enough to truncate  c) It only works on `<p>` tags  d) It requires JavaScript
   **Answer: b) The flex item's default min-width based on content can prevent shrinking enough to truncate**

7. What's the critical difference between `.visually-hidden` and `.d-none`?
   a) They're functionally identical  b) `.d-none` hides from both visual page and screen readers; `.visually-hidden` hides only visually  c) `.visually-hidden` is deprecated  d) `.d-none` only works on text
   **Answer: b) `.d-none` hides from both visual page and screen readers; `.visually-hidden` hides only visually**

8. Why is `.link-{color}` preferred over `.text-{color}` on links?
   a) They're the same thing  b) `.link-{color}` coordinates proper hover/focus behavior; `.text-{color}` is a flat static color  c) `.text-{color}` doesn't work on `<a>` tags  d) `.link-{color}` is deprecated
   **Answer: b) `.link-{color}` coordinates proper hover/focus behavior; `.text-{color}` is a flat static color**

9. Why should the default focus outline never be removed without a replacement?
   a) It's required by law in all cases  b) Keyboard-only users rely on it entirely to track the currently active element  c) It has no real functional purpose  d) Browsers block its removal anyway
   **Answer: b) Keyboard-only users rely on it entirely to track the currently active element**

10. Which of these is NOT one of the seven recurring accessibility patterns identified in Lesson 09?
    a) Label association  b) State syncing  c) Live region announcement  d) Color palette selection
    **Answer: d) Color palette selection**
