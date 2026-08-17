cat > lesson-06-seo-fundamentals-for-html.md << 'EOF'
# Lesson 06: SEO Fundamentals for HTML

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain the core factors search engines evaluate at the HTML level.
- Pull together every SEO-relevant concept from across this entire book into one checklist.
- Understand where HTML's role in SEO ends and other factors begin.

---

# Introduction

This final lesson of Module 07 — and the closing lesson of everything accessibility- and SEO-related in Book 02 — pulls together every SEO-relevant thread scattered across this entire book into one coherent picture.

---

# How Search Engines Actually Work (Brief Recap)

Recall from Book 01, Module 04: search engines operate by **crawling** the web (following links from page to page), **indexing** the content they find, and then **ranking** indexed pages for relevant search queries. HTML's role in SEO is almost entirely about making the *crawling* and *indexing* steps as accurate and complete as possible — giving the search engine the clearest possible signal of what your content actually is and means.

---

# The Complete HTML-Level SEO Checklist

Pulling together everything from across this book:

**Document structure (Module 01):**
- [ ] Valid `<!DOCTYPE html>` and correct `<html lang="...">`
- [ ] `<meta charset="UTF-8">` and viewport tag present

**Content structure (Module 02, Module 06):**
- [ ] Exactly one `<h1>` per page, describing the page's core topic
- [ ] Logical heading hierarchy, no skipped levels
- [ ] Semantic elements (`<article>`, `<section>`, `<nav>`) used correctly, not generic `<div>`s

**Links and media (Module 03):**
- [ ] Descriptive, meaningful `alt` text on all informational images
- [ ] Internal links using clear, descriptive anchor text (not "click here")
- [ ] Correct, working file paths — broken links and images hurt both users and crawlability

**Metadata (This Module):**
- [ ] Unique, descriptive `<title>` for every page
- [ ] Unique `<meta name="description">` for every page
- [ ] Open Graph tags for social sharing
- [ ] Structured data (JSON-LD) where genuinely applicable

**Accessibility (This Module):**
- [ ] Passes basic accessibility checks (Lesson 03's tools) — genuinely correlated with SEO, since both reward clear, well-structured, meaningful content

---

# Why "Descriptive Anchor Text" Matters

A detail worth calling out explicitly, since it's easy to overlook:

```html
<!-- Poor: no context for search engines (or screen reader users navigating by links!) -->
<a href="/html-guide">Click here</a>

<!-- Good: descriptive, meaningful out of context -->
<a href="/html-guide">Read our complete HTML guide</a>
```

This connects directly back to accessibility too — screen readers let users navigate a page by cycling through links alone (similar to heading navigation from Lesson 03), and a list of "click here, click here, click here" provides zero useful context in that mode.

---

# Where HTML's Role in SEO Ends

It's worth being honest about scope: HTML structure is necessary but far from sufficient for strong SEO. Beyond what this book covers, real-world SEO also depends heavily on:
- **Page load performance** (touched on in Book 01's caching/rendering modules, deepened once you reach production deployment)
- **Content quality and relevance** — genuinely well-written, useful content, which no amount of correct markup substitutes for
- **Backlinks** — other reputable sites linking to yours
- **Mobile-friendliness** (the viewport tag from Module 01 is necessary, but real responsive design comes in Book 03, CSS)

HTML gives search engines the clearest possible *signal* of what your content is — but it doesn't manufacture good content or reputation out of nothing. Treat everything in this module as the essential foundation, not the entire discipline.

---

# Practical Example

A single page demonstrating the full checklist in action:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Understanding Semantic HTML — Dev Atlas</title>
  <meta name="description" content="Learn what semantic HTML means, why it matters for accessibility and SEO, and how to use it correctly.">
  <meta property="og:title" content="Understanding Semantic HTML">
  <meta property="og:type" content="article">
</head>
<body>
  <header>
    <nav><a href="/">Home</a></nav>
  </header>
  <main>
    <article>
      <h1>Understanding Semantic HTML</h1>
      <p>Semantic HTML means choosing elements based on meaning...</p>
      <p>Read more in our <a href="/accessibility-guide">complete accessibility guide</a>.</p>
      <img src="diagram.png" alt="Diagram showing the DOM tree structure of a semantic page">
    </article>
  </main>
  <footer>
    <p>&copy; 2026 Dev Atlas</p>
  </footer>
</body>
</html>
```

---

# Revision Questions

1. What are the three core steps search engines perform, and which does HTML structure most directly affect?
2. Why is "click here" as anchor text a problem for both SEO and accessibility?
3. Name two SEO factors that go beyond what HTML structure alone can provide.

<details><summary>Answers</summary>

1. Crawling, indexing, and ranking — HTML structure most directly affects crawling and indexing accuracy.
2. It provides no descriptive context out of surrounding sentence context — search engines can't tell what the link leads to, and screen reader users navigating by a list of links alone hear only "click here" repeated with no useful information.
3. Any two of: page load performance, content quality/relevance, backlinks from other reputable sites, mobile-friendliness/responsive design (full depth in Book 03).

</details>

---

# 🏁 Module 07 Checkpoint

Before moving to Module 08, you should be able to:
- [ ] Explain concretely why accessibility matters, beyond a vague sense of "being nice"
- [ ] Apply the First Rule of ARIA, using native HTML before reaching for ARIA attributes
- [ ] Explain how screen readers use heading hierarchy and landmarks to navigate
- [ ] Configure a complete, production-quality `<head>` with SEO and social sharing meta tags
- [ ] Add basic JSON-LD structured data to a page
- [ ] Apply the full HTML-level SEO checklist to any page you build going forward

**Next up:** Module 08 — HTML5 APIs & Advanced Features
EOF