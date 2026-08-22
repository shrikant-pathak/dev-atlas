# Lesson 04: Outline

## Learning Objectives
By the end of this lesson, you will be able to:
- Use the `outline` property correctly.
- Explain the key differences between `outline` and `border`.
- Understand why removing default focus outlines carelessly is a genuine accessibility mistake.

---

# Introduction

`outline` looks similar to `border` at first glance, but behaves meaningfully differently — and connects directly to a genuine, common accessibility mistake worth understanding clearly before you start building real interfaces.

---

# Outline Syntax

```css
.box {
  outline: 2px solid red;
}
```

Syntactically identical to border's shorthand (`width style color`) — but functionally different in several important ways.

---

# Outline vs. Border: The Key Differences

1. **Outline doesn't take up space in the box model.** Unlike border (part of the box model, Lesson 01), outline is drawn *outside* the element's box entirely, without affecting layout, spacing, or the element's calculated size at all.

2. **Outline can't have individual sides.** There's no `outline-top`/`outline-left` equivalent — it's always applied to all four sides uniformly.

3. **Outline can follow non-rectangular shapes** in some cases (like elements with `border-radius`, Lesson 05), while border always respects the box's actual rectangular edges.

```css
.box {
  border: 2px solid black;   /* affects layout/spacing */
  outline: 2px solid red;     /* does NOT affect layout/spacing */
}
```

---

# The Most Important Real-World Use: Focus Indicators

By default, browsers automatically apply a visible outline to whatever element currently has **keyboard focus** — recall Book 02, Module 07's accessibility discussion around keyboard navigation (Tab key, no mouse). This default outline is a genuinely critical accessibility feature, letting keyboard-only users see exactly which element they're currently interacting with.

```css
button:focus {
  outline: 3px solid blue;
}
```

---

# The Genuine Mistake: `outline: none`

A common but harmful pattern, purely for aesthetic reasons:

```css
/* Don't do this without a real replacement */
button:focus {
  outline: none;
}
```

Removing the default focus outline without providing any visible alternative genuinely breaks keyboard navigation accessibility — a keyboard-only user loses all visual indication of which element they've tabbed to, connecting directly back to Book 02, Module 07's accessibility principles.

**If you dislike the default outline's appearance, replace it — never simply remove it:**
```css
button:focus {
  outline: none;
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.5); /* custom focus style, a preview of Module 09 */
}
```

---

# `outline-offset`

```css
.box {
  outline: 2px solid red;
  outline-offset: 4px; /* adds a gap between the element's edge and the outline */
}
```

Genuinely useful for custom focus styles that visually sit slightly away from the element itself, rather than flush against its edge.

---

# Practical Example

```css
a, button {
  outline: none; /* removing default appearance */
}

a:focus, button:focus {
  outline: 2px solid #3498db;
  outline-offset: 2px;
  /* A deliberate, visible REPLACEMENT — not simply removed */
}
```

---

# Revision Questions

1. What's the key difference between `outline` and `border` in terms of the box model?
2. Why is the default focus outline a genuinely important accessibility feature?
3. What should you do if you dislike the default focus outline's appearance, rather than just removing it?

<details><summary>Answers</summary>

1. `outline` doesn't take up space in the box model and doesn't affect layout/spacing; `border` is part of the box model and does affect the element's size and surrounding layout.
2. It lets keyboard-only users see exactly which element currently has focus, since they can't rely on a mouse cursor's visual position the way mouse users do.
3. Replace it with an equally visible custom style (like a different-colored outline or a focus-specific box-shadow), never simply remove it with `outline: none` and nothing else.

</details>
