# Lesson 03: Buttons Styling

## Learning Objectives
By the end of this lesson, you will be able to:
- Style buttons across all their interactive states (`:hover`, `:active`, `:focus`, `:disabled`).
- Build primary, secondary, and outline button variants.
- Understand why `:focus` styling matters for accessibility.

---

# Introduction

Buttons look simple but have more interactive states than almost any other UI element — a genuinely good exercise in combining pseudo-classes (Module 04), shadows (Module 09), and transitions (previewed here, formalized in Module 11) into one cohesive, polished component.

---

# The Base Button Reset

```css
.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 6px;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  text-decoration: none;
  transition: background 0.2s ease, box-shadow 0.2s ease, transform 0.1s ease;
}
```

Recall `transition` is previewed here and covered fully in Module 11 — listing multiple properties (comma-separated) each with their own duration keeps hover/active feedback feeling responsive without over-animating every property uniformly.

---

# The Four States That Matter

```css
.btn-primary {
  background: #4a90d9;
  color: white;
}

.btn-primary:hover {
  background: #3a7bc8;
}

.btn-primary:active {
  background: #2f65a3;
  transform: scale(0.98); /* a subtle "press" effect */
}

.btn-primary:focus-visible {
  outline: 3px solid #a3c9f1;
  outline-offset: 2px;
}

.btn-primary:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}
```

Recall `:disabled` and `opacity` from Module 09's practical example — each state serves a distinct purpose: `:hover` gives feedback before a click, `:active` confirms the click is registering, `:focus-visible` supports keyboard navigation, and `:disabled` communicates unavailability.

---

# `:focus` vs. `:focus-visible`

Worth explaining specifically: `:focus-visible` (rather than plain `:focus`) is the modern preference for focus rings, because it only shows the outline when the browser determines the focus was likely reached via keyboard navigation — not on every mouse click. This avoids the visually noisy "outline on every click" behavior that led many older sites to remove focus outlines altogether (a genuine accessibility regression), while still supporting keyboard users properly.

---

# Button Variants

```css
/* Secondary: lower visual priority */
.btn-secondary {
  background: #e5e7eb;
  color: #1a1a2e;
}
.btn-secondary:hover { background: #d1d5db; }

/* Outline: transparent fill, colored border */
.btn-outline {
  background: transparent;
  border: 2px solid #4a90d9;
  color: #4a90d9;
}
.btn-outline:hover {
  background: #4a90d9;
  color: white;
}
```

A consistent set of variants — primary (main call to action), secondary (lower priority), outline (tertiary/subtle) — is the standard three-tier button hierarchy found in nearly every real design system.

---

# Practical Example: A Complete Button System

```html
<button class="btn btn-primary">Save Changes</button>
<button class="btn btn-secondary">Cancel</button>
<button class="btn btn-outline">Learn More</button>
<button class="btn btn-primary" disabled>Processing…</button>
```
```css
.btn {
  display: inline-block;
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 6px;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s ease, transform 0.1s ease;
}

.btn-primary { background: #4a90d9; color: white; }
.btn-primary:hover { background: #3a7bc8; }
.btn-primary:active { transform: scale(0.98); }
.btn-primary:disabled { opacity: 0.5; cursor: not-allowed; }

.btn-secondary { background: #e5e7eb; color: #1a1a2e; }
.btn-outline { background: transparent; border: 2px solid #4a90d9; color: #4a90d9; }
```

Four buttons, one shared base class, three visual tiers, and a fully handled disabled state — the realistic shape of a button system in any production codebase.

---

# Revision Questions

1. Name the four interactive states covered in this lesson and what each communicates to the user.
2. Why is `:focus-visible` generally preferred over plain `:focus` for focus outlines?
3. What are the three common button variants, and what does each communicate about priority?

<details><summary>Answers</summary>

1. `:hover` (feedback before clicking), `:active` (confirms the click registered), `:focus-visible` (supports keyboard navigation), `:disabled` (communicates unavailability).
2. `:focus-visible` only shows the outline when focus likely came from keyboard navigation, avoiding an outline appearing on every mouse click while still supporting keyboard accessibility properly.
3. Primary (main call to action), secondary (lower-priority action), and outline (subtle/tertiary action) — a standard three-tier visual hierarchy.

</details>
