# Lesson 02: `<svg>` Basics

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what SVG is and how it fundamentally differs from `<canvas>`.
- Write and embed basic SVG shapes directly in HTML.
- Understand why SVG is generally preferred for icons and logos.

---

# Introduction

This lesson covers SVG — genuinely the more commonly used graphics technology for most everyday web development needs, and importantly, one that produces real, inspectable HTML elements rather than raw pixels like canvas.

---

# What Is SVG?

**SVG (Scalable Vector Graphics)** is an XML-based format for describing 2D graphics using shapes and paths, rather than pixels. Unlike canvas, SVG content becomes *actual elements in the DOM* — each shape is a real, individually addressable element that CSS can style and JavaScript can manipulate directly.

```html
<svg width="200" height="200" viewBox="0 0 200 200">
  <circle cx="100" cy="100" r="80" fill="blue" />
</svg>
```

This renders a blue circle — but unlike canvas, that circle is a genuine `<circle>` element sitting in the DOM, inspectable in DevTools (Book 01, Module 06) just like any other HTML element.

---

# Common SVG Shape Elements

```html
<svg width="300" height="200">
  <rect x="10" y="10" width="100" height="60" fill="green" />
  <circle cx="200" cy="50" r="40" fill="red" />
  <line x1="10" y1="150" x2="290" y2="150" stroke="black" stroke-width="2" />
  <text x="10" y="190">SVG Text</text>
</svg>
```

- `<rect>` — rectangle
- `<circle>` — circle
- `<line>` — straight line
- `<text>` — text content
- `<path>` — the most powerful and flexible element, drawing arbitrary complex shapes using a compact coordinate syntax (the foundation of most real-world icons and logos, though the syntax itself is beyond this introductory lesson)

---

# Why "Scalable" Matters

SVG graphics are defined mathematically (coordinates and paths), not as a fixed grid of pixels — meaning they scale to *any* size with zero quality loss, unlike a raster image (JPEG/PNG, Module 03) which visibly pixelates when scaled up:

```html
<svg width="500" height="500" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="40" fill="blue" />
</svg>
```
This circle renders crisply whether displayed at 20px or 2000px — genuinely important for the multi-device, multi-resolution reality of modern web development (recall responsive images, Module 03, Lesson 04 — SVG sidesteps that entire problem for vector-appropriate content).

---

# SVG vs. Canvas: When to Use Which

| | SVG | Canvas |
|---|---|---|
| Output | Real DOM elements | Raw pixels |
| Scalability | Infinite, no quality loss | Fixed resolution |
| Accessibility | Can be made accessible (real elements) | Requires manual fallback content |
| CSS styling | Yes, directly | No (only via JS redraw) |
| Best for | Icons, logos, illustrations, simple UI graphics | Games, complex animations, pixel manipulation, data-heavy visualizations |

**General rule:** if it's a relatively simple graphic (icon, logo, illustration) that needs to scale and be styleable/accessible, use SVG. If it's genuinely complex, pixel-level, or performance-critical (games, particle effects), canvas is the better fit.

---

# SVG Icons: The Modern Standard

Icons on modern websites are overwhelmingly SVG rather than image files (PNG icons, or old icon fonts) — because they scale perfectly, can be recolored directly with CSS (`fill`, `stroke`), and are lightweight, real DOM elements:

```html
<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
  <path d="M12 2L2 7l10 5 10-5-10-5z" />
</svg>
```

You'll encounter SVG icons constantly once you reach Book 09 (React), where icon libraries are almost universally SVG-based components.

---

# Practical Example

```html
<svg width="100" height="100" viewBox="0 0 100 100">
  <circle cx="50" cy="50" r="45" fill="none" stroke="#3498db" stroke-width="5" />
  <text x="50" y="55" text-anchor="middle" font-size="14">Dev</text>
</svg>
```

---

# Revision Questions

1. What's the fundamental difference between SVG and canvas in terms of what ends up in the DOM?
2. Why does SVG scale without quality loss, while a raster image (PNG/JPEG) doesn't?
3. When would you generally choose canvas over SVG?

<details><summary>Answers</summary>

1. SVG produces real, individually addressable DOM elements; canvas produces raw, non-inspectable pixels with no underlying element structure.
2. Because SVG shapes are defined mathematically (coordinates and paths) rather than as a fixed grid of pixels, so they can be recalculated and rendered crisply at any size.
3. For genuinely complex, pixel-level, or performance-critical graphics — games, particle effects, or data-heavy visualizations with huge numbers of elements — where SVG's DOM-element-per-shape approach would become a performance bottleneck.

</details>
