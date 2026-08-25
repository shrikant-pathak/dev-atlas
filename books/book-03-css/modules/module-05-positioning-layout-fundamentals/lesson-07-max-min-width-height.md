# Lesson 07: Max/Min-width & Height

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `max-width`/`min-width` and `max-height`/`min-height` correctly.
- Explain why `max-width: 100%` is a foundational responsive image technique.
- Combine these properties with fixed widths for flexible, robust layouts.

---

# Introduction

This final lesson of Module 05 covers constraint properties — genuinely essential for building layouts and images that behave robustly across different screen sizes, directly setting up Module 08's full responsive design module.

---

# `max-width`

```css
.container {
  width: 100%;
  max-width: 1200px;
}
```

This container tries to be `100%` of its parent's width, but will **never exceed 1200px**, regardless of how wide the browser window is. This exact pattern — fluid by default, capped at a sensible maximum — is genuinely one of the most common, essential patterns in all of real-world responsive layout, and you'll use it constantly starting now.

---

# `min-width`

```css
.sidebar {
  width: 25%;
  min-width: 200px;
}
```

The inverse guarantee: this element tries to be `25%` of its parent, but will **never shrink below 200px**, even if the parent becomes very narrow — preventing content (like navigation text) from becoming uncomfortably squeezed or unreadable at small sizes.

---

# `max-height` and `min-height`

```css
.card {
  min-height: 300px; /* ensures visual consistency even with little content */
}
.scrollable-area {
  max-height: 400px;
  overflow-y: auto; /* Lesson 04 — content beyond max-height becomes scrollable */
}
```

`min-height` is genuinely useful for maintaining visual consistency across a grid of cards with varying amounts of content — ensuring shorter cards don't look awkwardly small next to taller ones. `max-height` combined with `overflow-y: auto` (Lesson 04) is the standard pattern for a fixed-height, scrollable content panel.

---

# The Single Most Important Responsive Pattern: `max-width: 100%` on Images

```css
img {
  max-width: 100%;
  height: auto;
}
```

This is genuinely one of the most foundational, universally-applied responsive CSS rules — recall Book 02, Module 03's responsive images lesson (`srcset`/`picture`), which solved *which file* loads; this CSS rule solves *how that image behaves* once it's on the page.

**Without this rule:** an image with a fixed intrinsic size (say, 1200px wide) will overflow a narrower mobile screen's container, breaking the layout and potentially causing horizontal scrolling on the entire page.

**With this rule:** the image scales down to fit its container, but importantly, **never scales up beyond its own natural size** (since `max-width: 100%` is a ceiling, not a fixed value) — avoiding a small image being blown up and looking blurry/pixelated. The accompanying `height: auto` ensures the image's aspect ratio stays correct as its width adjusts (an even more explicit, modern way to guarantee this is Module 08's `aspect-ratio` property).

**This single rule is commonly applied globally, right alongside `box-sizing: border-box` from Module 03:**
```css
img, video {
  max-width: 100%;
  height: auto;
}
```

---

# Combining Everything: A Genuinely Robust Container Pattern

```css
.content-wrapper {
  width: 100%;
  max-width: 800px;
  min-width: 300px;
  margin: 0 auto; /* Module 03 centering, still works here */
  padding: 20px;
  box-sizing: border-box; /* Module 03 — ensures padding doesn't break the max-width cap */
}
```

This single pattern — fluid, capped, centered, with a sensible floor — is genuinely the backbone of a huge share of real-world page layouts you'll build going forward.

---

# Practical Example

```css
img, video {
  max-width: 100%;
  height: auto;
}

.container {
  width: 90%;
  max-width: 1140px;
  margin: 0 auto;
}

.card {
  min-height: 250px;
}

.chat-log {
  max-height: 500px;
  overflow-y: auto;
}
```

---

# Revision Questions

1. What does `max-width: 100%` on images solve, and what would go wrong without it?
2. Why is `height: auto` typically paired with `max-width: 100%` on images?
3. Give a real use case for `min-height` on a card component.

<details><summary>Answers</summary>

1. It prevents an image from overflowing its container on smaller screens; without it, a large fixed-size image could break the layout and cause horizontal scrolling on narrow screens.
2. It ensures the image's aspect ratio is preserved as its width adjusts, preventing distortion.
3. Maintaining visual consistency across a grid of cards with varying amounts of content, so shorter cards don't look awkwardly small compared to taller ones.

</details>

---

# 🏁 Module 05 Checkpoint

Before moving to Module 06, you should be able to:
- [ ] Control layout behavior with `display: block/inline/none`
- [ ] Use `position` (relative, absolute, fixed, sticky) with a clear positioning-context mental model
- [ ] Debug real z-index issues using the stacking context concept
- [ ] Control content overflow with `overflow`/`overflow-x`/`overflow-y`
- [ ] Recognize float's legacy layout role and its still-valid text-wrapping use case
- [ ] Use `inline-block` and `vertical-align` correctly, aware of the whitespace gap quirk
- [ ] Apply `max-width`/`min-width`/`max-height`/`min-height`, especially the `max-width: 100%` image pattern

**Next up:** Module 06 — Flexbox
