cat > lesson-02-structuring-multi-page-site.md << 'EOF'
# Lesson 02: Structuring a Multi-Page Site

## Learning Objectives
By the end of this lesson, you will be able to:
- Organize a real, multi-page HTML project's file structure sensibly.
- Avoid duplicating shared content across pages without proper tooling.
- Understand the genuine limitation this exposes, motivating later books.

---

# Introduction

Every lesson so far has largely dealt with single pages or isolated snippets. This lesson zooms out to a real multi-page project — genuinely closer to what the Module 09 capstone project (Lesson 05) will require.

---

# A Sensible Multi-Page Project Structure

Building directly on Book 01, Module 06's file structure lesson:

my-site/
├── index.html
├── about.html
├── contact.html
├── blog/
│ ├── index.html
│ ├── post-1.html
│ └── post-2.html
├── css/
│ └── (styles, coming in Book 03)
├── images/
│ ├── logo.png
│ └── hero.jpg
└── favicon.png

**Key conventions:**
- Each "page" is its own `.html` file, following kebab-case naming (Lesson 01).
- Related pages get their own subfolder (`blog/`), each with an `index.html` acting as that section's default page — a genuinely common convention, since most servers automatically serve `index.html` when a folder is requested without a specific filename.
- Shared assets (`images/`, eventually `css/`) live in dedicated top-level folders, referenced with consistent relative or root-absolute paths (Module 03, Lesson 01).

---

# Linking Pages Together Correctly

Recall Module 03's path lessons — with multiple real pages now involved, path discipline genuinely matters:

```html
<!-- From index.html (root level) -->
<a href="about.html">About</a>
<a href="blog/index.html">Blog</a>

<!-- From blog/post-1.html (one level deep) -->
<a href="../index.html">Home</a>
<a href="post-2.html">Next Post</a>
<a href="../images/logo.png">
  <img src="../images/logo.png" alt="Logo">
</a>
```

A genuinely common bug in multi-page projects: copying a page's HTML to create a new page, but forgetting to adjust relative paths for the new file's different location — always double-check paths after copying/moving files, exactly as flagged back in Module 03, Lesson 01.

---

# The Real Problem: Duplicated Shared Content

Here's the genuine limitation this lesson exposes, worth confronting directly. Every page in a real site typically shares the same `<header>`, `<nav>`, and `<footer>` (Module 06). With plain HTML, this means:

```html
<!-- index.html -->
<header>
  <nav>...</nav>
</header>
<!-- ...unique page content... -->
<footer>...</footer>

<!-- about.html -->
<header>
  <nav>...</nav>  <!-- identical, copy-pasted -->
</header>
<!-- ...unique page content... -->
<footer>...</footer>  <!-- identical, copy-pasted -->
```

This is genuinely tedious and error-prone: updating a navigation link means manually editing it in *every single HTML file* — a real maintenance burden that gets worse as a site grows.

---

# Why This Motivates What Comes Later

This is deliberately left unsolved in pure HTML — plain HTML has no native way to "include" one file's content inside another (no template system). This exact pain point is precisely what motivates:
- **Backend templating** (server-rendering shared layouts, Book 11+, Node.js/Express)
- **Frontend frameworks** (React's component reuse, Book 09) — recall Module 08's Web Components preview, which foreshadowed exactly this

Recognizing this limitation *now*, from genuine hands-on experience with the tedium, will make the motivation for templating/components in later books immediately obvious rather than abstract.

---

# A Partial Manual Mitigation (Still Pure HTML)

Until later books solve this properly, disciplined consistency is the only real mitigation: keep a single "master" version of shared header/footer HTML in a text file for easy copy-paste reference, and be rigorous about updating every page when shared content changes. Genuinely imperfect, but the honest current-toolset answer.

---

# Practical Example

my-site/
├── index.html (links to about.html, blog/index.html)
├── about.html (links back to index.html)
└── blog/
├── index.html (links to post-1.html, post-2.html, ../index.html)
├── post-1.html
└── post-2.html

---

# Revision Questions

1. Why do sections of a site (like a blog) commonly get their own subfolder with an `index.html`?
2. What's a genuinely common bug when copying an existing page to create a new one?
3. What real limitation does plain HTML have regarding shared content like headers/footers, and what later books solve it?

<details><summary>Answers</summary>

1. Because most servers automatically serve `index.html` when a folder is requested without a specific filename, making it the conventional default page for that section.
2. Forgetting to adjust relative paths for the new file's different location within the folder structure.
3. Plain HTML has no native way to "include" shared content across multiple files, requiring tedious manual duplication; backend templating (Node.js/Express, Book 11+) and frontend frameworks (React, Book 09) both solve this through component/template reuse.

</details>
EOF