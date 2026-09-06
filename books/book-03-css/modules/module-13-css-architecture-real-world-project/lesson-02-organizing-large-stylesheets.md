# Lesson 02: Organizing Large Stylesheets

## Learning Objectives
By the end of this lesson, you will be able to:
- Split CSS into logical files using a sensible folder structure.
- Explain the ITCSS layering concept for ordering styles by specificity.
- Apply a consistent, scalable approach to organizing a real project's CSS.

---

# Introduction

Lesson 01 solved naming collisions; this lesson addresses the related, larger problem of *file* organization — where does a given rule actually live once a project has hundreds of components, and in what order should files load to avoid specificity conflicts?

---

# A Common Folder Structure

styles/
├── base/
│ ├── reset.css
│ ├── typography.css
│ └── variables.css
├── components/
│ ├── button.css
│ ├── card.css
│ └── navbar.css
├── layout/
│ ├── grid.css
│ └── header.css
├── pages/
│ └── checkout.css
└── main.css


`main.css` typically just imports everything else in a deliberate order:

```css
@import "base/variables.css";
@import "base/reset.css";
@import "base/typography.css";
@import "layout/grid.css";
@import "components/button.css";
@import "components/card.css";
@import "pages/checkout.css";
```

Recall `@import` — genuinely worth noting it has a real performance cost in production (each `@import` can trigger an additional network request unless bundled by a build tool), so this pattern is more common as source organization compiled/bundled into one file before shipping, rather than shipped as literal separate `@import` requests.

---

# The ITCSS Concept: Ordering by Specificity

ITCSS ("Inverted Triangle CSS") is a mental model for *ordering* your stylesheets — not a folder structure specifically, but a principle about what should load first vs. last:

Settings (variables — Lesson 01's Module 12 custom properties, no actual CSS output)
↓
Tools (mixins/functions, if using a preprocessor — Lesson 04)
↓
Generic (resets, box-sizing defaults — very low specificity)
↓
Elements (bare HTML element selectors — h1, a, p — still very low specificity)
↓
Objects (layout patterns — .container, .grid — class selectors, no styling opinions)
↓
Components (actual UI components — .card, .btn — where most of your CSS lives)
↓
Utilities (single-purpose overrides — .text-center, .hidden — deliberately HIGH specificity/priority)


The core idea, worth understanding even if you never adopt ITCSS's exact naming: **order your CSS from broad/generic/low-specificity rules toward narrow/specific/high-specificity ones.** Recall the cascade from Module 01 — loading a highly specific override *before* a more generic rule invites exactly the specificity conflicts and `!important` overrides that make large codebases painful to maintain.

---

# Component-Scoped Files

components/
├── button.css /* only .btn* rules /
├── card.css / only .card* rules /
└── navbar.css / only .navbar* rules */


Recall BEM's Block concept from Lesson 01 — pairing one file per Block is a genuinely natural fit: `card.css` contains `.card`, `.card__title`, `.card--featured`, and nothing else, making it trivial to find, edit, or even delete a component's styles as a complete, self-contained unit.

---

# Avoiding Overly Deep Import Chains

```css
/* Genuinely risky: importing a component file from within another component file */
/* card.css */
@import "button.css"; /* now button and card styles are coupled/order-dependent */
```

Worth flagging as a caution: letting component files import *each other* creates hidden ordering dependencies that become genuinely hard to trace as a project grows. Prefer a single, flat import list in `main.css` (as shown above) over component files importing one another.

---

# Practical Example: Organizing This Book's Own CSS

Given everything covered across Modules 01–13, a realistic structure for a real project's stylesheet might look like:

styles/
├── base/
│ ├── variables.css /* Module 12 custom properties /
│ └── reset.css
├── layout/
│ └── grid.css / Module 07 /
├── components/
│ ├── navbar.css / Module 10 /
│ ├── button.css / Module 10 /
│ ├── card.css / Module 09 + 10 /
│ └── modal.css / Module 10 /
├── utilities/
│ └── visually-hidden.css / Module 12 */
└── main.css


Every file maps cleanly to a concept you've already learned, organized by the ITCSS principle of broad-to-specific loading order.

---

# Revision Questions

1. What core principle does ITCSS's "inverted triangle" actually describe?
2. Why is component-scoped file organization (one file per BEM Block) a natural pairing?
3. Why is it generally discouraged for component CSS files to `@import` each other?

<details><summary>Answers</summary>

1. Ordering stylesheets from broad, generic, low-specificity rules (resets, base element styles) toward narrow, specific, high-specificity rules (components, then utility overrides) to avoid specificity conflicts.
2. Because a BEM Block (e.g. `.card` and all its `__element`/`--modifier` variants) is a self-contained unit, so keeping it in its own file makes that component trivially easy to find, edit, or remove as a whole.
3. It creates hidden ordering dependencies between files that become genuinely hard to trace as a project grows — a flat import list in one main file keeps load order explicit and easy to reason about.

</details>
