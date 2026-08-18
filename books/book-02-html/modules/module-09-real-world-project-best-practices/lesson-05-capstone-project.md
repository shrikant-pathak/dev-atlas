cat > lesson-05-capstone-project.md << 'EOF'
# Lesson 05: Capstone Project

## Learning Objectives
By the end of this project, you will have:
- Built a complete, multi-page HTML website using every major concept from Book 02.
- Applied the Lesson 04 checklist to your own real work.
- Produced a genuine portfolio piece demonstrating pure-HTML competency, before CSS/JS are added in later books.

---

# Introduction

This is it — the culmination of Book 02. No new concepts are introduced in this lesson; instead, you'll build one real, complete, multi-page website using everything from Modules 01–09, then review it against Lesson 04's checklist. This project can (and should) later be styled with CSS in Book 03 and made interactive with JavaScript in Book 04 — but for now, it's a genuine test of pure structural, semantic, accessible HTML.

---

# The Project Brief: A Personal Portfolio Site

Build a **3-page personal portfolio website** — a genuinely common, practical real-world project type, and a strong foundation you'll keep improving throughout the rest of this roadmap.

## Required Pages

**1. `index.html` (Home)**
- Semantic page structure: `<header>` with `<nav>`, `<main>`, `<footer>` (Module 06)
- A hero section introducing yourself (`<h1>`, a short bio paragraph)
- A "Featured Projects" `<section>` listing 2-3 projects, each as an `<article>` (Module 06) with a title, description, and a link to more info
- At least one image with genuinely meaningful `alt` text (Module 03)

**2. `about.html`**
- Your background, written with correct heading hierarchy (Module 02)
- A `<dl>` (description list, Module 02) listing skills as term/definition pairs (e.g., "HTML" / "Structuring accessible, semantic web content")
- A `<table>` (Module 05) — genuinely tabular data, e.g., a simple work/education timeline with `<caption>`, `<thead>`, `<th scope="col">`

**3. `contact.html`**
- A contact `<form>` (Module 04) with: name (text), email (email type, required), message (`<textarea>`), and a submit `<button type="submit">`
- Every input properly labeled (Module 04, Lesson 03)
- Correct `method` for a contact form (POST — this sends data, even though there's no real backend yet, Book 01/11+ will handle that later)

## Shared Requirements (Every Page)

- [ ] Complete boilerplate: `<!DOCTYPE html>`, `lang`, `charset`, viewport (Module 01)
- [ ] Unique `<title>` and `<meta name="description">` per page (Module 07)
- [ ] Consistent `<nav>` linking all three pages, using correct relative paths (Module 03)
- [ ] Exactly one `<h1>` per page, no skipped heading levels
- [ ] Passes the W3C Validator with zero errors (Module 08)

---

# Suggested File Structure

portfolio-project/
├── index.html
├── about.html
├── contact.html
├── images/
│ └── (your images here)
└── favicon.png

---

# Step-by-Step Approach

1. **Plan first, code second** — sketch (even on paper) what content belongs on each page before writing any HTML, echoing the pseudocode/planning discipline from Book 01, Module 09.
2. **Build the boilerplate for all three pages first**, with correct shared navigation, before filling in unique content.
3. **Build one page fully**, applying every relevant module's lessons, before moving to the next.
4. **Run the Lesson 04 checklist against every page** once all three are drafted.
5. **Validate with the W3C Validator** (Module 08) and fix any flagged errors.
6. **Commit to your `dev-atlas` repo** — this is a genuine artifact worth keeping, following the Git workflow from Book 01, Module 08.

---

# Self-Assessment Rubric

| Criterion | What to Check |
|---|---|
| Semantic structure | Landmarks used correctly, no div soup |
| Accessibility | Labels, alt text, heading hierarchy all correct |
| Forms | Correctly labeled, correct method, correct button type |
| Tables | Used appropriately, with proper headers/caption |
| Paths & links | All working, secure external links, descriptive anchor text |
| Validation | Zero W3C validator errors |
| Consistency | Kebab-case naming, consistent indentation/quotes (Lesson 01) |

---

# What Happens Next

This project is deliberately left unstyled — plain, default-browser-styled HTML. That's intentional: Book 03 (CSS) will teach you to make this exact project visually polished and responsive, and Book 04 (JavaScript) will make the contact form and navigation genuinely interactive. Keep this project's files — you'll return to them directly.

---

# Revision Questions

1. Why does this capstone project deliberately avoid any CSS or JavaScript?
2. Name three specific Book 02 modules whose concepts are directly required by this project's brief.
3. What should you do immediately after completing all three pages, before considering the project finished?

<details><summary>Answers</summary>

1. Because Book 02 is specifically about HTML structure, semantics, and accessibility — CSS (Book 03) and JavaScript (Book 04) are separate concerns covered in their own dedicated books, and this project is meant to genuinely test pure-HTML competency first.
2. Any three of: Module 02 (headings, lists), Module 03 (images, paths, links), Module 04 (forms), Module 05 (tables), Module 06 (semantic structure), Module 07 (meta tags, accessibility).
3. Run it against the Lesson 04 code review checklist and the W3C Validator, fixing any issues found.

</details>

---

# 🏁 Module 09 Checkpoint — and Book 02 Completion

Before considering Book 02 complete, you should be able to:
- [ ] Write HTML following consistent, professional style conventions
- [ ] Structure a real multi-page site with correct paths and navigation
- [ ] Recognize and avoid every major mistake pattern covered across this book
- [ ] Apply a comprehensive code review checklist to your own work
- [ ] Have built and validated a complete, real 3-page portfolio project

**🎉 This completes Book 02 — HTML** (pending the full curriculum review pass).
**Next up:** Book 03 — CSS
EOF