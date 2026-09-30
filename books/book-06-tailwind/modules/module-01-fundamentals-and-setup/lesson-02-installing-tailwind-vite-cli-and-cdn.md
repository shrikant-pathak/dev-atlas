# Lesson 02: Installing Tailwind (Vite, CLI, and CDN)

## Learning Objectives
By the end of this lesson, you will be able to:
- Install Tailwind CSS v4 using the Vite plugin, the standalone CLI, or the PostCSS plugin
- Explain when the Play CDN is appropriate and why it should never ship to production
- Choose the right installation method for a given project type

## Introduction
Tailwind CSS v4 dramatically simplified installation compared to v3. There's no `tailwind.config.js` to generate, no `npx tailwindcss init`, and no separate `content` array to configure (Lesson 4 explains why). You have three realistic paths: the **Vite plugin** (fastest, best for React/Vue projects — Module 08), the **standalone CLI** (framework-agnostic, good for simple static sites), or the **Play CDN** (zero-install, prototyping only).

## Method 1: The Vite Plugin (Recommended for React & Vue)

Since you code in React, Vue, and React Native (per your Book 04 setup), this is the path you'll use most. First scaffold or open your Vite project, then:

```bash
npm install -D tailwindcss @tailwindcss/vite
```

Add the plugin to `vite.config.ts`:

```ts
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    tailwindcss(),
  ],
})
```

Then, in your main CSS file (commonly `src/index.css` or `src/style.css`):

```css
@import "tailwindcss";
```

Import that CSS file once in your app's entry point (`main.tsx`/`main.jsx` for React, `main.ts`/`main.js` for Vue), and you're done. No further config is required to start using every utility class.

## Method 2: The Standalone CLI

For projects without a bundler — a plain HTML page, or a backend-rendered app — install the CLI package:

```bash
npm install -D tailwindcss @tailwindcss/cli
```

Create an input CSS file with the same single import:

```css
/* input.css */
@import "tailwindcss";
```

Then run the CLI to generate your output stylesheet:

```bash
npx @tailwindcss/cli -i ./input.css -o ./output.css --watch
```

The `--watch` flag rebuilds `output.css` automatically whenever you save a file that uses a new class. Link `output.css` in your HTML like any normal stylesheet.

## Method 3: PostCSS Plugin

If your build already uses PostCSS directly (not through Vite), install:

```bash
npm install -D tailwindcss @tailwindcss/postcss
```

```js
// postcss.config.mjs
export default {
  plugins: {
    '@tailwindcss/postcss': {},
  },
}
```

Same single `@import "tailwindcss";` in your CSS entry point applies here too.

## Method 4: The Play CDN (Prototyping Only)

For a quick experiment with no build step at all:

```html
<script src="https://cdn.tailwindcss.com"></script>
```

This compiles Tailwind classes in the browser, in real time, using JavaScript. It's genuinely useful for a CodePen-style prototype or a one-off demo page. **It must never be used in production**, for several concrete reasons:

- It ships the entire Tailwind engine as JavaScript to every visitor, instead of a small, pre-generated CSS file — far larger and slower than a real build.
- It re-compiles styles on every page load, adding runtime cost that a build step eliminates entirely.
- Customization (custom colors, fonts, plugins — Module 06) isn't reliably supported the same way it is in a real build pipeline.
- The Tailwind team's own documentation states directly that the Play CDN is designed for demos and isn't meant for production use.

If you reach for the CDN to try something quickly, that's exactly what it's for — just make sure it never survives into a real deployment.

## Choosing a Method

| Scenario | Method |
|---|---|
| React or Vue app (this book's Module 08 focus) | Vite plugin |
| Static HTML site, no bundler | Standalone CLI |
| Existing PostCSS-based build | PostCSS plugin |
| Quick prototype, CodePen-style demo | Play CDN |

## Practical Example

A minimal Vite + React setup, start to finish:

```bash
npm create vite@latest my-app -- --template react
cd my-app
npm install
npm install -D tailwindcss @tailwindcss/vite
```

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [react(), tailwindcss()],
})
```

```css
/* src/index.css */
@import "tailwindcss";
```

```bash
npm run dev
```

Any `className="flex p-4 bg-blue-500"` you write anywhere in your components now just works — no further configuration.

## Summary
Tailwind v4 offers four installation paths: the Vite plugin (best for React/Vue), the standalone CLI (framework-agnostic builds), the PostCSS plugin (existing PostCSS pipelines), and the Play CDN (prototyping only, never production). All of them converge on the same one-line CSS entry point: `@import "tailwindcss";`.

## Revision Questions

<details>
<summary>1. Which installation method should you use for a React app built with Vite, and what two packages does it require?</summary>

The Vite plugin method — `tailwindcss` and `@tailwindcss/vite`, added as a plugin in `vite.config.ts`.
</details>

<details>
<summary>2. Why should the Play CDN never be used in production?</summary>

It ships the entire Tailwind engine as JavaScript and recompiles styles in the browser on every page load, instead of a small pre-generated CSS file from a real build — significantly larger and slower, and not reliably compatible with full customization.
</details>

<details>
<summary>3. What single line of CSS is common to every installation method (Vite, CLI, and PostCSS)?</summary>

`@import "tailwindcss";`
</details>

<details>
<summary>4. What CLI flag keeps your output CSS file updating automatically as you edit your source files?</summary>

`--watch`
</details>
