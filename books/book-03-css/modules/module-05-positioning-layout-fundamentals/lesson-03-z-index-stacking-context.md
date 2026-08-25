# Lesson 03: Z-index & Stacking Context

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `z-index` to control which elements visually appear on top.
- Explain what a stacking context is, and why `z-index` sometimes "doesn't work."
- Debug the most common real-world z-index confusion.

---

# Introduction

`z-index` looks simple — "higher number appears on top" — but genuinely confuses developers constantly, because its actual behavior depends on a deeper concept most tutorials skip: the **stacking context**. This lesson covers both.

---

# The Basics: `z-index`

```css
.modal {
  position: relative; /* z-index only has an effect on positioned elements */
  z-index: 10;
}
.overlay {
  position: relative;
  z-index: 5;
}
```

**Critical prerequisite:** `z-index` only has any effect on elements with `position` set to something other than `static` (Lesson 02) — applying `z-index` to a static element does absolutely nothing, a genuinely common beginner mistake.

Given two overlapping positioned elements, the one with the **higher** `z-index` value visually renders on top.

---

# Without Explicit z-index: Stacking Order Defaults

When `z-index` isn't specified, elements stack based on their order in the HTML — later elements in the document render on top of earlier ones, all else being equal.

---

# The Real Complication: Stacking Context

This is genuinely the concept most tutorials skip, and the source of nearly all "why isn't my z-index working" confusion. A **stacking context** is a self-contained "layer" of stacking — `z-index` values are only compared *within the same stacking context*. An element in one stacking context can never visually appear above an element in a *different*, higher-priority stacking context, no matter how enormous its own `z-index` value is set.

**What creates a new stacking context?** Several things, but the most common in everyday CSS:
- The root `<html>` element (always the base stacking context).
- Any positioned element (`relative`/`absolute`/`fixed`/`sticky`) with a `z-index` value set (not `auto`).
- Elements with `opacity` less than 1 (a genuinely surprising, easy-to-forget trigger).
- Elements using `transform`, `filter`, or `will-change` (previews of Modules 11/09).

---

# A Concrete "Why Isn't This Working" Example

```html
<div class="parent-a" style="z-index: 1;">
  <div class="child" style="z-index: 9999;">I want to be on top!</div>
</div>
<div class="parent-b" style="z-index: 2;">
  Some other content
</div>
```

Even though `.child` has an enormous `z-index: 9999`, it can **never** visually appear above `.parent-b`'s content — because `.child`'s `z-index` is only meaningful *within* `.parent-a`'s stacking context, and `.parent-a` (z-index: 1) already lost to `.parent-b` (z-index: 2) at the outer level. A wildly high `z-index` value on a deeply nested element is a genuine, common sign this exact misunderstanding is happening.

---

# The Debugging Mental Model

When `z-index` "isn't working":
1. Confirm the element actually has `position` set to something other than `static`.
2. Check whether a *parent* element has accidentally created its own stacking context (via its own `z-index`, `opacity`, or `transform`) that's constraining your element's maximum possible stacking priority.
3. Use DevTools (Book 01, Module 06) — modern browser DevTools can actually visualize stacking contexts directly in some cases, genuinely useful for this exact debugging scenario.

---

# Practical Example

```css
.site-header {
  position: fixed;
  top: 0;
  z-index: 1000; /* should be one of the highest values on the page */
}

.dropdown-menu {
  position: absolute;
  z-index: 100;
}

.modal-overlay {
  position: fixed;
  z-index: 9999; /* modals typically need the very highest priority */
}
```

---

# Revision Questions

1. What prerequisite must an element have for `z-index` to have any effect at all?
2. What is a "stacking context," and why can a child's massive `z-index` sometimes still lose to a sibling element?
3. Name two CSS properties, besides `position` + `z-index`, that can create a new stacking context.

<details><summary>Answers</summary>

1. It must have `position` set to something other than `static` (i.e., `relative`, `absolute`, `fixed`, or `sticky`).
2. A stacking context is a self-contained layer of z-index comparison; a child's z-index is only compared within its own parent stacking context, so if that parent stacking context itself loses to a sibling stacking context at a higher level, the child can never visually escape above that sibling, regardless of its own z-index value.
3. Any two of: `opacity` less than 1, `transform`, `filter`, `will-change`.

</details>
