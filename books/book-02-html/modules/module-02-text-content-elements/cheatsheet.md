# 📄 Cheat Sheet — Text & Content Elements

## Headings

```html
<h1>...</h1>  <!-- one per page, main title -->
<h2>...</h2>  <!-- major section -->
<h3>...</h3>  <!-- subsection -->
```
Rule: never skip levels; choose by structure, not visual size.

## Semantic vs. Visual Formatting

| Visual only | Semantic | Meaning |
|---|---|---|
| `<b>` | `<strong>` | Bold vs. strong importance |
| `<i>` | `<em>` | Italic vs. emphasis |

## Other Text Formatting

```html
<mark>highlighted</mark>
<sub>subscript</sub>  <sup>superscript</sup>
<small>fine print</small>
<del>deleted</del>  <ins>inserted</ins>
```

## Lists

| Type | Tag | Use When |
|---|---|---|
| Unordered | `<ul><li>` | Order doesn't matter |
| Ordered | `<ol><li>` | Order matters |
| Description | `<dl><dt><dd>` | Name/value pairs (glossary, FAQ) |

## Semantic Text Elements

```html
<abbr title="...">ABBR</abbr>
<code>inline code</code>
<pre><code>block code</code></pre>
<kbd>Ctrl</kbd>
<samp>output</samp>
<time datetime="2026-08-15">Aug 15, 2026</time>
<cite>Book Title
<var>x</var>
<address>contact info</address>
```

## Quotes

```html
<q>short inline quote</q>
<blockquote cite="url">
  <p>Long quoted passage.</p>
</blockquote>
```

## Line Breaks, HR, Preformatted

| Element | Use |
|---|---|
| `<br>` | Genuine line break within content (address, poem) |
| `<hr>` | Thematic break between sections |
| `<pre>` | Preserve exact whitespace/formatting |

**Never** use `<br>` for paragraph spacing — use `<p>` + CSS instead.
