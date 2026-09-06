# Lesson 02: box-shadow & text-shadow

## Learning Objectives
By the end of this lesson, you will be able to:
- Write `box-shadow` with all five of its values, including inset.
- Layer multiple shadows on one element.
- Apply `text-shadow` for depth and legibility effects.

---

# Introduction

Shadows are one of the simplest ways to add real depth and hierarchy to a flat design — a raised card, a pressed button, subtle text legibility over a busy background. Both properties in this lesson share a very similar value syntax, which makes them easy to learn together.

---

# box-shadow Syntax

```css
.card {
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
}
```

`box-shadow: OFFSET-X OFFSET-Y BLUR-RADIUS SPREAD-RADIUS COLOR;`

- **Offset-X** — horizontal shift (positive = right).
- **Offset-Y** — vertical shift (positive = down).
- **Blur-radius** — how soft/spread-out the shadow edge is (0 = sharp edge).
- **Spread-radius** *(optional)* — grows or shrinks the shadow shape before blurring.
- **Color** — usually a semi-transparent `rgba()` or `hsla()` so it blends naturally over any background.

```css
.card {
  box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.2); /* all five values explicit */
}
```

---

# The `inset` Keyword

```css
.pressed-button {
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
}
```

Adding `inset` flips the shadow to render *inside* the element's border, rather than outside it — commonly used to simulate a pressed or recessed appearance, as opposed to the raised look a normal outer shadow suggests.

---

# Layering Multiple Shadows

```css
.card {
  box-shadow:
    0 1px 2px rgba(0, 0, 0, 0.1),
    0 4px 12px rgba(0, 0, 0, 0.1);
}
```

Comma-separated shadows stack, letting you combine a tight, sharp shadow close to the element with a softer, wider one further out — a common technique for producing more realistic, layered depth than a single shadow achieves alone.

---

# text-shadow Syntax

```css
h1 {
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.5);
}
```

`text-shadow: OFFSET-X OFFSET-Y BLUR-RADIUS COLOR;` — notably, no spread-radius value here; text-shadow only takes four values, one fewer than box-shadow.

---

# Common text-shadow Use Cases

```css
/* Subtle depth on a heading */
h1 { text-shadow: 1px 1px 2px rgba(0,0,0,0.2); }

/* Legibility over a busy background image */
.hero-text { text-shadow: 0 2px 6px rgba(0,0,0,0.8); }

/* A simple "glow" effect */
.glow { text-shadow: 0 0 8px #00ffff; }
```

That last example — a glow — uses `0 0` offsets with just a blur radius, letting the shadow radiate evenly around the text in every direction rather than being cast to one side.

---

# Practical Example: A Raised Card Component

```html
<div class="card">
  <h3>Card Title</h3>
  <p>Some content inside the card.</p>
</div>
```
```css
.card {
  background: white;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow:
    0 1px 3px rgba(0, 0, 0, 0.12),
    0 4px 8px rgba(0, 0, 0, 0.08);
  transition: box-shadow 0.2s ease;
}

.card:hover {
  box-shadow:
    0 4px 8px rgba(0, 0, 0, 0.15),
    0 8px 24px rgba(0, 0, 0, 0.12);
}
```

Recall `:hover` from Module 04's pseudo-classes lesson — the shadow intensifies on hover, a genuinely common pattern that reinforces the sense that the card is "lifting" toward the user.

---

# Revision Questions

1. List the five values `box-shadow` can accept, in order.
2. What does the `inset` keyword do?
3. How many values does `text-shadow` take, and which value present in `box-shadow` is missing?

<details><summary>Answers</summary>

1. Offset-X, offset-Y, blur-radius, spread-radius (optional), and color.
2. It renders the shadow inside the element's edges instead of outside, producing a recessed/pressed appearance rather than a raised one.
3. Four values (offset-X, offset-Y, blur-radius, color); it's missing the spread-radius value that `box-shadow` has.

</details>
