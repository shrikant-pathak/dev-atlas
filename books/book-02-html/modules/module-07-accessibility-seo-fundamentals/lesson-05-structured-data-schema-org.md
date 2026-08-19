# Lesson 05: Structured Data & Schema.org

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what structured data is and why search engines use it.
- Add basic JSON-LD structured data to a page.
- Recognize how structured data powers "rich results" in search.

---

# Introduction

This lesson covers structured data — a genuinely advanced SEO topic that goes beyond what most beginner HTML courses teach, letting you explicitly tell search engines exactly what your content *means*, rather than leaving them to infer it from context.

---

# What Is Structured Data?

**Structured data** is a standardized way of describing your page's content using a shared vocabulary (**Schema.org**, a collaborative project backed by Google, Microsoft, Yahoo, and Yandex) so search engines can understand precisely what a piece of content represents — a recipe, a product, an event, a person, a review — not just parse it as generic text.

This directly extends the semantic HTML principle from Module 06: semantic elements tell machines "this is an article" or "this is navigation" at a *structural* level; structured data goes further, telling them "this specific text is a price," "this specific text is a star rating," "this specific date is an event's start time" at a *content* level.

---

# JSON-LD: The Recommended Format

While structured data can technically be embedded directly in HTML attributes (a format called "Microdata"), Google explicitly recommends **JSON-LD** — a self-contained script block, kept separate from your visible HTML, describing the page's content:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "Article",
  "headline": "Understanding Semantic HTML",
  "author": {
    "@type": "Person",
    "name": "Shrikant Pathak"
  },
  "datePublished": "2026-08-16"
}
</script>
```

This goes inside `<head>` (or `<body>`, both are valid), and doesn't affect what's visually rendered at all — it's purely a machine-readable data layer sitting alongside your regular HTML.

---

# Common Schema Types

Schema.org defines hundreds of content types, but a handful cover the vast majority of practical use:

- **`Article`** / **`BlogPosting`** — blog posts, news articles.
- **`Product`** — e-commerce products, often including price and availability.
- **`Recipe`** — cooking recipes, including ingredients and cook time.
- **`Event`** — events, including date/time and location.
- **`Person`** / **`Organization`** — people or companies.
- **`FAQPage`** — a page of frequently asked questions.

---

# Why This Matters: Rich Results

Structured data is what powers **rich results** — the enhanced search listings you've certainly seen, but maybe never connected to this underlying technology: star ratings shown directly in search results, recipe cook times and calorie counts, event dates, FAQ dropdowns expandable right within the search results page itself.

Pages without structured data can still rank well, but they're not eligible for these enhanced, more visually prominent, higher-click-through-rate result formats — a genuine, measurable SEO advantage for pages that implement it correctly.

---

# A Practical FAQ Example

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What is Dev Atlas?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Dev Atlas is a complete, beginner-to-advanced web development learning roadmap."
      }
    }
  ]
}
</script>
```

Notice how this pairs naturally with the `<details>`/`<summary>` FAQ pattern from Module 06, Lesson 04 — the structured data describes the same content to machines that your `<details>` elements present visually to humans.

---

# Practical Example

```html
<head>
  <!-- ... other meta tags from Lesson 04 ... -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "Semantic HTML Explained",
    "author": { "@type": "Person", "name": "Shrikant Pathak" },
    "datePublished": "2026-08-16",
    "publisher": { "@type": "Organization", "name": "Dev Atlas" }
  }
  </script>
</head>
```

---

# Revision Questions

1. What is structured data, and how does it extend the semantic HTML principle from Module 06?
2. What format does Google explicitly recommend for structured data, and where does it go?
3. What are "rich results," and why does structured data matter for achieving them?

<details><summary>Answers</summary>

1. A standardized vocabulary (Schema.org) describing exactly what a page's content means at a content level, not just its structural role; semantic HTML tells machines "this is an article," while structured data tells them specifically "this text is the price" or "this date is the event start time."
2. JSON-LD, a self-contained script block placed in `<head>` or `<body>`, separate from the visible HTML.
3. Enhanced search result formats (star ratings, recipe details, FAQ dropdowns) that go beyond plain text listings; pages need correctly implemented structured data to become eligible for these more prominent, higher-click-through result formats.

</details>
