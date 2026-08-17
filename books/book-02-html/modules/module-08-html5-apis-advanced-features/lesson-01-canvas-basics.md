cat > lesson-01-canvas-basics.md << 'EOF'
# Lesson 01: `<canvas>` Basics

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what `<canvas>` is and how it differs from other HTML graphics elements.
- Understand the basic concept of drawing programmatically via JavaScript.
- Recognize real-world use cases for canvas.

---

# Introduction

This module covers HTML's more advanced, JavaScript-adjacent features — genuinely useful to know exist now, even though full mastery requires JavaScript (Book 04). `<canvas>` is the first: a blank drawing surface controlled entirely through code.

---

# What Is `<canvas>`?

`<canvas>` is an HTML element that provides a blank rectangular drawing surface, with no built-in appearance of its own — everything drawn on it happens entirely through JavaScript, using the Canvas API:

```html
<canvas id="my-canvas" width="400" height="300"></canvas>
```

By itself, this HTML produces an empty, invisible rectangle — genuinely nothing to see, since `<canvas>` is purely a container waiting for JavaScript instructions.

---

# A Minimal Preview (JavaScript, Book 04 Territory)

Since full canvas usage requires JavaScript, this is just a preview to build intuition — you'll return to this properly once you reach Book 04:

```html
<canvas id="my-canvas" width="400" height="300"></canvas>
<script>
  const canvas = document.getElementById('my-canvas');
  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'blue';
  ctx.fillRect(50, 50, 100, 100); // draws a blue square
</script>
```

`getContext('2d')` retrieves a "drawing context" — an object with methods for drawing shapes, text, and images pixel by pixel. Every pixel drawn is genuinely computed and painted by your code; there's no underlying document structure for the drawn content the way there is for regular HTML elements.

---

# Real-World Uses for Canvas

- **Data visualizations and charts** — many charting libraries render onto canvas for performance with large datasets.
- **Games** — canvas is a common foundation for browser-based 2D games.
- **Image editing tools** — pixel-level manipulation (filters, cropping) happens through canvas.
- **Signature pads** — drawing surfaces for capturing handwritten signatures.
- **Generative art and animations**

---

# An Important Limitation: No Accessible Structure

This connects directly back to Module 07: content drawn on canvas is just pixels — there's no DOM structure for a screen reader to interpret, no text to select, no semantic meaning at all by default. If canvas content is genuinely important/informational (not purely decorative, like a background animation), you're responsible for providing an accessible alternative — commonly, fallback content inside the `<canvas>` tags themselves:

```html
<canvas id="chart" width="400" height="300">
  <p>Bar chart showing quarterly revenue: Q1 $50k, Q2 $62k, Q3 $71k.</p>
</canvas>
```

Browsers that don't support canvas (or assistive technology that can't interpret it) fall back to this text content — mirroring the same fallback pattern you learned for `<video>`/`<audio>` in Module 03.

---

# Canvas vs. Regular HTML/CSS

| | Canvas | Regular HTML/CSS |
|---|---|---|
| Content structure | None — just pixels | Real DOM elements |
| Accessibility | Requires manual fallback content | Native, automatic |
| Performance for many elements | Better (thousands of particles, game sprites) | Can degrade with huge element counts |
| Best for | Graphics, games, data viz | Regular page content |

Canvas is a specialized tool, not a general-purpose replacement for regular HTML content — reach for it specifically when you need pixel-level, programmatic drawing.

---

# Revision Questions

1. What does `<canvas>` provide by itself, before any JavaScript runs?
2. Why does canvas content lack the accessibility that regular HTML elements have by default?
3. Name two real-world use cases for `<canvas>`.

<details><summary>Answers</summary>

1. A blank, empty rectangular drawing surface with no visible appearance — nothing is drawn until JavaScript actively draws onto it.
2. Because canvas content is just rendered pixels with no underlying DOM structure — there's no text, elements, or semantic meaning for a screen reader (or search engine) to interpret.
3. Any two of: data visualizations/charts, browser-based games, image editing tools, signature pads, generative art/animations.

</details>
EOF