# Lesson 12: Centering and Common Layout Recipes

## Learning Objectives
- Apply the most common centering patterns using Flexbox and Grid
- Recognize and reuse several everyday layout recipes: holy grail, sticky footer, and card grids
- Choose the simplest tool for a given centering scenario

## Introduction
This lesson is a practical capstone for the module — a reference set of the layout patterns you'll reach for constantly, combining everything from Lessons 1–11 into copy-paste-ready recipes.

## Centering: Flexbox Method

The most common centering pattern in modern web development:

```html
<div class="flex h-dvh items-center justify-center">
  <div class="rounded-lg bg-white p-8 shadow-lg">Centered content</div>
</div>
```

`items-center` centers vertically, `justify-center` centers horizontally, and `h-dvh` (Lesson 3) ensures the container fills the full viewport height without the mobile browser-chrome jump.

## Centering: Grid Method

Grid offers an equally concise alternative using `place-items-center`, which sets both `align-items` and `justify-items` in one class:

```html
<div class="grid min-h-screen place-items-center">
  <div class="rounded-lg bg-white p-8 shadow-lg">Centered content</div>
</div>
```

Either method works identically for simple centering — Flexbox is marginally more common by convention, but Grid's `place-items-center` is worth knowing since it's a single class instead of two.

## Recipe: Sticky Footer

A page whose footer sits at the bottom of the viewport when content is short, but pushes down naturally when content is long:

```html
<div class="flex min-h-screen flex-col">
  <header class="p-4">Header</header>
  <main class="flex-1 p-4">Main content (grows to fill available space)</main>
  <footer class="p-4">Footer</footer>
</div>
```

This combines `min-h-screen` (Lesson 4) on the outer flex column with `flex-1` (Lesson 8) on the main content — the main area absorbs all extra space, pushing the footer to the bottom without any position tricks.

## Recipe: Holy Grail Layout

A classic three-column layout — header, footer, and a main area with a left sidebar, main content, and right sidebar — combining Flexbox for the outer structure and Grid for the middle section:

```html
<div class="flex min-h-screen flex-col">
  <header class="p-4">Header</header>
  <div class="grid flex-1 grid-cols-[200px_1fr_200px] gap-4 p-4">
    <aside class="bg-gray-100 p-4">Left Nav</aside>
    <main class="bg-white p-4">Main Content</main>
    <aside class="bg-gray-100 p-4">Right Rail</aside>
  </div>
  <footer class="p-4">Footer</footer>
</div>
```

## Recipe: Overlay/Modal Centering

Combining `fixed`, `inset-0`, and Flexbox centering (Lesson 5 + this lesson) is the standard way to center a modal over the entire viewport:

```html
<div class="fixed inset-0 z-50 flex items-center justify-center bg-black/50">
  <div class="w-full max-w-md rounded-lg bg-white p-6">Modal content</div>
</div>
```

## Practical Example

A complete small page combining several recipes from this lesson — sticky footer structure, a centered hero section, and a responsive card grid:

```html
<div class="flex min-h-screen flex-col">
  <header class="p-4">Header</header>
  <main class="flex-1">
    <section class="flex h-64 items-center justify-center bg-gray-50">
      <h1 class="text-3xl font-bold">Welcome</h1>
    </section>
    <div class="grid grid-cols-1 gap-6 p-6 md:grid-cols-3">
      <div class="rounded-lg border p-4">Card 1</div>
      <div class="rounded-lg border p-4">Card 2</div>
      <div class="rounded-lg border p-4">Card 3</div>
    </div>
  </main>
  <footer class="p-4">Footer</footer>
</div>
```

## Summary
Centering, sticky footers, holy grail layouts, and modal overlays are recurring patterns built entirely from utilities covered earlier in this module — `flex items-center justify-center` (or Grid's `place-items-center`) for centering, `flex-1` combined with `min-h-screen`/`h-dvh` for sticky footers, and `fixed inset-0` combined with centering for overlays. Recognizing these recipes as combinations of already-known utilities, rather than new concepts, is the goal of this closing lesson.

## Revision Questions

<details>
<summary>1. What two classes center content both horizontally and vertically inside a flex container?</summary>

`items-center` (vertical/cross-axis) and `justify-center` (horizontal/main-axis).
</details>

<details>
<summary>2. In the sticky footer recipe, what makes the main content area absorb all extra vertical space, pushing the footer down?</summary>

`flex-1` on the main content area, inside a `flex flex-col min-h-screen` container — the main area grows to fill any leftover space, pushing later siblings (the footer) to the bottom.
</details>

<details>
<summary>3. What single Grid utility achieves the same centering effect as `flex items-center justify-center`?</summary>

`place-items-center` on a `grid` container.
</details>
