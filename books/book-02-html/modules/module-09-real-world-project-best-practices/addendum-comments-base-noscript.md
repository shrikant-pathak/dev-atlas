# Addendum: HTML Comments, `<base>`, and `<noscript>`

> A short addendum closing three minor gaps found during Book 02's full curriculum review.

---

## HTML Comments

```html
<!-- This is a comment, not rendered on the page -->
<p>Visible content</p>
<!-- TODO: add pricing section here -->
```

Comments are ignored by the browser entirely — useful for leaving notes for yourself or collaborators, or temporarily disabling a block of markup without deleting it. You've seen `<!-- -->` used throughout every module's code examples in this book; this is simply naming it as an explicit tool in your own toolkit.

**Caution:** never put sensitive information in HTML comments — they're fully visible to anyone who views your page's source code.

---

## The `<base>` Tag

```html
<head>
  <base href="https://devatlas.com/">
</head>
<body>
  <a href="about.html">About</a>  <!-- resolves to https://devatlas.com/about.html -->
</body>
```

`<base>` sets a default base URL that all relative links/paths (`href`, `src`) on the page resolve against, instead of the page's own location. Genuinely useful in specific situations (e.g., serving the same HTML from multiple different paths), but uncommon in typical projects — most sites never need it, since their relative paths already resolve correctly against the page's actual location. Worth recognizing if you encounter it, not something you'll reach for often.

**Rule:** at most one `<base>` per page, and it must appear in `<head>`, before any element that uses a relative URL.

---

## `<noscript>`

```html
<noscript>
  <p>This site requires JavaScript to function. Please enable it in your browser settings.</p>
</noscript>
```

Content inside `<noscript>` only renders if the browser has JavaScript disabled (rare today, but not zero) or doesn't support it at all. This connects to the fallback-content pattern you've seen repeatedly in this book — `<video>`'s fallback text (Module 03), `<canvas>`'s fallback content (Module 08) — `<noscript>` is the same idea, specifically for when JavaScript itself isn't available.

---

## Revision Questions

1. Are HTML comments visible to users viewing your page's rendered output? What about viewing page source?
2. What does `<base href="...">` change about how relative paths on a page resolve?
3. When does content inside `<noscript>` actually render?

<details><summary>Answers</summary>

1. Not in the rendered output, but they remain fully visible to anyone who views the page's raw HTML source — never put sensitive information in a comment.
2. It makes all relative links/paths on the page resolve against the specified base URL instead of the page's own actual location.
3. Only when the browser has JavaScript disabled or doesn't support it.

</details>
