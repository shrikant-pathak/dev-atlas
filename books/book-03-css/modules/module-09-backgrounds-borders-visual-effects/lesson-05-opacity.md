# Lesson 05: Opacity

## Learning Objectives
By the end of this lesson, you will be able to:
- Apply `opacity` and understand how it differs from transparent colors.
- Explain why `opacity` affects an entire element, including its children.
- Choose correctly between `opacity` and `rgba()`/`hsla()` for a given use case.

---

# Introduction

This module closes on a deceptively simple property that's actually a common source of real layout bugs once you understand what it does under the hood. `opacity` controls how transparent an *entire element* is — but "entire" is the key word, and it has consequences worth understanding clearly.

---

# Basic Syntax

```css
.faded {
  opacity: 0.5; /* 50% transparent; accepts 0 (invisible) to 1 (fully opaque) */
}
```

Unlike `rgba()`/`hsla()` colors (Module 02), which make *just a color value* partially transparent, `opacity` applies transparency to the *whole rendered element* — background, border, text, and all of its children, uniformly, as a single unit.

---

# The Critical Difference: opacity vs. rgba()

```css
/* opacity: affects the ENTIRE element, including any text/children inside */
.box-a {
  background: black;
  opacity: 0.5;
}

/* rgba(): affects ONLY the background color; text/children stay fully opaque */
.box-b {
  background: rgba(0, 0, 0, 0.5);
}
```

This distinction genuinely trips people up: if `.box-a` contains white text, that text *also* becomes 50% transparent, because `opacity` doesn't distinguish between the element's own styling and its children — everything renders as one semi-transparent unit. `.box-b`'s text, by contrast, remains fully readable, since only the background color itself carries the transparency.

**Rule of thumb:** use `rgba()`/`hsla()` when you want to fade *just a color* (a background, a border); use `opacity` when you genuinely want to fade an *entire element and everything inside it* uniformly (a disabled button, a fading-out modal).

---

# opacity and Layout

```css
.hidden-but-present {
  opacity: 0;
}
```

Setting `opacity: 0` makes an element fully invisible, but — importantly — it still occupies its layout space and remains in the accessibility tree and interactive to clicks/focus, unlike `display: none` (Module 05), which removes an element from layout entirely. This distinction matters for animations: fading an element out with `opacity` (often paired with `transition`, previewed here and covered fully in Module 11) keeps the layout stable during the fade, whereas toggling `display: none` would cause everything else to jump immediately.

---

# opacity and Stacking Context

Recall stacking contexts from Module 05, Lesson 03 — worth flagging here: any element with `opacity` less than 1 creates a new stacking context, exactly like `position` + `z-index` does. This can produce mildly surprising results if a child element has its own `z-index` intended to stack against elements *outside* its semi-transparent parent — the opacity boundary can trap it.

---

# Practical Example: A Disabled Button State

```html
<button class="btn" disabled>Submit</button>
```
```css
.btn {
  background: #4a90d9;
  color: white;
  border: none;
  padding: 0.75rem 1.5rem;
  border-radius: 4px;
}

.btn:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

Recall `:disabled` as a pseudo-class from Module 04 — the entire button, background and text together, uniformly fades to signal its unavailable state; a single `opacity` value handles this far more simply than trying to fade the background and text colors separately with `rgba()`.

---

# Revision Questions

1. What's the key difference between fading an element with `opacity` vs. giving it an `rgba()` background?
2. Does `opacity: 0` remove an element from the page layout? How does that compare to `display: none`?
3. What side effect does setting `opacity` below 1 have, related to a concept from Module 05?

<details><summary>Answers</summary>

1. `opacity` fades the entire element and all of its children uniformly as one unit; `rgba()`/`hsla()` fades only the specific color value it's applied to (e.g., just the background), leaving other content like text fully opaque.
2. No — `opacity: 0` makes the element invisible but it still occupies its layout space and remains interactive; `display: none` removes it from layout entirely, which can cause surrounding elements to shift.
3. It creates a new stacking context, the same concept covered with `position`/`z-index` in Module 05 — this can affect how a child's own `z-index` behaves relative to elements outside the semi-transparent parent.

</details>
