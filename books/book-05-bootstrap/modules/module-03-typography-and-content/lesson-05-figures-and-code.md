# Figures & Code

## Learning Objectives
- Build a semantically correct, styled `<figure>` with a caption
- Style inline code, code blocks, keyboard input, and sample output
- Understand when to reach for each code-related element

## Introduction

This lesson covers two smaller but frequently-used content types: **figures** (an image or other content plus an associated caption) and **code display** (showing code, keyboard shortcuts, or program output as content on the page — very relevant for a technical audience like the one reading this book).

## The `<figure>` Element

You met `<figure>` and `<figcaption>` briefly in Book 02 as semantic HTML elements for self-contained content (like an image) with an optional caption. Bootstrap styles them consistently:

```html
<figure class="figure">
  <img src="chart.png" class="figure-img img-fluid rounded" alt="Quarterly revenue chart">
  <figcaption class="figure-caption">Fig. 1 — Quarterly revenue, 2026.</figcaption>
</figure>
```

`.figure-caption` applies smaller, muted text styling appropriate for a caption — visually distinct from regular body copy.

## Inline Code

```html
<p>Use the <code>array.map()</code> method to transform each element.</p>
```

The `<code>` element (from Book 02/04) is automatically styled by Reboot with a monospace font and a subtle color, no extra class needed.

## Code Blocks

```html
<pre><code>function greet(name) {
  return `Hello, ${name}!`;
}</code></pre>
```

Wrapping `<code>` in `<pre>` preserves whitespace and line breaks — exactly the semantic pairing you'd use for a multi-line code sample, same as in plain HTML/CSS, just inheriting Bootstrap's Reboot-normalized monospace styling.

## Keyboard Input

```html
<p>Press <kbd>Ctrl</kbd> + <kbd>C</kbd> to copy.</p>
```

`<kbd>` renders as a small, distinct inline box representing a keyboard key — commonly seen in technical documentation (like this very curriculum!).

## Sample Output

```html
<samp>Compilation succeeded. 0 errors, 0 warnings.</samp>
```

`<samp>` represents sample output from a program — less common than `<code>` or `<kbd>`, but still occasionally useful in technical writing or documentation sites.

## Practical Example — A Documentation-Style Snippet

```html
<div class="container py-4">
  <h4>Installing the Package</h4>
  <p>Run the following command in your terminal:</p>
  <pre><code>npm install my-package</code></pre>

  <p>
    Then press <kbd>Ctrl</kbd> + <kbd>S</kbd> to save your file. You should see:
  </p>
  <samp>✔ my-package installed successfully</samp>

  <figure class="figure mt-4">
    <img src="terminal-screenshot.png" class="figure-img img-fluid rounded" alt="Terminal output">
    <figcaption class="figure-caption">Fig. 1 — Expected terminal output after installation.</figcaption>
  </figure>
</div>
```

## Revision Questions

<details>
<summary>1. What is the purpose of pairing <pre> with <code> for a multi-line snippet?</summary>
<pre> preserves whitespace and line breaks exactly as written, which is essential for multi-line code to display correctly — <code> alone doesn't preserve that formatting.
</details>

<details>
<summary>2. What element would you use to represent a keyboard shortcut like Ctrl+C in a tutorial?</summary>
The <kbd> element, which Bootstrap renders as a small, visually distinct inline box.
</details>

<details>
<summary>3. Does inline <code> need an extra Bootstrap class to get its monospace styling?</summary>
No — Reboot automatically styles <code> with a monospace font and subtle coloring without requiring any additional class.
</details>
