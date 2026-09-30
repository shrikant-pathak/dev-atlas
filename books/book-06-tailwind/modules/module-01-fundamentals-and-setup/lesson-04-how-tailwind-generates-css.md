# Lesson 04: How Tailwind Generates CSS

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain on-demand ("just-in-time") CSS generation and why Tailwind doesn't ship every possible utility by default
- Describe how v4's automatic content detection replaced v3's manual `content` configuration
- Understand why dynamically constructed class names can silently fail to generate CSS — and the v4 fix

## Introduction
A natural question once you see Tailwind's utility list (thousands of classes across colors, spacing, states, and breakpoints) is: doesn't shipping all of that make for a massive CSS file? The answer is no, because Tailwind never ships "all of it" — it generates only the CSS for classes you actually use, a process this lesson explains in full.

## On-Demand Generation

Tailwind scans your actual source files (HTML, JSX, Vue templates, wherever you write class names) and generates CSS only for the classes it finds. If your entire project never uses `bg-fuchsia-500`, that class's CSS never exists in your output file — even though it's fully "available" to you at any time. This is why adding a brand-new utility class to your markup and saving the file is enough to make it work immediately: the build step (via the Vite plugin's dev server, or the CLI's `--watch` mode) re-scans, notices the new class, and generates the matching CSS on the spot.

This on-demand model — historically called JIT (Just-In-Time) compilation when it was introduced as an opt-in feature in Tailwind v2, and the default engine from v3 onward — is why Tailwind projects ship remarkably small production CSS files despite the framework itself containing an enormous utility vocabulary.

## v4's Engine: Oxide

Tailwind v4 replaced its v3 JavaScript-based engine with a new Rust-based engine internally called **Oxide**. The practical result is dramatically faster builds — the Tailwind team's own v4.0 announcement cites full builds up to 5x faster and incremental builds over 100x faster (measured in microseconds) compared to v3. You don't configure Oxide directly; it's simply what's running under the hood whenever you use the Vite plugin, CLI, or PostCSS plugin.

## Automatic Content Detection (No More `content` Array)

In v3, you had to manually tell Tailwind which files to scan:

```js
// v3 tailwind.config.js
module.exports = {
  content: ['./src/**/*.{html,js,jsx,ts,tsx,vue}'],
  // ...
}
```

Forgetting to add a new folder here was a common source of "why isn't my class working" bugs — Tailwind simply never scanned the file, so it never saw the class and never generated its CSS.

v4 removes this entirely. It automatically detects and scans your project's template files with no configuration needed, using sensible defaults (respecting your `.gitignore`, skipping binary files, and so on). For the overwhelming majority of projects, you never need to think about which files get scanned.

For the rare case where you need to explicitly include or exclude something — a file outside the normal scan path, or a vendored directory you want ignored — v4 exposes an explicit `@source` directive in your CSS, covered in full in Module 06's `source-plugin-and-legacy-config` lesson.

## The Dynamic Class Name Pitfall

Because Tailwind generates CSS by scanning your source files for **literal, complete class name strings**, there's one pattern that reliably breaks: building a class name dynamically at runtime.

```jsx
// This will NOT work as expected
function Badge({ color }) {
  return <span className={`bg-${color}-500`}>Status</span>
}
```

Tailwind's scanner sees the literal text `` `bg-${color}-500` `` in your source file — not `bg-red-500` or `bg-green-500`. Since that exact string never appears anywhere as a complete class name, no matching CSS is ever generated, and the class silently does nothing at runtime, no error, no warning. This is one of the most common real-world Tailwind bugs, especially once you start building components in React or Vue (Module 08) that map props to styles.

**The fix is to always use complete, literal class names**, and branch between them in your code instead of interpolating a fragment:

```jsx
// This works — every complete class name appears literally in the source
function Badge({ color }) {
  const colorClasses = {
    red: 'bg-red-500',
    green: 'bg-green-500',
    blue: 'bg-blue-500',
  }
  return <span className={colorClasses[color]}>Status</span>
}
```

For the rarer case where a truly dynamic value can't be avoided (classes coming from an external CMS or API response, say), v4 provides the `@source inline(...)` directive in your CSS as an explicit escape hatch — telling Tailwind to always generate specific classes regardless of whether they appear as literal text. This replaces v3's `safelist` array, which lived in `tailwind.config.js`:

```css
@import "tailwindcss";
@source inline("bg-red-500", "bg-green-500", "bg-blue-500");
```

You'll use this same pattern again in Module 08's React lesson, where building `className` strings from props is the everyday reality — the object-lookup approach above should be your default, with `@source inline(...)` reserved for genuinely unavoidable cases.

## Practical Example

A before/after showing the full lifecycle: you write a class, the build scans for it, CSS is generated.

```jsx
// Before: you haven't used this class anywhere yet
<button className="px-4 py-2">Click</button>

// You add a new utility
<button className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700">Click</button>
```

The moment you save, your dev server (Vite plugin) or `--watch` process (CLI) re-scans this file, notices `bg-emerald-600` and `hover:bg-emerald-700` are now present, and generates exactly those two rules — nothing more, nothing less — into your output CSS.

## Summary
Tailwind generates CSS on demand by scanning your source files for complete, literal class name strings — never shipping unused utilities. v4's Oxide engine (Rust-based) makes this dramatically faster, and automatic content detection removes the need for a manual `content` config array. The one pattern to avoid is building class names dynamically at runtime (`` `bg-${color}-500` ``), since Tailwind can't see through string interpolation — use a lookup object of complete class names instead, or `@source inline(...)` for unavoidable cases.

## Revision Questions

<details>
<summary>1. Why doesn't shipping Tailwind's entire utility vocabulary result in a massive CSS file?</summary>

Because Tailwind generates CSS on demand — it scans your source files and only produces CSS for the classes it actually finds used as complete, literal strings.
</details>

<details>
<summary>2. What replaced the manual `content` array from v3, and what does it do differently?</summary>

Automatic content detection — v4 scans your project's template files automatically with no configuration needed, instead of requiring you to manually list file glob patterns.
</details>

<details>
<summary>3. Why does `` className={`bg-${color}-500`} `` fail to produce any visible styling?</summary>

Tailwind's scanner only sees the literal source text, not the interpolated runtime value — since the complete class name never appears anywhere as a literal string, no matching CSS is ever generated, and the class does nothing with no error.
</details>

<details>
<summary>4. What's the recommended fix for the dynamic class name problem, and what's the v4 escape hatch for unavoidable cases?</summary>

Recommended fix: use a lookup object mapping each possible value to a complete, literal class name string. Escape hatch: the `@source inline(...)` directive in CSS, which replaced v3's `safelist` config array.
</details>
