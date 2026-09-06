# Module 08 Quiz — Responsive Design

1. Which meta tag is required for responsive CSS to work correctly on mobile browsers?
   a) `<meta name="responsive">`
   b) `<meta name="viewport" content="width=device-width, initial-scale=1.0">`
   c) `<meta charset="UTF-8">`
   d) `<meta name="mobile" content="true">`

2. In mobile-first CSS, base (unqueried) styles typically target:
   a) Desktop
   b) Tablet
   c) Mobile
   d) Print

3. Which media query type is characteristic of mobile-first design?
   a) `max-width`
   b) `min-width`
   c) `orientation`
   d) `aspect-ratio`

4. `clamp(1rem, 4vw, 3rem)` will:
   a) Always render at exactly 4vw
   b) Never go below 1rem or above 3rem, scaling smoothly between based on 4vw
   c) Pick randomly between the three values
   d) Only apply on screens wider than 4vw

5. What does `max-width: 100%` combined with `height: auto` on an `img` accomplish?
   a) Crops the image
   b) Prevents the image from exceeding its container's width while preserving aspect ratio
   c) Converts the image to a background
   d) Forces the image to a fixed size

6. What does the `sizes` attribute tell the browser when used with `srcset`?
   a) The exact file size in kilobytes
   b) How wide the image will actually be displayed at different viewport widths
   c) The image's aspect ratio
   d) Which image format to use

7. What problem does the `aspect-ratio` property primarily solve?
   a) Slow network requests
   b) Layout shift caused by unknown media dimensions before loading
   c) Browser compatibility with old CSS
   d) Color contrast issues

8. `aspect-ratio: 1 / 1` on an element produces:
   a) A rectangle twice as wide as tall
   b) A perfect square (or circle, with border-radius: 50%)
   c) A 16:9 widescreen shape
   d) No visible effect

<details><summary>Answer Key</summary>

1. b
2. c
3. b
4. b
5. b
6. b
7. b
8. b

</details>
