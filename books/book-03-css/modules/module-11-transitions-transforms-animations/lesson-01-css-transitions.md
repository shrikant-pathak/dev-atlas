# Lesson 01: CSS Transitions

## Learning Objectives
By the end of this lesson, you will be able to:
- Write `transition` using its full shorthand (property, duration, timing-function, delay).
- Understand which CSS properties are actually animatable.
- Transition multiple properties independently on one element.

---

# Introduction

You've already used `transition` in previews throughout Module 10 — button hovers, tooltip fades, modal opacity. This lesson formalizes exactly how it works, since a genuinely surprising number of transition bugs come from misunderstanding what it can and can't animate.

---

# The Four-Part Shorthand

```css
.btn {
  transition: background-color 0.3s ease-in-out 0.1s;
}
```

`transition: PROPERTY DURATION TIMING-FUNCTION DELAY;`

- **Property** — which CSS property to animate (or `all`, though naming specific properties is generally better practice).
- **Duration** — how long the transition takes (`0.3s`, `300ms`).
- **Timing-function** — the acceleration curve (`ease`, `linear`, `ease-in`, `ease-out`, `ease-in-out`, or a custom `cubic-bezier()`).
- **Delay** *(optional)* — how long to wait before starting.

Only the first two (property and duration) are required; timing-function defaults to `ease`, delay defaults to `0s`.

---

# What Can Actually Be Transitioned?

Worth stating plainly, since it trips people up constantly: **not every CSS property can be transitioned.** Only properties with a meaningful "in-between" state qualify — numeric values, colors, and lengths transition smoothly; keyword-only properties (like `display`) jump instantly with no in-between frame possible.

```css
/* These CAN transition smoothly: */
transition: opacity 0.3s, transform 0.3s, background-color 0.3s, width 0.3s;

/* This CANNOT meaningfully transition: */
transition: display 0.3s; /* has no effect — display jumps instantly */
```

Recall Module 10, Lesson 07's modal — this exact limitation is why that lightbox used `opacity`/`visibility` instead of `display` for its fade effect.

---

# Transitioning Multiple Properties Independently

```css
.card {
  transition: transform 0.2s ease, box-shadow 0.3s ease-out;
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0,0,0,0.15);
}
```

Comma-separated transition declarations let each property run on its own duration and curve — here, the lift (`transform`) is quick and snappy while the shadow (`box-shadow`) grows in slightly slower, producing a more polished, layered feel than if both animated identically.

---

# Timing Functions Compared

```css
.linear    { transition-timing-function: linear; }      /* constant speed throughout */
.ease-in   { transition-timing-function: ease-in; }     /* starts slow, speeds up */
.ease-out  { transition-timing-function: ease-out; }    /* starts fast, slows down */
.ease-in-out { transition-timing-function: ease-in-out; } /* slow at both ends */
```

**Practical rule of thumb:** `ease-out` tends to feel the most natural for elements entering or appearing (they arrive with a satisfying settle), while `ease-in` suits elements exiting — genuinely worth trying a few side by side in the browser to build intuition, since the difference is subtle in isolation but noticeable in a live interface.

---

# `transition-delay` — Staggering Effects

```css
.item:nth-child(1) { transition-delay: 0s; }
.item:nth-child(2) { transition-delay: 0.1s; }
.item:nth-child(3) { transition-delay: 0.2s; }
```

Recall `:nth-child()` from Module 04 — combining it with a per-item delay produces a "staggered" reveal effect, where a list of items animates in sequence rather than all at once.

---

# Practical Example: A Polished Hover Card

```html
<div class="card">
  <h3>Feature Title</h3>
  <p>A short description.</p>
</div>
```
```css
.card {
  padding: 1.5rem;
  border-radius: 8px;
  background: white;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: transform 0.25s ease-out, box-shadow 0.25s ease-out;
}

.card:hover {
  transform: translateY(-6px);
  box-shadow: 0 12px 24px rgba(0,0,0,0.15);
}
```

Recall `transform` is previewed here and covered fully in Lesson 02 — the card lifts and its shadow deepens together on hover, smoothly reversing back to its resting state the moment the mouse leaves, all handled declaratively with no JavaScript.

---

# Revision Questions

1. What are the four parts of the `transition` shorthand, in order, and which two are required?
2. Why can't `display` be meaningfully transitioned?
3. What's a practical rule of thumb for choosing `ease-in` vs. `ease-out`?

<details><summary>Answers</summary>

1. Property, duration, timing-function, delay — property and duration are required; timing-function defaults to `ease` and delay defaults to `0s`.
2. `display` is a keyword-only property with no meaningful "in-between" value the browser can interpolate — it simply jumps instantly from one value to the other.
3. `ease-out` (starts fast, slows down) tends to feel natural for elements entering/appearing; `ease-in` (starts slow, speeds up) tends to suit elements exiting.

</details>
