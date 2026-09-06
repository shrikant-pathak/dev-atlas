# Lesson 05: Capstone Project — Styling Your HTML Portfolio

## Learning Objectives
By the end of this project, you will be able to:
- Apply the full range of CSS covered across all 13 modules to a real, complete project.
- Architect a multi-file stylesheet using the organizational principles from Lesson 02.
- Make deliberate, justified decisions about layout, responsiveness, accessibility, and performance in a real codebase, rather than in isolated lesson examples.

---

# Introduction

This is it — the project this entire book has been building toward. You'll take the HTML portfolio built in Book 02 and give it a complete, professional visual design, using genuinely every major concept from Modules 01 through 13. This lesson is deliberately less prescriptive than previous lessons: it's a project brief and checklist, not a step-by-step tutorial, because the whole point is applying what you already know independently.

---

# The Brief

Style your Book 02 HTML portfolio into a polished, responsive, accessible personal site. There's no single "correct" visual design — the goal is demonstrating genuine command of the techniques below, not matching a specific reference image.

---

# Required Techniques Checklist

Organize your stylesheet using the folder structure and BEM naming from Lessons 01–02, and make sure your finished project demonstrably includes:

**Foundations (Modules 01–05)**
- [ ] A deliberate reset/normalize base, and a clear cascade/specificity strategy (recall Module 01)
- [ ] A defined color and typography system, ideally as custom properties (Modules 02 & 12)
- [ ] Correct, intentional use of the box model, including `box-sizing: border-box` globally (Module 03)
- [ ] Meaningful use of pseudo-classes/elements and combinators, not just classes for everything (Module 04)
- [ ] A deliberate positioning strategy — at least one `sticky` or `fixed` element used purposefully (Module 05)

**Layout (Modules 06–07)**
- [ ] At least one Flexbox-based component (e.g., a navbar or card row) (Module 06)
- [ ] At least one Grid-based layout (e.g., a project gallery or page skeleton with named areas) (Module 07)

**Responsiveness (Module 08)**
- [ ] A mobile-first stylesheet structure
- [ ] At least one use of `clamp()` for fluid typography
- [ ] Responsive images using `srcset` or `<picture>`, and `aspect-ratio` to prevent layout shift

**Visual Polish (Module 09)**
- [ ] A background gradient or layered background somewhere
- [ ] Thoughtful use of `box-shadow` for depth
- [ ] At least one CSS counter (e.g., numbered project entries)

**Components (Module 10)**
- [ ] A complete, accessible button system with all interactive states
- [ ] A responsive navigation bar with a mobile collapse pattern
- [ ] A styled contact form with real-time validation feedback

**Motion (Module 11)**
- [ ] At least one `transition` on an interactive element
- [ ] At least one `@keyframes` animation used purposefully (not just decoratively)

**Modern CSS (Module 12)**
- [ ] Custom properties used for theming (bonus: a working dark mode toggle)
- [ ] At least one use of `:has()` or native CSS nesting
- [ ] A `prefers-reduced-motion` fallback for your animations

**Architecture & Performance (Module 13)**
- [ ] A component-scoped, ITCSS-ordered file structure
- [ ] A final pass checking for and removing any genuinely unused CSS

---

# A Suggested (Not Mandatory) File Structure

Recall Lesson 02's structure directly, applied to this specific project:

styles/
├── base/
│ ├── variables.css
│ ├── reset.css
│ └── typography.css
├── layout/
│ ├── header.css
│ └── grid.css
├── components/
│ ├── navbar.css
│ ├── button.css
│ ├── card.css
│ ├── form.css
│ └── footer.css
├── utilities/
│ └── visually-hidden.css
└── main.css


---

# A Worked Fragment: Tying Several Modules Together

```css
/* base/variables.css */
:root {
  --primary: #4a90d9;
  --text: #1a1a2e;
  --bg: #ffffff;
  --gutter: clamp(1rem, 4vw, 3rem);
}

/* components/card.css */
.project-card {
  background: var(--bg);
  padding: var(--gutter);
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.1);
  transition: transform 0.2s ease;

  &:hover {
    transform: translateY(-4px);
  }

  &__image {
    width: 100%;
    aspect-ratio: 16 / 9;
    object-fit: cover;
  }
}

@media (prefers-reduced-motion: reduce) {
  .project-card {
    transition: none;
  }
  .project-card:hover {
    transform: none;
  }
}
```

Notice how many modules a single, realistic component fragment touches: custom properties and `clamp()` (Module 12/08), BEM naming and native nesting (Modules 01/12), `box-shadow` (Module 09), `aspect-ratio` and `object-fit` (Module 08/03), `transition` (Module 11), and `prefers-reduced-motion` (Module 12) — this is genuinely what real, production CSS looks like: many small techniques from across an entire curriculum, applied together in service of one component.

---

# Final Review Pass

Before considering the capstone complete, revisit it with the perspective of Lesson 03 (performance) and Module 12's accessibility patterns specifically:

- Does anything animate `width`/`top`/`margin` that could instead use `transform`?
- Do all interactive elements have visible `:focus-visible` states?
- Does every image have proper `alt` text (recall this connects back to Book 02, HTML) and a reserved `aspect-ratio`?
- Would the layout survive a `prefers-reduced-motion: reduce` setting gracefully?

---

# Closing Note

There are no revision questions or a quiz for this lesson — the finished, working project *is* the assessment. Completing this checklist against your real portfolio is the genuine capstone of Book 03, and marks you ready to move on to Book 04 — JavaScript.
