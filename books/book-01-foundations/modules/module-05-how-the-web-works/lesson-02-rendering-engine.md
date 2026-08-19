# Lesson 02: Rendering Engine

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the step-by-step process a browser uses to turn HTML/CSS into pixels.
- Define the DOM and CSSOM.
- Understand the concepts of the render tree, layout, and paint.

---

# Introduction

When a browser receives raw HTML and CSS text, it doesn't just magically appear as a page. It goes through a well-defined pipeline called the **critical rendering path** — understanding this pipeline is genuinely useful once you start caring about website performance, not just "does it look right."

---

# The Rendering Pipeline

1. **Parse HTML → DOM (Document Object Model)**
   The browser reads the HTML text and builds a tree-like structure of objects representing every element on the page — this tree is the DOM, and it's the same structure JavaScript manipulates when you write code like `document.getElementById(...)`.

2. **Parse CSS → CSSOM (CSS Object Model)**
   Similarly, the browser parses all CSS rules into a tree structure representing styles, including inherited and cascading rules.

3. **Combine DOM + CSSOM → Render Tree**
   The browser merges these two trees into a render tree, containing only the visual elements that will actually be displayed (elements with `display: none` are excluded, for example).

4. **Layout (a.k.a. Reflow)**
   The browser calculates the exact size and position of every element in the render tree, based on the viewport size and CSS box model.

5. **Paint**
   The browser fills in pixels — colors, borders, text, images — based on the calculated layout.

6. **Composite**
   Layers are combined together into the final image displayed on screen, especially relevant for elements with transforms, opacity changes, or fixed positioning.

---

# Why This Matters

Every time JavaScript changes something that affects layout (like resizing an element or adding new content), the browser may need to repeat some or all of this pipeline — this is why excessive DOM manipulation can cause visible lag ("jank") on a page. Later, in performance-focused lessons, you'll learn techniques to minimize unnecessary reflows and repaints.

---

# Visual Summary

HTML ──► DOM ─┐
├──► Render Tree ──► Layout ──► Paint ──► Composite
CSS ──► CSSOM ─┘

---

# Practical Example

Open DevTools → Performance tab → record while interacting with a page → observe "Layout" and "Paint" events appearing in the timeline as the browser recalculates and redraws the page.

---

# Revision Questions

1. What are the DOM and CSSOM, and how do they combine into the render tree?
2. What's the difference between the "layout" and "paint" steps?
3. Why might excessive JavaScript DOM manipulation cause a page to feel laggy?

<details><summary>Answers</summary>

1. The DOM represents the structure of the HTML document as a tree; the CSSOM represents the parsed CSS styles as a tree. They combine into the render tree, which contains only the elements that will actually be visually displayed.
2. Layout calculates the size and position of every element; paint fills in the actual pixels (color, text, borders) based on that layout.
3. Because changes affecting layout can force the browser to repeat the layout and paint steps repeatedly, and doing this too often or inefficiently causes visible stutter/lag on the page.

</details>
