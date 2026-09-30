# Lesson 05: Editor Setup, IntelliSense, and Prettier

## Learning Objectives
By the end of this lesson, you will be able to:
- Install and configure the official Tailwind CSS IntelliSense extension
- Fix the "unknown at-rule" CSS warnings that appear without it
- Set up automatic class-name sorting with the Prettier plugin for Tailwind

## Introduction
Writing Tailwind by hand from memory works, but it's slow and error-prone — there are thousands of utility classes, and typos (`text-gray-50o` instead of `text-gray-500`) fail silently, exactly like the dynamic-class problem from Lesson 4. This lesson sets up the two tools that make Tailwind development fast and consistent: the official IntelliSense extension, and the Prettier plugin for class sorting.

## The Tailwind CSS IntelliSense Extension

Install the official **Tailwind CSS IntelliSense** extension from the VS Code marketplace (also available for JetBrains IDEs). Once installed, it provides:

- **Autocomplete** — as you type `bg-`, it suggests every matching color/utility, with live previews
- **Hover previews** — hovering any class shows the exact CSS it generates
- **Linting** — flags conflicting classes on the same element (e.g., `px-4` and `px-6` together) and invalid class names
- **CSS directive support** — recognizes `@theme`, `@apply`, `@layer`, and other Tailwind-specific directives in your CSS files, so they're not flagged as errors

## Fixing the "Unknown At-Rule" Squiggles

If you write `@import "tailwindcss";` or `@theme { ... }` in a `.css` file without the extension installed, VS Code's built-in CSS language service doesn't recognize these Tailwind-specific directives and shows red squiggly warnings ("Unknown at rule @theme"). This is purely a VS Code display issue — your build still works correctly — but it's distracting. Installing the IntelliSense extension resolves it automatically for `.css` files.

For non-standard file associations (styled-components, or CSS-in-JS patterns), you may need to add a workspace setting:

```json
// .vscode/settings.json
{
  "tailwindCSS.includeLanguages": {
    "typescriptreact": "javascript",
    "vue": "html"
  }
}
```

This tells the extension to also provide autocomplete inside `className`/`class` attributes in those file types — relevant for your React and Vue work (Module 08).

## Sorting Classes Automatically with Prettier

As you compose more utilities on one element, class lists get long:

```html
<div class="text-white p-4 bg-blue-500 flex hover:bg-blue-700 rounded-lg items-center">
```

Order here is arbitrary and inconsistent across a team — one developer writes layout classes first, another writes colors first. The official **`prettier-plugin-tailwindcss`** solves this by automatically re-ordering your classes into a consistent, recommended sequence every time you save (layout → spacing → typography → color → state variants), with zero manual effort.

Install it alongside Prettier:

```bash
npm install -D prettier prettier-plugin-tailwindcss
```

No further configuration is required — Prettier detects the plugin automatically. After saving, the example above becomes:

```html
<div class="flex items-center rounded-lg bg-blue-500 p-4 text-white hover:bg-blue-700">
```

Note this is exactly the ordering used throughout this book's own lesson examples — that's not a coincidence; it's what the Prettier plugin produces by default, and it's worth adopting as your standard from day one so your code always matches what tooling (and this book) considers idiomatic.

## Practical Example

A minimal `package.json` and Prettier config wiring both tools together for a Vite + React project (building on Lesson 2's setup):

```bash
npm install -D prettier prettier-plugin-tailwindcss
```

```json
// .prettierrc
{
  "plugins": ["prettier-plugin-tailwindcss"]
}
```

Combined with the IntelliSense extension installed in your editor, you now get autocomplete and hover previews as you type, and automatic, consistent class ordering every time you save — the two tools that make daily Tailwind work fast rather than tedious.

## Summary
The official Tailwind CSS IntelliSense extension provides autocomplete, hover previews, and directive-aware linting, and resolves the "unknown at-rule" CSS warnings that appear without it. The `prettier-plugin-tailwindcss` plugin automatically sorts your class lists into a consistent order on save, removing arbitrary ordering disagreements across a team.

## Revision Questions

<details>
<summary>1. What VS Code warning does the IntelliSense extension resolve, and why does it happen without the extension?</summary>

"Unknown at-rule" red squiggles on directives like `@theme` or `@apply` — VS Code's built-in CSS language service doesn't recognize Tailwind-specific syntax without the extension installed. It's a display-only issue; the build still works.
</details>

<details>
<summary>2. What does `prettier-plugin-tailwindcss` do, and what problem does it solve?</summary>

It automatically re-orders utility classes into a consistent, recommended sequence on every save, removing inconsistent/arbitrary class ordering across a team or codebase.
</details>

<details>
<summary>3. Why is class-name autocomplete particularly valuable in Tailwind, compared to writing plain CSS property names?</summary>

Because a typo in a class name (like `text-gray-50o`) fails completely silently — no error, just no styling applied — unlike a typo in a CSS property, which is often caught by a linter or produces a visible parse issue.
</details>

<details>
<summary>4. What setting would you add to recognize Tailwind classes inside a `.vue` file's `class` attribute?</summary>

A `tailwindCSS.includeLanguages` entry in `.vscode/settings.json` mapping `vue` to `html`.
</details>
