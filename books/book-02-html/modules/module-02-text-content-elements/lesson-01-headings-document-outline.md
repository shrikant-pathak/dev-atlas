cat > lesson-01-headings-document-outline.md << 'EOF'
# Lesson 01: Headings & Document Outline

## Learning Objectives
By the end of this lesson, you will be able to:
- Use `<h1>`–`<h6>` correctly to structure content.
- Understand why heading hierarchy matters beyond visual size.
- Avoid the most common heading mistakes beginners make.

---

# Introduction

Headings are usually the very first content-specific tags any beginner learns — but most tutorials only teach "bigger number = smaller text," missing why heading structure actually matters. This lesson fixes that gap early, before the habit of misusing headings sets in.

---

# The Six Heading Levels

HTML provides six heading levels, `<h1>` through `<h6>`, in decreasing order of importance:

```html
<h1>Page Title (most important)</h1>
<h2>Major Section</h2>
<h3>Subsection</h3>
<h4>Sub-subsection</h4>
<h5>Rarely used</h5>
<h6>Rarely used</h6>
```

By default, browsers render `<h1>` largest and `<h6>` smallest — but this visual sizing is just a *default style*, not the actual point of headings. (You'll learn in Book 03 that CSS can override these sizes entirely, while the heading's semantic *meaning* stays the same.)

---

# Why Heading Hierarchy Matters

Headings create a **document outline** — a structural table of contents that:
- **Screen readers** use to let visually impaired users jump directly between sections (Module 07 covers this in depth).
- **Search engines** use to understand a page's content structure and importance, directly affecting SEO (Module 07).
- **You and other developers** use to understand a page's structure at a glance, just by scanning heading tags.

This means headings should be chosen based on **document structure**, not desired font size — using `<h3>` because "it looks like the right size" while skipping `<h1>` and `<h2>` breaks this structure for everyone relying on it.

---

# Rules and Best Practices

1. **Use exactly one `<h1>` per page** — it should represent the page's main title/topic.
2. **Don't skip levels** — going from `<h2>` directly to `<h4>` (skipping `<h3>`) breaks the logical outline, even if it "looks fine" visually.
3. **Nest headings to reflect actual content structure**, not visual preference.

```html
<!-- Good structure -->
<h1>Dev Atlas</h1>
  <h2>Book 02: HTML</h2>
    <h3>Module 02: Text & Content Elements</h3>
      <h4>Lesson 01: Headings</h4>

<!-- Bad: skips h2, uses h4 for visual size only -->
<h1>Dev Atlas</h1>
  <h4>Book 02: HTML</h4>
```

---

# Practical Example

```html
<article>
  <h1>Complete Guide to Sourdough Bread</h1>
  <p>Introduction text...</p>

  <h2>Ingredients</h2>
  <p>...</p>

  <h2>Instructions</h2>
  <h3>Step 1: Prepare the Starter</h3>
  <p>...</p>
  <h3>Step 2: Mix the Dough</h3>
  <p>...</p>
</article>
```

---

# Revision Questions

1. Why is heading choice supposed to be based on document structure rather than desired visual size?
2. How many `<h1>` elements should a typical page have?
3. What's wrong with jumping from `<h2>` straight to `<h4>`, skipping `<h3>`?

<details><summary>Answers</summary>

1. Because screen readers, search engines, and other developers all rely on heading levels to understand a page's actual structure — choosing headings purely by visual size breaks that structure for all of them.
2. Exactly one, representing the page's main title/topic.
3. It breaks the logical document outline — screen reader users navigating by heading level, and search engines parsing structure, would see an inconsistent, illogical hierarchy.

</details>
EOF