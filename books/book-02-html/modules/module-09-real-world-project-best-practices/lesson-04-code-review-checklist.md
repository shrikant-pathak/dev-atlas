cat > lesson-04-code-review-checklist.md << 'EOF'
# Lesson 04: Code Review Checklist

## Learning Objectives
By the end of this lesson, you will be able to:
- Use a genuine, comprehensive checklist to review any HTML page before considering it complete.
- Understand code review as a real professional practice, not just an academic exercise.
- Apply this checklist to the capstone project in Lesson 05.

---

# Introduction

This lesson converts everything from Book 02 into one comprehensive, actionable checklist — genuinely usable on real projects, including the capstone you'll build in Lesson 05. This isn't new material; it's the culmination of the entire book, organized for practical use.

---

# What Is Code Review, and Why Does It Matter?

**Code review** is the practice of systematically checking code (your own, or a teammate's) against a set of standards before considering it finished — connecting directly back to Book 01, Module 08's Pull Request lifecycle, where review is a required step before merging. Professional teams review every single change; this lesson gives you the HTML-specific checklist to apply, whether reviewing your own solo work or eventually someone else's.

---

# The Complete Book 02 Checklist

**Document Structure (Module 01)**
- [ ] Valid `<!DOCTYPE html>` and `<html lang="...">`
- [ ] `<meta charset="UTF-8">` and viewport tag present
- [ ] Consistent, correct nesting — no improperly closed tags

**Content (Module 02)**
- [ ] Exactly one `<h1>`, no skipped heading levels
- [ ] Semantic text formatting used correctly (`<strong>`/`<em>` vs `<b>`/`<i>`)
- [ ] Correct list type chosen (`<ul>`/`<ol>`/`<dl>`)

**Links, Images, Media (Module 03)**
- [ ] All paths verified correct (relative/absolute, per Module 03/09-Lesson-02)
- [ ] Meaningful `alt` text on all informational images
- [ ] `target="_blank"` always paired with `rel="noopener noreferrer"`
- [ ] Descriptive anchor text, never "click here"

**Forms (Module 04)**
- [ ] Every input has a properly associated `<label>`
- [ ] Correct `method` (GET vs. POST) for the form's purpose
- [ ] Every `<button>` has an explicit `type`
- [ ] Client-side validation present, with the understanding server-side is still required

**Tables (Module 05)**
- [ ] `<table>` used only for genuinely tabular data
- [ ] `<th>` used for headers, with `scope` set appropriately
- [ ] `<caption>` present for non-trivial tables

**Semantic Structure (Module 06)**
- [ ] Semantic landmarks used (`<header>`, `<nav>`, `<main>`, `<footer>`) instead of div soup
- [ ] Exactly one `<main>`, never nested inside another landmark
- [ ] `<section>`/`<article>` chosen correctly (standalone test)

**Accessibility & SEO (Module 07)**
- [ ] ARIA used only where native HTML can't achieve the same result
- [ ] Unique `<title>` and `<meta name="description">`
- [ ] Open Graph tags present for shareable pages

**General (This Module)**
- [ ] Consistent indentation, naming (kebab-case), and quote style
- [ ] Passes the W3C Validator with no errors
- [ ] Passes a Lighthouse Accessibility audit with no major issues

---

# How to Actually Use This Checklist

Don't try to hold all of this in your head while writing — write first, then review systematically against this list afterward, exactly like a professional PR review. Over time, much of this becomes habit and you'll catch issues as you write rather than only in review — but even experienced developers still do an explicit final pass before considering work truly done.

---

# Practical Example

Take any HTML file you've built while working through this book so far — run it through this exact checklist, item by item, and note what would need fixing. This is genuinely the same exercise you'll perform on the Module 09 capstone project.

---

# Revision Questions

1. What professional practice from Book 01 does this checklist directly extend?
2. Why is it recommended to review against this checklist *after* writing, rather than trying to hold every rule in mind while writing?
3. Name three checklist items specifically related to accessibility.

<details><summary>Answers</summary>

1. Code review, as part of the Pull Request lifecycle (Book 01, Module 08).
2. Trying to consciously apply dozens of rules simultaneously while writing is cognitively overwhelming and slows down the actual work; a systematic post-write review catches issues more reliably and lets writing flow naturally.
3. Any three of: meaningful alt text, properly associated form labels, semantic landmarks over div soup, ARIA used only where native HTML can't achieve the same result, passing a Lighthouse Accessibility audit.

</details>
EOF