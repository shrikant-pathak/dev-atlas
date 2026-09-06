# Lesson 03: CSS Performance

## Learning Objectives
By the end of this lesson, you will be able to:
- Identify CSS patterns that hurt rendering performance.
- Explain the difference between layout, paint, and composite in the render pipeline.
- Apply practical techniques to reduce unnecessary CSS-driven work.

---

# Introduction

Module 11 briefly touched on why `transform`/`opacity` animate more smoothly than `width`/`top`. This lesson generalizes that idea into a full picture of how CSS actually affects rendering performance, and what practical steps reduce unnecessary browser work across a real project.

---

# The Render Pipeline: Layout, Paint, Composite

Every visual change the browser makes to a page passes through some combination of three stages:

- **Layout (a.k.a. "reflow")** — computing the size and position of every affected element. Genuinely the most expensive stage; changing something like `width` or `font-size` can force the browser to recompute layout for large portions of the page.
- **Paint** — filling in the actual pixels (colors, text, shadows, borders) for elements whose appearance changed.
- **Composite** — combining already-painted layers together on the screen, without needing to recompute layout or repaint pixels.

Recall Module 11's guidance directly: `transform` and `opacity` changes can be handled by the compositor alone, skipping the expensive layout and paint stages entirely — which is precisely why they're the preferred properties for smooth animation.

---

# Selector Performance: A Smaller Concern Than You'd Think

Worth being honest and precise here: in modern browsers, selector matching performance (deeply nested selectors, universal selectors, etc.) is rarely the actual bottleneck it was once believed to be — browser engines have become genuinely efficient at this. The far bigger performance factors are the render-pipeline costs above (Layout being the most expensive) and simply the *number and size* of the changes being made, not how cleverly a selector is written.

```css
/* This is not meaningfully slower in a modern browser than a simple class selector: */
.container > div:nth-child(odd) span {
  color: red;
}
```

This is worth internalizing specifically because it's a genuinely common but outdated piece of CSS advice — "avoid nested selectors for performance" is largely a myth today; nested selectors (recall Module 12's native nesting) should be avoided for *maintainability* reasons, not raw runtime performance.

---

# Practical Technique: Avoid Layout Thrashing in Batches

```css
/* Animating box-shadow's blur/spread can be more expensive than opacity/transform */
.card:hover {
  box-shadow: 0 20px 40px rgba(0,0,0,0.3); /* recomputes paint on every frame */
}

/* Often a cheaper alternative for a similar visual effect: */
.card {
  position: relative;
}
.card::after {
  content: "";
  position: absolute;
  inset: 0;
  box-shadow: 0 20px 40px rgba(0,0,0,0.3);
  opacity: 0;
  transition: opacity 0.3s;
}
.card:hover::after {
  opacity: 1;
}
```

Recall `::after` from Module 04 and `opacity` transitions from Module 11 — rather than animating the shadow's own values directly (which requires the browser to repaint the shadow shape on every frame), a pre-rendered shadow layer is faded in/out via `opacity`, letting the compositor handle the transition instead.

---

# Reducing Unused CSS

```css
/* A genuinely common real-world issue: shipping CSS for components that are never used on a given page */
```

Worth mentioning directly: large projects often accumulate CSS for components, pages, or variants that are no longer used, but the file keeps shipping to every visitor regardless. Real-world tooling (build-step "unused CSS" analyzers, covered outside the scope of this book) exists specifically to catch this — but the organizational habits from Lesson 02 (component-scoped files) make it far easier to identify and safely delete dead CSS by hand as well, since each file's scope is clear.

---

# `content-visibility` — Skipping Off-Screen Rendering Work

```css
.long-list-item {
  content-visibility: auto;
  contain-intrinsic-size: 200px; /* estimated size, used before the browser renders it */
}
```

A genuinely modern, high-impact property worth knowing: `content-visibility: auto` tells the browser to skip layout and paint work entirely for elements that are far off-screen, only doing that work once they're about to become visible (e.g., while scrolling). `contain-intrinsic-size` provides an estimated placeholder size so the page doesn't visually jump once the real content is eventually rendered — recall the layout-shift concern from Module 08's `aspect-ratio` lesson, which this property addresses in a related but distinct way, for entire sections rather than individual media elements.

---

# Practical Example: A Performance-Conscious Long List

```css
.list-item {
  content-visibility: auto;
  contain-intrinsic-size: 0 80px;
}

.card {
  transition: transform 0.2s ease; /* compositor-only, not box-shadow directly */
}

.card:hover {
  transform: translateY(-4px);
}
```

Recall `translateY()` from Module 11 — combining `content-visibility` (skipping offscreen work entirely) with `transform`-only hover animation (compositor-friendly) reflects the two biggest, most broadly applicable performance principles from this lesson working together.

---

# Revision Questions

1. Name the three stages of the render pipeline, in order, and which is generally most expensive.
2. Is selector complexity (deep nesting, universal selectors) a major performance concern in modern browsers?
3. What does `content-visibility: auto` do, and what related property is typically paired with it?

<details><summary>Answers</summary>

1. Layout (computing size/position — most expensive), Paint (filling in pixels), Composite (combining already-painted layers — cheapest, handles `transform`/`opacity` changes).
2. Generally no — modern browser engines handle selector matching efficiently; nested/complex selectors should be evaluated for maintainability, not treated as a meaningful runtime performance concern.
3. It skips layout and paint work for off-screen elements until they're about to become visible; it's typically paired with `contain-intrinsic-size`, which provides an estimated placeholder size to prevent layout shift once the real content renders.

</details>
