cat > lesson-03-images-alt-text.md << 'EOF'
# Lesson 03: Images & Alt Text

## Learning Objectives
By the end of this lesson, you will be able to:
- Correctly embed images using `<img>`.
- Write genuinely useful alt text, not just filler.
- Use `<figure>` and `<figcaption>` for images that need captions.

---

# Introduction

Images are everywhere on the web, and `<img>` is deceptively simple to use badly — this lesson focuses heavily on `alt` text, which is far more important than most beginners realize, connecting directly to accessibility (Module 07) and SEO.

---

# The Basic Image Element

```html
<img src="photo.jpg" alt="A golden retriever running on a beach">
```

`<img>` is a void element (Module 01, Lesson 03) — no closing tag. Two attributes matter above all others:
- **`src`** — the image's file path (relative or absolute, per Lesson 01).
- **`alt`** — alternative text describing the image.

---

# Why `alt` Text Actually Matters

`alt` text is not optional busywork — it serves three genuinely important purposes:

1. **Accessibility** — screen readers read `alt` text aloud, so visually impaired users understand what the image depicts. Without it, an image is either skipped entirely or announced as a meaningless filename.
2. **Fallback** — if an image fails to load (broken link, slow connection), the browser displays the `alt` text in its place.
3. **SEO** — search engines cannot "see" images; `alt` text is how they understand image content, directly affecting image search rankings.

---

# Writing Good Alt Text

**Good:**
```html
<img src="dog.jpg" alt="A golden retriever running on a beach">
```

**Poor:**
```html
<img src="dog.jpg" alt="image">
<img src="dog.jpg" alt="dog.jpg">
<img src="dog.jpg" alt="">  <!-- only acceptable for purely decorative images -->
```

**Guidelines:**
- Describe what's *meaningfully* in the image, concisely — not "picture of" or "image of" (screen readers already announce it's an image).
- Keep it reasonably short — a sentence, not a paragraph.
- For purely decorative images with no informational content (a background flourish, for example), use `alt=""` (empty, but still present) — this explicitly tells screen readers to skip it, rather than reading a distracting filename.

---

# Image Dimensions

```html
<img src="photo.jpg" alt="..." width="600" height="400">
```

Specifying `width` and `height` (even though CSS, Book 03, ultimately controls final display size) helps the browser reserve the correct space *before* the image finishes loading, preventing content from visibly jumping around as images load in — a real, measurable performance/UX improvement.

---

# Captioned Images: `<figure>` and `<figcaption>`

For images that need an associated caption, the semantically correct structure is:

```html
<figure>
  <img src="chart.png" alt="Bar chart showing 40% growth in Q3 2026">
  <figcaption>Figure 1: Quarterly revenue growth, 2026</figcaption>
</figure>
```

`<figure>` groups the image and its caption as one semantic unit; `<figcaption>` provides the caption text. This is the correct answer to the "bonus" exercise from Module 02 — now you know exactly what those elements are for.

---

# Practical Example

```html
<figure>
  <img src="team-photo.jpg" alt="The dev-atlas team celebrating the Book 01 launch" width="800" height="450">
  <figcaption>The team celebrating Book 01's completion, August 2026.</figcaption>
</figure>

<img src="divider-flourish.png" alt="" width="100" height="20">
```

---

# Revision Questions

1. Name the three purposes `alt` text serves.
2. When is `alt=""` (empty) the correct choice, and why not simply omit the attribute entirely?
3. What's the relationship between `<figure>` and `<figcaption>`?

<details><summary>Answers</summary>

1. Accessibility (screen readers), fallback (if the image fails to load), and SEO (search engines understanding image content).
2. For purely decorative images with no informational content — an empty `alt=""` explicitly tells screen readers to skip the image entirely, whereas omitting `alt` altogether can cause screen readers to announce the filename instead, which is worse.
3. `<figure>` is a semantic container grouping an image (or other content) together with its caption; `<figcaption>` provides that caption text within it.

</details>
EOF