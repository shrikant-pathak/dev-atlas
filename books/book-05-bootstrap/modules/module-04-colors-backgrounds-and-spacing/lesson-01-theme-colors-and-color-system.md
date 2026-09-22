# Lesson 01: Theme Colors and the Color System

## Learning Objectives
- Understand Bootstrap's theme color palette (`primary`, `secondary`, `success`, `danger`, `warning`, `info`, `light`, `dark`)
- Apply theme colors to text, backgrounds, borders, and components using utility and contextual classes
- Understand how Bootstrap 5.3+ CSS variables (`--bs-primary`, etc.) expose the color system for customization
- Know when to use a semantic color name (`success`) vs. a raw color value

## Introduction
Back in Module 03 (Typography and Content) you worked with text utilities like `.text-muted` and `.fw-bold` to control how text looks. Bootstrap's color system builds directly on that idea, but instead of one-off styling choices, it gives you a small, consistent **palette** of named colors that every component in the framework understands. When you write `.btn-primary`, `.text-danger`, or `.bg-success`, you're not guessing at a hex code — you're referencing the same named color across buttons, alerts, badges, borders, and backgrounds.

This consistency is the whole point. In plain CSS (Module 05 of Book 03), if you wanted a "danger" red, you'd hardcode `#dc3545` in a dozen places and hope you didn't typo it. Bootstrap centralizes that color once and lets you apply it everywhere through class names or CSS variables.

## The Eight Theme Colors
Bootstrap ships eight semantic colors by default:

| Name | Purpose | Default hex |
|---|---|---|
| `primary` | Main brand/action color | `#0d6efd` |
| `secondary` | Muted, secondary emphasis | `#6c757d` |
| `success` | Positive actions/messages | `#198754` |
| `danger` | Errors, destructive actions | `#dc3545` |
| `warning` | Caution, non-critical alerts | `#ffc107` |
| `info` | Neutral, informational messages | `#0dcaf0` |
| `light` | Light backgrounds/surfaces | `#f8f9fa` |
| `dark` | Dark backgrounds/surfaces | `#212529` |

These names show up as suffixes across almost every Bootstrap component: `.btn-success`, `.alert-warning`, `.badge-info`, `.border-danger`, `.bg-light`. Once you learn the eight names, you already know how to theme most of the framework.

## CSS Variables Behind the Scenes
Since Bootstrap 5.3, every theme color is also exposed as a root-level CSS custom property:

```css
:root {
  --bs-primary: #0d6efd;
  --bs-danger: #dc3545;
  /* ...and so on for each theme color */
}
```

This matters for two reasons you'll use later in this book:
1. **Customization (Module 11 — Sass & Build):** you can override these variables (or the Sass source variables that generate them) to re-theme the entire framework without touching component markup.
2. **Dark mode (Module 10):** Bootstrap swaps these variable values based on `data-bs-theme="dark"`, which is how the same class names produce different visuals in light vs. dark mode.

You can reference a theme variable directly in custom CSS:

```css
.my-custom-banner {
  background-color: var(--bs-primary);
  color: var(--bs-light);
}
```

This is the same pattern you used with native CSS custom properties in Module 12 of Book 03 (Advanced & Modern CSS) — Bootstrap just pre-populates a useful set of them for you.

## Applying Theme Colors
Theme colors surface in three main ways:

**1. Component variants** — most components accept a color suffix:
```html
<button class="btn btn-primary">Primary Action</button>
<span class="badge bg-danger">3 errors</span>
<div class="alert alert-warning">Check your input</div>
```

**2. Text color utilities** — `.text-{color}`:
```html
<p class="text-success">Saved successfully.</p>
<p class="text-danger">Something went wrong.</p>
```

**3. Background utilities** — `.bg-{color}`, often paired with a matching text color for contrast:
```html
<div class="bg-dark text-white p-3">Dark panel</div>
<div class="bg-info text-dark p-3">Info panel</div>
```

Notice the pairing in that last example — `bg-info` is a light cyan, so it needs `text-dark` for readable contrast, while `bg-dark` needs `text-white`. Bootstrap doesn't automatically pick a contrasting text color for you (outside of a few specific components), so you're responsible for pairing background and text sensibly.

## Practical Example
A status dashboard card using the theme color system end to end:

```html
<div class="card" style="width: 18rem;">
  <div class="card-header bg-primary text-white">
    Server Status
  </div>
  <div class="card-body">
    <p class="card-text">
      <span class="badge bg-success">Online</span>
      API Gateway
    </p>
    <p class="card-text">
      <span class="badge bg-warning text-dark">Degraded</span>
      Search Service
    </p>
    <p class="card-text">
      <span class="badge bg-danger">Down</span>
      Payment Processor
    </p>
  </div>
</div>
```

Every color decision here — the header, the three badges — pulls from the same eight-color palette, so the whole card reads consistently without a single custom hex code.

## Revision Questions

<details>
<summary>1. What are Bootstrap's eight default theme colors?</summary>
primary, secondary, success, danger, warning, info, light, dark.
</details>

<details>
<summary>2. What CSS variable would you use to reference the "success" theme color directly in custom CSS?</summary>
`var(--bs-success)`.
</details>

<details>
<summary>3. Why doesn't `bg-info` automatically give you readable text?</summary>
Bootstrap's background utilities only set the background color — they don't calculate or apply a contrasting text color for you, so you must pair `bg-info` with an appropriate text utility like `.text-dark` yourself.
</details>

<details>
<summary>4. Which two later modules in this book depend directly on understanding CSS variables like `--bs-primary`?</summary>
Module 10 (Dark Mode and Color Modes) and Module 11 (Customization, Sass Build and RTL).
</details>
