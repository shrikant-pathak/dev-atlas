# 📄 Cheat Sheet — Accessibility & SEO Fundamentals

## First Rule of ARIA

> If a native HTML element already does what you need, use it instead of ARIA.

## Common ARIA Attributes

```html
aria-label="Close dialog"           <!-- accessible name, no visible text -->
aria-labelledby="heading-id"         <!-- name from another element -->
aria-hidden="true"                    <!-- hide decorative content -->
aria-describedby="hint-id"             <!-- additional description -->
aria-live="polite"                      <!-- announce dynamic updates -->
role="alert"                             <!-- urgent, interrupting message -->
```

## Screen Reader Navigation

| Mode | Jumps between |
|---|---|
| Heading navigation | `<h1>`–`<h6>` in document order |
| Landmark navigation | `<header>`, `<nav>`, `<main>`, `<aside>`, `<footer>` |
| Link navigation | All `<a>` elements — descriptive anchor text matters here |

## Meta Tags

```html
<meta name="description" content="...">
<link rel="icon" type="image/png" href="/favicon.png">

<!-- Open Graph -->
<meta property="og:title" content="...">
<meta property="og:description" content="...">
<meta property="og:image" content="...">
<meta property="og:type" content="website">

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">

<!-- Robots -->
<meta name="robots" content="index, follow">
```

## Structured Data (JSON-LD)

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "...",
  "author": { "@type": "Person", "name": "..." }
}
</script>
```

## HTML-Level SEO Checklist

- [ ] One `<h1>`, logical heading hierarchy
- [ ] Semantic elements, not div soup
- [ ] Meaningful `alt` text
- [ ] Descriptive anchor text (never "click here")
- [ ] Unique `<title>` and `<meta description>` per page
- [ ] Open Graph tags for sharing
- [ ] Structured data where applicable
