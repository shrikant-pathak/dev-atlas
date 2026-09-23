# Lesson 05: Tooltips

## Learning Objectives
- Understand why tooltips require JavaScript initialization, unlike every prior component in this book
- Enable a tooltip with `data-bs-toggle="tooltip"` and manual JS initialization
- Control tooltip placement with `data-bs-placement`
- Use `title` vs. `data-bs-title` and understand HTML content in tooltips
- Know when a tooltip is the wrong choice for conveying information

## Introduction
Every component from Modules 06–08 so far has worked purely through data attributes, with Bootstrap's JS bundle auto-wiring the behavior with zero code written by you. Tooltips (and popovers, in Lesson 06) are the first genuine exception: for performance reasons, Bootstrap does NOT automatically activate every tooltip on a page — you must explicitly initialize them with a small line of JavaScript. This is a deliberate, documented design choice, not an oversight, and it's worth understanding why.

## Why Manual Initialization Is Required
Tooltips (and popovers) use Popper for positioning — the same library from Module 07's dropdowns — and involve continuous position recalculation while visible. If Bootstrap auto-activated every element with `data-bs-toggle="tooltip"` on every page load unconditionally, pages with many tooltips would pay an unnecessary performance cost even for tooltips a user never hovers. So Bootstrap requires you to opt in explicitly:

```html
<button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" 
        data-bs-title="Tooltip text">
  Hover me
</button>

<script>
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  const tooltipList = [...tooltipTriggerList].map(el => new bootstrap.Tooltip(el));
</script>
```

This script pattern — select all matching elements, then instantiate a `new bootstrap.Tooltip()` for each — is standard boilerplate you'll reuse verbatim (swapping the class name) for popovers in Lesson 06.

## Placement
```html
<button data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Top tooltip">Top</button>
<button data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Bottom tooltip">Bottom</button>
<button data-bs-toggle="tooltip" data-bs-placement="left" data-bs-title="Left tooltip">Left</button>
<button data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Right tooltip">Right</button>
```

Just like dropdowns in Module 07, Popper will automatically flip the tooltip's position if the requested placement would push it off-screen — `data-bs-placement` sets a preference, not an absolute guarantee.

## `title` vs. `data-bs-title`
Bootstrap's tooltip reads its text from `data-bs-title` (or, for backward compatibility, a plain `title` attribute). It's worth explicitly noting why NOT to just rely on the native browser `title` attribute alone: native title tooltips are inconsistent in styling, delayed, and inaccessible to touch/keyboard-only users in most browsers — Bootstrap's tooltip component exists specifically to replace that native, inconsistent behavior with something consistent and properly keyboard-focusable.

## HTML Content in Tooltips
By default, tooltip content is treated as plain text for security reasons (to avoid unintentionally rendering user-supplied HTML). To allow HTML content deliberately:

```html
<button data-bs-toggle="tooltip" data-bs-html="true" 
        data-bs-title="<strong>Bold</strong> tooltip content">
  Hover me
</button>
```

Only enable `data-bs-html="true"` for content you fully control — never for anything derived from user input, since that would reopen exactly the security risk plain-text-by-default is meant to prevent.

## When NOT to Use a Tooltip
Tooltips are meant for brief, supplementary hints — not for content essential to completing a task. If information is required to understand or use a control correctly, it belongs in visible text (a `.form-text` helper from Module 05, for instance) rather than hidden behind a hover-only tooltip that touch-only users may never discover.

## Practical Example
An icon button with an initialized tooltip providing supplementary context:

```html
<button type="button" class="btn btn-outline-secondary" data-bs-toggle="tooltip" 
        data-bs-placement="top" data-bs-title="Copies the link to your clipboard">
  Copy link
</button>

<script>
  const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  const tooltipList = [...tooltipTriggerList].map(el => new bootstrap.Tooltip(el));
</script>
```

## Revision Questions

<details>
<summary>1. Why do tooltips require manual JavaScript initialization when every other component so far has worked purely through data attributes?</summary>
For performance reasons — tooltips involve continuous Popper-driven position recalculation while visible, so Bootstrap requires an explicit opt-in rather than auto-activating every tooltip-tagged element on every page load.
</details>

<details>
<summary>2. Why shouldn't you just rely on the native HTML `title` attribute instead of Bootstrap's tooltip component?</summary>
Native title tooltips are inconsistently styled, delayed, and largely inaccessible to touch/keyboard-only users — Bootstrap's tooltip exists specifically to replace that behavior with something consistent and properly focusable.
</details>

<details>
<summary>3. Why is tooltip content treated as plain text by default, and when is it safe to enable `data-bs-html="true"`?</summary>
Plain-text-by-default avoids unintentionally rendering unsafe HTML; it's only safe to enable HTML content for text you fully control, never for anything derived from user input.
</details>

<details>
<summary>4. When is a tooltip the wrong choice for conveying information?</summary>
When the information is essential to completing a task rather than merely supplementary — required content should be visible text (e.g. a `.form-text` helper), not hidden behind a hover-only tooltip that touch-only users may never discover.
</details>
