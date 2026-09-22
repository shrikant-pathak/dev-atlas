# Jumbotron/Hero Recipe

## Learning Objectives
- Understand why "Jumbotron" was removed as a dedicated Bootstrap component in version 5
- Rebuild the same visual pattern using utility classes instead
- Combine typography, spacing, color, and container utilities into a complete hero section
- Recognize this as a general lesson in "building patterns from utilities" rather than relying on single dedicated component classes

## Introduction

In Bootstrap 3 and 4, there was a dedicated `.jumbotron` class — a single class that gave you a large, padded, lightly-colored banner section, commonly used for a homepage hero. **Bootstrap 5 removed the `.jumbotron` component entirely.** This wasn't an oversight — it reflects a broader design philosophy shift in Bootstrap 5: rather than shipping a dedicated class for every possible visual pattern, Bootstrap increasingly expects you to **compose patterns yourself from its utility classes** (many of which you already know from Lesson 1, Module 02, and Module 04).

## Why Remove It?

A single `.jumbotron` class baked in specific padding, specific background color, and specific typography choices — but real projects almost always wanted to customize at least one of those. Rather than maintaining a dedicated component that people constantly overrode anyway, Bootstrap 5 treats "hero section" as a **recipe** built from existing utilities, giving you full control with no fighting against baked-in defaults.

## Rebuilding a "Jumbotron" from Utilities

```html
<div class="container-fluid bg-light py-5">
  <div class="container">
    <h1 class="display-4 fw-bold">Hello, world!</h1>
    <p class="lead">
      This is a simple hero unit, a simple jumbotron-style component for
      calling extra attention to featured content or information.
    </p>
    <hr class="my-4">
    <p>It uses utility classes for typography and spacing to space content out within the larger container.</p>
    <a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
  </div>
</div>
```

Every piece here is something you've already learned:

- `.container-fluid` + `.bg-light` + `.py-5` — full-width banner with generous vertical padding and a light background (Module 02, Module 04)
- Nested `.container` — keeps the *text content* comfortably width-constrained even though the background spans full width (Module 02, Lesson 1)
- `.display-4` and `.lead` — heading and lead paragraph styling (Lesson 1 of this module)
- `.my-4` on `<hr>` — vertical spacing utility (fully covered in Module 04)
- `.btn .btn-primary .btn-lg` — a button, covered fully in Module 06

## A Full-Bleed, Colorful Hero Variant

```html
<div class="container-fluid bg-primary text-white text-center py-5">
  <h1 class="display-3 fw-bold">Build Something Great</h1>
  <p class="lead">Everything you need, all in one framework.</p>
  <a href="#" class="btn btn-light btn-lg mt-3">Get Started</a>
</div>
```

Swapping `.bg-light` for `.bg-primary` plus `.text-white` completely changes the visual tone, without touching structure — this is the real payoff of the utility-first "recipe" approach: infinite variation from the same small set of building blocks.

## The Bigger Lesson

This is really a lesson about a mindset, more than a specific pattern: whenever you find yourself wishing Bootstrap had "a class for that," the answer is usually that it already gives you the pieces to build it yourself, exactly to your specification, from utilities you already know.

## Revision Questions

<details>
<summary>1. Why did Bootstrap 5 remove the dedicated .jumbotron component?</summary>
Because a single component class baked in specific defaults (padding, background, typography) that most real projects ended up overriding anyway — removing it in favor of utility composition gives full control with no fighting against baked-in defaults.
</details>

<details>
<summary>2. What role does the nested .container play inside a .container-fluid hero section?</summary>
It keeps the text content comfortably width-constrained and centered even though the outer background spans the full viewport width.
</details>

<details>
<summary>3. What is the broader lesson this recipe pattern teaches about how to approach Bootstrap 5?</summary>
That many visual patterns aren't provided as single dedicated classes — instead, they're meant to be composed from the framework's utility classes, giving more flexibility than a single fixed component would.
</details>
