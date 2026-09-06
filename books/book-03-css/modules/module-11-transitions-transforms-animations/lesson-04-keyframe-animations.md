# Lesson 04: Keyframe Animations

## Learning Objectives
By the end of this lesson, you will be able to:
- Define an animation sequence using `@keyframes`.
- Apply it with the `animation` shorthand and its individual sub-properties.
- Explain why `transform` and `opacity` are preferred for performant animation.

---

# Introduction

`transition` (Lesson 01) only handles a simple state A → state B change, triggered by something like `:hover`. `@keyframes` unlocks genuinely more complex, multi-step, self-running animation sequences — a spinner rotating continuously, a notification badge pulsing, an element bouncing in — independent of any user interaction trigger.

---

# Defining a Keyframe Sequence

```css
@keyframes pulse {
  0%   { transform: scale(1); }
  50%  { transform: scale(1.1); }
  100% { transform: scale(1); }
}
```

Each percentage represents a point in the animation's timeline — `0%` is the start, `100%` is the end, and any percentages between define intermediate states the browser interpolates smoothly between. `from`/`to` are also valid as aliases for `0%`/`100%` specifically.

---

# Applying an Animation

```css
.badge {
  animation: pulse 2s ease-in-out infinite;
}
```

`animation: NAME DURATION TIMING-FUNCTION ITERATION-COUNT;` — this shorthand mirrors `transition`'s structure (Lesson 01) but references a named `@keyframes` sequence instead of a single property, and adds `infinite` here to loop forever rather than running once.

---

# The Full Set of animation Sub-Properties

```css
.element {
  animation-name: pulse;
  animation-duration: 2s;
  animation-timing-function: ease-in-out;
  animation-delay: 0.5s;
  animation-iteration-count: infinite; /* or a specific number, e.g. 3 */
  animation-direction: alternate;      /* reverses on every other iteration */
  animation-fill-mode: forwards;       /* keeps the final keyframe's styles after it ends */
}
```

- **`animation-direction: alternate`** — genuinely useful for a pulse or breathing effect, since it plays forward then backward on alternating loops rather than always snapping back to `0%` abruptly.
- **`animation-fill-mode: forwards`** — without this, an element visually reverts to its pre-animation styles the instant a non-looping animation ends; `forwards` keeps whatever the final keyframe declared.

---

# Multi-Step Animations

```css
@keyframes bounce-in {
  0%   { transform: translateY(-50px); opacity: 0; }
  60%  { transform: translateY(10px);  opacity: 1; }
  80%  { transform: translateY(-5px); }
  100% { transform: translateY(0); }
}

.toast {
  animation: bounce-in 0.5s ease-out forwards;
}
```

Genuinely more expressive than `transition` allows — this sequence overshoots slightly past its resting position (`60%` to `80%`) before settling, producing a much livelier "bounce" feel than a plain linear or eased single-step move ever could.

---

# Why `transform` and `opacity` Are the Preferred Properties to Animate

Worth explaining directly, since it affects real-world performance: animating `transform` and `opacity` can typically be handled by the browser's compositor alone, without triggering a full page layout recalculation (often called "reflow") or repaint. Animating properties like `width`, `top`, `margin`, or `left` instead forces the browser to recompute layout on every single frame of the animation — genuinely more expensive, and the most common cause of animations that visibly stutter or feel janky, especially on lower-powered devices.

**Practical rule:** wherever a design goal can be achieved with `transform`/`opacity` instead of a layout-affecting property, prefer it — e.g., recall `translate()` from Lesson 02 over animating `left`/`top` for movement.

---

# Practical Example: A Loading Spinner

```html
<div class="spinner"></div>
```
```css
.spinner {
  width: 32px;
  height: 32px;
  border: 4px solid #e0e0e0;
  border-top-color: #4a90d9;
  border-radius: 50%;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}
```

A genuinely minimal, classic loading spinner — recall `border-radius: 50%` from Module 03, and note the `@keyframes` here only needs a `to` (100%) state, since the `from` (0%) state is simply the element's own natural, unrotated starting appearance.

---

# Revision Questions

1. What's the key structural difference between `transition` and `@keyframes` in terms of what each can express?
2. What does `animation-fill-mode: forwards` do, and what happens without it?
3. Why are `transform` and `opacity` generally preferred for smoother, more performant animations?

<details><summary>Answers</summary>

1. `transition` handles a simple state A → state B change (typically triggered by something like `:hover`); `@keyframes` defines an arbitrary multi-step sequence with intermediate states, independent of any interaction trigger, and can loop.
2. It keeps the element styled according to the animation's final keyframe after it finishes; without it, the element snaps back to its pre-animation styles the instant a non-looping animation ends.
3. Animating them can typically be handled by the browser's compositor alone without triggering a full layout recalculation ("reflow") on every frame, unlike layout-affecting properties like `width`, `top`, or `margin`, which are far more expensive to animate and more prone to visible stuttering.

</details>
