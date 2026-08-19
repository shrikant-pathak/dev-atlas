# Quiz — Links, Images & Media

## Multiple Choice
1. What does `../` mean in a file path?
   a) Current folder  b) Go up one directory  c) Site root  d) External link

2. Which attribute is required for accessibility on `<img>`?
   a) src  b) width  c) alt  d) title

3. What does `rel="noopener noreferrer"` protect against?
   a) Slow loading  b) Broken images  c) Tabnabbing  d) SEO penalties

4. Which element lets the browser choose between different image resolutions?
   a) `<picture>` only  b) `srcset`  c) `<iframe>`  d) `<figure>`

---

## True / False
1. A root-absolute path starting with `/` always works regardless of the current page's nesting depth. (True/False)
2. `<iframe>` embeds a single media file, like `<img>`. (True/False)
3. `alt=""` and omitting `alt` entirely have the same effect for screen readers. (True/False)

---

## Short Answer
1. Explain the difference between `srcset` and `<picture>`.
2. Why is `title` required on an `<iframe>` for accessibility?
3. What's the fallback content used for inside `<video>` and `<audio>` tags?

---

## Coding Questions
1. Write an anchor tag linking to `https://example.com`, opening in a new tab, with the correct security attribute.
2. Write a `<figure>` containing an image with alt text "Team photo" and a caption "Our team, 2026".

<details><summary>Answers</summary>

**Multiple Choice:** 1-b, 2-c, 3-c, 4-b

**True/False:** 1-True, 2-False (iframe embeds a full webpage, not a single media file), 3-False (alt="" tells screen readers to skip it; omitting alt can cause the filename to be announced instead)

**Coding Question 1:**
```html
<a href="https://example.com" target="_blank" rel="noopener noreferrer">Visit</a>
```

**Coding Question 2:**
```html
<figure>
  <img src="team.jpg" alt="Team photo">
  <figcaption>Our team, 2026</figcaption>
</figure>
```

</details>
