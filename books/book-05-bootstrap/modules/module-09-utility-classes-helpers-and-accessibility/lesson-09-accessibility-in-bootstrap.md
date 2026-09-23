# Lesson 09: Accessibility in Bootstrap

## Learning Objectives
- Consolidate the accessibility patterns used throughout this entire book into one coherent mental model
- Understand Bootstrap's accessibility philosophy: styled defaults, but developer responsibility for correct markup
- Recognize the recurring ARIA/attribute patterns across components
- Know where to verify accessibility (automated tools vs. manual keyboard/screen-reader testing)

## Introduction
This closes out Module 09 — and the book's utility/accessibility coverage — by deliberately looking backward rather than introducing new components. Nearly every lesson since Module 05 has included an accessibility detail in passing; this lesson's job is to name the handful of *patterns* underneath all of those specific details, so you carry forward principles rather than a long, disconnected list of memorized attributes.

## Bootstrap's Accessibility Philosophy
It's worth being precise about what Bootstrap does and doesn't guarantee: Bootstrap ships accessible CSS defaults (sufficient color contrast in its theme palette, visible focus states, reasonable touch target sizing) and, where JavaScript is involved, automatically manages certain ARIA state attributes (`aria-expanded`, `aria-selected`) as components open/close. What Bootstrap does NOT do automatically is guarantee your markup is semantically correct or that you've supplied the attributes it depends on — `aria-label`, `for`/`id` pairings, `alt` text, and `role` attributes are still entirely your responsibility to write correctly. A component can use every correct Bootstrap class and still be inaccessible if the surrounding markup and required attributes are wrong or missing.

## The Recurring Patterns, Named
Across this entire book, you've actually only been using a small number of distinct accessibility mechanisms, repeatedly:

1. **Label association** (`for`/`id`) — Module 05, every form control. Screen readers need this to announce which label belongs to which field.
2. **State syncing** (`aria-expanded`, `aria-selected`, `aria-current`) — navbar toggler, tabs, accordion, pagination, breadcrumb. Tells assistive tech which item/state is currently active; Bootstrap's JS manages these automatically for JS-driven components.
3. **Hidden-but-announced text** (`.visually-hidden`) — icon-only buttons, notification counts, spinner labels. Content essential for screen readers but redundant for sighted users who have a visual equivalent.
4. **Live region announcement** (`role="alert"`, `role="status"`, `aria-live`) — alerts, toasts, spinners. Tells screen readers to announce content that can appear without direct user interaction.
5. **Landmark labeling** (`aria-label` on `<nav>`) — navbar vs. breadcrumb vs. pagination, all technically `<nav>` elements needing distinguishing labels.
6. **Focus management** — `tabindex="-1"` (removing from tab order, or making programmatically focusable), `.focus-ring`/`:focus-visible` (visible indication), modal focus trapping.
7. **Semantic structure** (`role="tablist"/"tab"/"tabpanel"`, `<ol>` for breadcrumbs) — establishing relationships between elements that classes alone don't convey.

Every accessibility detail across Modules 05–09 is an instance of one of these seven patterns — recognizing which pattern a new, unfamiliar component needs is far more useful than memorizing attributes component-by-component.

## Verifying Accessibility: Automated Tools vs. Manual Testing
Automated tools (like axe DevTools or Lighthouse's accessibility audit) catch a meaningful subset of issues — missing `alt` text, insufficient color contrast, missing form labels — but they fundamentally cannot verify whether an experience actually makes sense to a real screen reader user or keyboard-only user, since that requires genuine interaction, not static analysis. The most reliable manual checks, doable on any component in this book:
- **Tab through the entire page using only the keyboard** — can you reach and activate every interactive element, and is focus always visibly indicated?
- **Turn on a screen reader** (VoiceOver on Mac, NVDA on Windows) and navigate a component — does what's announced actually make sense out of context?

Automated tools should be a first-pass filter, not a substitute for either of these manual checks.

## Practical Example
An accessibility review checklist applied to a single hypothetical component — a dropdown-triggered settings menu — walking through all seven patterns:

```html
<!-- 1. No standalone form label needed here, but... -->
<div class="dropdown">
  <button class="btn btn-outline-secondary dropdown-toggle" type="button" 
          data-bs-toggle="dropdown" aria-expanded="false"> <!-- 2. state syncing -->
    <span class="visually-hidden">Open</span> Settings <!-- 3. hidden-but-announced (if icon-only, otherwise skip) -->
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="#">Profile</a></li>
    <li><a class="dropdown-item disabled" aria-disabled="true">Billing (unavailable)</a></li>
  </ul>
</div>
<!-- 6. focus management: handled automatically by Bootstrap's dropdown JS -->
```

## Revision Questions

<details>
<summary>1. What does Bootstrap guarantee automatically regarding accessibility, and what remains the developer's responsibility?</summary>
Bootstrap ships accessible CSS defaults and auto-manages certain ARIA state attributes for its own JS-driven components; correct semantic markup, `aria-label` text, `for`/`id` pairings, `alt` text, and `role` attributes remain entirely the developer's responsibility to supply correctly.
</details>

<details>
<summary>2. Name the seven recurring accessibility patterns identified in this lesson.</summary>
Label association, state syncing, hidden-but-announced text, live region announcement, landmark labeling, focus management, and semantic structure.
</details>

<details>
<summary>3. Why can't automated accessibility tools alone verify that a page is fully accessible?</summary>
They catch a meaningful subset of static issues (missing alt text, contrast, missing labels) but can't verify whether an experience genuinely makes sense to a real screen reader or keyboard-only user, which requires actual manual interaction rather than static analysis.
</details>

<details>
<summary>4. What are the two most reliable manual accessibility checks recommended in this lesson?</summary>
Tabbing through the entire page using only the keyboard to confirm every interactive element is reachable and visibly focused, and navigating a component with an actual screen reader (VoiceOver or NVDA) to confirm announcements make sense out of context.
</details>
