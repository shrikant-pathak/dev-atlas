# Lesson 05: Borders, Rounded Corners & Border Images

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `border-radius` to create rounded corners and circles.
- Apply different border styles creatively.
- Use `border-image` for decorative, non-solid borders.

---

# Introduction

Lesson 02 covered basic border syntax; this lesson covers making borders genuinely visually interesting — rounded corners (used on nearly every modern website) and decorative image-based borders.

---

# `border-radius`: Rounded Corners

```css
.box {
  border-radius: 10px;
}
```

Rounds all four corners equally. This single property is genuinely one of the most-used visual details in modern web design — from subtly rounded cards to fully circular profile pictures.

**Individual corners:**
```css
.box {
  border-top-left-radius: 20px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 20px;
  border-bottom-left-radius: 5px;
}
```

**Shorthand for individual corners** (same TRouBLe clockwise order from Lesson 02, starting top-left):
```css
.box {
  border-radius: 20px 5px 20px 5px; /* top-left top-right bottom-right bottom-left */
}
```

---

# Creating a Perfect Circle

```css
.avatar {
  width: 100px;
  height: 100px;
  border-radius: 50%;
}
```

Setting `border-radius: 50%` on a perfectly square element (equal width and height) produces a perfect circle — a genuinely common pattern for profile pictures/avatars you'll use constantly.

---

# Elliptical Corners (Two Values Per Corner)

```css
.pill-shape {
  border-radius: 50px / 20px; /* horizontal radius / vertical radius */
}
```

A less common but genuinely useful pattern for creating "pill"-shaped buttons or non-circular oval shapes — the value before the slash controls horizontal curvature, after the slash controls vertical curvature.

---

# Border Styles, Revisited Creatively

Recall Lesson 02's `border-style` values — combined with `border-radius`, different styles produce genuinely different visual effects:

```css
.box-dashed { border: 2px dashed #999; border-radius: 8px; }
.box-double { border: 4px double #333; }
```

`double` in particular renders as two parallel lines with a gap — a distinctive, less commonly seen but genuinely useful decorative option.

---

# `border-image`: Decorative Image-Based Borders

For genuinely custom, non-solid-color border decoration, `border-image` lets you use an actual image (often a small, repeatable graphic) as the border itself:

```css
.decorative-box {
  border: 20px solid transparent;
  border-image: url("border-pattern.png") 30 round;
}
```

- `border: 20px solid transparent` sets the border's *thickness* — `border-image` then fills that space with the actual image instead of a solid color.
- The number (`30`) defines how the image is sliced into sections for each corner/edge.
- `round` (or `stretch`, `repeat`) controls how the image tiles along each edge.

This is a genuinely niche, decorative technique — most real projects use simple solid/dashed borders combined with `border-radius` far more often than `border-image`, but it's worth knowing exists for specific ornate design needs.

---

# Practical Example

```css
.avatar {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  border: 3px solid white;
}

.card {
  border-radius: 12px;
  border: 1px solid #e0e0e0;
}

.pill-button {
  border-radius: 999px; /* a very large value guarantees a full pill shape regardless of element size */
  padding: 10px 24px;
  border: 2px solid #3498db;
}
```

---

# Revision Questions

1. What value of `border-radius` turns a square element into a perfect circle?
2. What does the "pill button" trick (`border-radius: 999px`) rely on to guarantee a fully rounded shape?
3. What does `border-image` let you do that a plain `border-color` cannot?

<details><summary>Answers</summary>

1. `50%`, applied to an element with equal width and height.
2. Using a border-radius value far larger than the element could ever actually need, guaranteeing the corners round out completely regardless of the element's specific height/width.
3. Use an actual image (a custom graphic or pattern) as the border itself, rather than being limited to a single solid color.

</details>
