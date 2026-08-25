# Lesson 05: Float & Clear

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what `float` does and its original intended purpose.
- Use `clear` and the clearfix pattern to contain floated elements.
- Understand why float is now considered legacy for layout, but still genuinely useful for text wrapping.

---

# Introduction

Before Flexbox (Module 06) and Grid (Module 07) existed, `float` was the primary tool developers used to build multi-column layouts — genuinely important historical context, since you'll still encounter float in older codebases and tutorials, even though it's no longer the recommended approach for layout.

---

# What `float` Actually Does

```css
img {
  float: left;
  margin-right: 15px;
}
```

`float`'s **original, genuine purpose**: letting text wrap naturally around an image, exactly like a newspaper or magazine layout:

```html
<img src="photo.jpg" alt="..." style="float: left; margin-right: 15px;">
<p>This paragraph text will wrap naturally around the floated image, flowing around its right and bottom edges, exactly like text wrapping around a picture in a printed magazine article.</p>
```

This specific use case — genuine text wrapping around an image — is still a perfectly valid, modern use of `float`, and arguably the *only* use case float is still genuinely recommended for today (an even more modern alternative, `shape-outside`, is previewed in Module 12).

---

# The Historical Misuse: Float for Layout

Because floated elements are removed from normal flow (similar to `position: absolute`, but staying within the horizontal flow), developers historically exploited this to build entire multi-column page layouts:

```css
/* The old, now-legacy way to build a 2-column layout */
.sidebar { float: left; width: 25%; }
.main-content { float: left; width: 75%; }
```

**This is now considered outdated** — Flexbox and Grid (Modules 06–07) do this job far more predictably, flexibly, and without the genuine problems float-based layout caused (many of which this very lesson exists to explain).

---

# The Genuine Problem: Container Collapse

A parent container containing only floated children doesn't recognize their height at all — as if they aren't there:

```html
<div class="container">
  <div style="float: left;">Floated content</div>
</div>
```
```css
.container {
  border: 2px solid black; /* this border will collapse to 0 height! */
}
```

The `.container`'s border visually collapses to zero height, because floated children don't contribute to their parent's calculated height — a genuinely confusing, real bug if you don't know this quirk exists.

---

# The Fix: `clear` and the Clearfix Pattern

```css
.clearfix::after {
  content: "";
  display: table;
  clear: both;
}
```

Recall this exact snippet previewed in Module 04, Lesson 02 — applying the `.clearfix` class to a container forces it to properly recognize and contain its floated children's height, restoring normal layout behavior.

**The `clear` property itself:**
```css
.next-element {
  clear: both; /* forces this element below any floated elements before it, left or right */
}
```
`clear: left`, `clear: right`, or `clear: both` — pushes an element down past any floated elements on the specified side(s), preventing unwanted wrapping around them.

---

# Why This Lesson Still Matters Today

Even though float-based layout is legacy, you'll genuinely encounter it in:
- Older codebases and legacy projects you might work on professionally.
- Countless existing tutorials and Stack Overflow answers still using this technique.
- The one remaining valid use case: genuine text-wrapping around images.

Understanding float and its quirks (container collapse, the clearfix fix) means none of this legacy code will feel mysterious when you encounter it.

---

# Practical Example

```css
/* Modern, valid use: text wrapping around an image */
.article-image {
  float: left;
  width: 200px;
  margin: 0 20px 10px 0;
  shape-outside: margin-box; /* preview, Module 12 */
}

/* Legacy pattern, shown for recognition, not recommended for new layouts */
.legacy-sidebar {
  float: left;
  width: 25%;
}
.legacy-main {
  float: left;
  width: 75%;
}
.legacy-container::after {
  content: "";
  display: table;
  clear: both;
}
```

---

# Revision Questions

1. What is `float`'s original, genuinely still-valid use case?
2. Why does a container collapse to zero height when it only contains floated children?
3. What does the clearfix pattern (`::after` with `clear: both`) fix?

<details><summary>Answers</summary>

1. Letting text wrap naturally around an image, similar to a magazine/newspaper layout.
2. Because floated elements are removed from normal document flow in a way that means their height doesn't contribute to their parent container's calculated height.
3. It forces the parent container to properly recognize and contain its floated children's height, preventing the container-collapse problem.

</details>
