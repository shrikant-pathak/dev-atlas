# Typography Basics

## Learning Objectives
- Use Bootstrap's heading and display heading classes
- Apply text alignment, transformation, weight, and emphasis utilities
- Use `.lead`, `<mark>`, `<small>`, `<abbr>`, blockquotes, and lists the "Bootstrap way"
- Understand how Bootstrap's typography utilities relate to the raw CSS properties from Book 03

## Introduction

Book 03's Colors, Units & Typography module taught you `font-size`, `font-weight`, `text-align`, and friends as raw CSS properties. Bootstrap wraps the same underlying properties into a consistent set of utility classes — so instead of writing `<h2 style="text-align: center; font-weight: 300;">`, you reach for pre-built classes that guarantee visual consistency across your whole project.

## Headings and Display Headings

Standard `<h1>`–`<h6>` elements are already styled by Reboot (Module 01, Lesson 4). Bootstrap also provides **display headings** — larger, more dramatic headings for hero sections, independent of the semantic heading level:

```html
<h1 class="display-1">Display 1</h1>
<h1 class="display-4">Display 4 (smaller, still huge)</h1>
```

`.display-1` through `.display-6` scale down in size. Crucially, you can apply a `.display-*` class to an `<h1>` while keeping semantic correctness — the tag stays an `<h1>` for accessibility and SEO, while the class only changes its visual size.

## Text Alignment and Transformation

```html
<p class="text-start">Left aligned (default)</p>
<p class="text-center">Centered</p>
<p class="text-end">Right aligned</p>

<p class="text-lowercase">MAKES THIS lowercase</p>
<p class="text-uppercase">makes this UPPERCASE</p>
<p class="text-capitalize">capitalizes each word</p>
```

Note `.text-start`/`.text-end` (rather than `.text-left`/`.text-right`) — this phrasing is intentional so the same class works correctly in right-to-left layouts, a topic covered fully in Module 11.

## Font Weight and Emphasis

```html
<p class="fw-bold">Bold text</p>
<p class="fw-normal">Normal weight</p>
<p class="fw-light">Light weight</p>
<p class="fst-italic">Italic text</p>
```

## The `.lead` Class

```html
<p class="lead">
  This paragraph stands out from regular body text — larger font size and lighter weight, typically used as an introductory sentence under a heading.
</p>
```

## Inline Text Helpers

```html
<p>You can use the <mark>mark tag</mark> to highlight text.</p>
<p><del>This line is deleted.</del></p>
<p><ins>This line is inserted.</ins></p>
<p><small>This line is rendered as fine print.</small></p>
<abbr title="Cascading Style Sheets">CSS</abbr>
```

Bootstrap doesn't reinvent these — it simply ensures they render consistently, building on the semantic HTML elements from Book 02.

## Blockquotes

```html
<blockquote class="blockquote">
  <p>A well-known quote, contained in a blockquote element.</p>
  <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
</blockquote>
```

## Lists Without Bullets

```html
<ul class="list-unstyled">
  <li>No bullet</li>
  <li>No default padding</li>
</ul>

<ul class="list-inline">
  <li class="list-inline-item">One</li>
  <li class="list-inline-item">Two</li>
  <li class="list-inline-item">Three</li>
</ul>
```

`.list-unstyled` removes bullets and default padding — useful when you want to build custom navigation or footer link lists (you'll use this heavily in Module 07's Navbar and Breadcrumb lessons).

## Practical Example — A Hero Section Using Typography Utilities

```html
<div class="container text-center py-5">
  <h1 class="display-4 fw-bold">Build Faster with Bootstrap</h1>
  <p class="lead">
    A responsive, component-based framework for modern web projects.
  </p>
  <p class="text-uppercase fw-light">Get Started Below</p>
</div>
```

## Revision Questions

<details>
<summary>1. What is the practical benefit of applying a .display-* class to an <h1> instead of just using a bigger custom font-size?</summary>
It keeps the element semantically an h1 (correct for accessibility and SEO) while only changing its visual size — separating semantic meaning from visual presentation, the same principle from Book 03.
</details>

<details>
<summary>2. Why does Bootstrap use .text-start and .text-end instead of .text-left and .text-right?</summary>
Because "start" and "end" adapt correctly in right-to-left layouts, whereas "left" and "right" would be visually backwards in an RTL context (covered fully in Module 11).
</details>

<details>
<summary>3. What does .list-unstyled do, and why is it commonly used?</summary>
It removes bullet points and default padding from a list, commonly used as the foundation for custom navigation menus, footer link lists, and breadcrumbs built from <ul> elements.
</details>
