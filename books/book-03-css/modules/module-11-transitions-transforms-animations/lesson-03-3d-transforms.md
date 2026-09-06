# Lesson 03: 3D Transforms

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `rotateX()`, `rotateY()`, and `translateZ()` to create depth.
- Set up `perspective` correctly for 3D effects to render believably.
- Use `transform-style: preserve-3d` for nested 3D transforms (e.g., a flip card).

---

# Introduction

Lesson 02 covered movement within a flat, two-dimensional plane; this lesson adds a third axis — genuine depth. 3D transforms are what power effects like flip cards, rotating cubes, and parallax-style depth, and they hinge on one property that's easy to forget and instantly breaks the effect if missing: `perspective`.

---

# The Third Axis

```css
.box {
  transform: rotateX(45deg); /* tips forward/backward around a horizontal axis */
  transform: rotateY(45deg); /* swings left/right around a vertical axis */
  transform: translateZ(50px); /* moves toward/away from the viewer */
}
```

Recall 2D `rotate()` from Lesson 02, which is actually shorthand for rotating around the Z-axis (`rotateZ()`) — the axis pointing straight out of the screen at the viewer. `rotateX`/`rotateY` instead rotate around the horizontal/vertical axes lying flat *within* the screen, which is what produces the illusion of depth and tilting.

---

# `perspective` — The Property That Makes 3D Believable

```css
.scene {
  perspective: 800px;
}

.scene .box {
  transform: rotateY(45deg);
}
```

**Without `perspective` set on a parent, 3D transforms render flat** — genuinely one of the most common "3D transform isn't working" bugs. `perspective` defines the simulated distance between the viewer and the Z-plane; smaller values (e.g., `400px`) produce a more extreme, exaggerated 3D effect, while larger values (e.g., `1500px`) produce a subtler, more distant-feeling one.

`perspective` can also be applied inline as part of the `transform` value itself (`transform: perspective(800px) rotateY(45deg);`), but setting it on a parent container is generally preferred when multiple children should share the same consistent 3D "scene."

---

# `perspective-origin`

```css
.scene {
  perspective: 800px;
  perspective-origin: top right; /* default is "center center" */
}
```

Just as `transform-origin` (Lesson 02) moves a 2D pivot point, `perspective-origin` shifts the vantage point the 3D scene is viewed from — useful for effects that should appear to tilt away from a specific corner.

---

# `backface-visibility` — Hiding the Back of a Flipped Element

```css
.card-face {
  backface-visibility: hidden;
}
```

When an element rotates past 90 degrees (e.g., `rotateY(180deg)`), its "back" becomes visible by default — often showing a mirrored, backwards version of its own content, which usually isn't the desired effect. `backface-visibility: hidden` hides the element entirely once it's rotated past that point, essential for building a believable flip card (Practical Example below).

---

# `transform-style: preserve-3d` — Nesting 3D Transforms

```css
.scene {
  perspective: 1000px;
}

.card {
  transform-style: preserve-3d; /* lets children keep their own 3D positioning */
  transition: transform 0.6s;
}

.card.flipped {
  transform: rotateY(180deg);
}
```

By default, a child's 3D transform is flattened into its parent's 2D plane. `transform-style: preserve-3d` tells the browser to keep the 3D space genuinely three-dimensional for nested children — required for effects like a flip card, where a front and back face need to exist at different rotated positions within the same 3D space simultaneously.

---

# Practical Example: A Complete Flip Card

```html
<div class="scene">
  <div class="card">
    <div class="card-face card-front">Front</div>
    <div class="card-face card-back">Back</div>
  </div>
</div>
```
```css
.scene {
  perspective: 1000px;
}

.card {
  position: relative;
  width: 200px;
  height: 280px;
  transform-style: preserve-3d;
  transition: transform 0.6s ease;
}

.card:hover {
  transform: rotateY(180deg);
}

.card-face {
  position: absolute;
  inset: 0;
  backface-visibility: hidden;
}

.card-back {
  transform: rotateY(180deg); /* pre-rotated so it faces "backward" until the card flips */
}
```

Recall `position: absolute` + `inset` from Modules 05 and 10 — the front and back faces stack in the exact same space, the back pre-rotated 180 degrees so it's hidden (via `backface-visibility`) until the whole `.card` rotates to reveal it — a genuinely complete, real 3D flip effect built from properties covered across this entire lesson.

---

# Revision Questions

1. What happens to a 3D transform if no `perspective` is set anywhere in its ancestry?
2. What does `backface-visibility: hidden` do, and why is it essential for a flip card?
3. What does `transform-style: preserve-3d` allow that isn't possible by default?

<details><summary>Answers</summary>

1. It renders flat — the 3D rotation/translation has no visible depth effect without a `perspective` value defining the simulated viewer distance.
2. It hides an element once it's rotated past 90 degrees so its "back" (often a mirrored, backwards view of its content) doesn't show; essential for a flip card so the front face disappears cleanly as the back face rotates into view.
3. It keeps nested children genuinely three-dimensional within their parent's 3D space, rather than flattening their transforms into the parent's 2D plane — required for effects like a flip card where front/back faces exist at different rotated positions simultaneously.

</details>
