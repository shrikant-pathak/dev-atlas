# Lesson 06: Web Components Intro & Validation Tools

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what Web Components are, at a conceptual level.
- Use the W3C HTML validator to check a page's correctness.
- Understand where HTML's native capabilities end and frameworks (Book 09+) begin.

---

# Introduction

This final lesson of Module 08 covers two things: a genuine glimpse of HTML's most advanced native capability (Web Components — custom, reusable elements), and a genuinely practical everyday tool (HTML validation) that closes out this module on solid, actionable ground.

---

# What Are Web Components?

**Web Components** is a set of native browser technologies letting you create your own custom, reusable HTML elements — with their own encapsulated behavior, styling, and structure — usable in HTML just like any built-in element:

```html
<user-card name="Shrikant Pathak" role="Developer"></user-card>
```

This isn't a real built-in HTML element — it's a genuine **custom element**, defined once (via JavaScript, using the `customElements.define()` API — full depth well beyond this book's HTML-focused scope) and then usable anywhere in your HTML, exactly like `<div>` or `<button>`.

---

# Why This Matters Conceptually (Even Before You Can Build One)

This is worth understanding *now*, conceptually, because it directly foreshadows Book 09 (React) and modern frontend frameworks: frameworks like React are fundamentally built around this same core idea — **reusable, custom, encapsulated components** — just with additional tooling, syntax, and ecosystem built on top. Web Components are the *native, framework-free* version of the same concept you'll spend enormous time on once you reach Book 09.

Understanding this connection now means React's component model won't feel like an entirely foreign concept later — it's the same underlying idea (custom, reusable, encapsulated pieces of UI) that HTML itself has natively supported since Web Components were standardized.

---

# Validation Tools: The W3C Markup Validator

A genuinely practical, right-now-useful tool: the **W3C Markup Validation Service** (validator.w3.org) checks any HTML page against the official HTML specification, flagging genuine errors — unclosed tags, invalid nesting, missing required attributes, and more.

**Why this matters, even though browsers are forgiving:**
Recall from Module 01, Lesson 03 — browsers try to automatically fix malformed HTML, silently. This forgiveness is convenient, but it means genuine mistakes can go completely unnoticed, since the page still *looks* fine. A validator catches these silent errors explicitly, before they cause subtler problems (inconsistent rendering across different browsers, unpredictable behavior once JavaScript starts manipulating the DOM in Book 04).

**How to use it:**
1. Visit validator.w3.org
2. Paste your HTML, upload a file, or provide a live URL
3. Review the flagged errors and warnings

Running your pages through this validator periodically — especially once you build the capstone project in Module 09 — is genuinely good professional practice, not just an academic exercise.

---

# Where HTML's Native Capabilities End

This module has previewed several genuinely advanced native browser capabilities (canvas, SVG, drag & drop, Web Storage, geolocation, Web Components) — and it's worth being honest about scope: real-world interactive applications almost always combine HTML's structure with JavaScript's logic (Book 04) and often a framework's component model (Book 09+) to become fully realized. HTML alone provides the vocabulary and hooks; the behavior and interactivity built on top of it is where the rest of this roadmap goes next.

---

# Practical Example

Take any `.html` file you've built throughout this book and run it through validator.w3.org right now — a genuinely useful, immediately actionable habit to start building before moving to Module 09's capstone project.

---

# Revision Questions

1. What are Web Components, conceptually, and what does the `<user-card>` example represent?
2. How do Web Components foreshadow what you'll learn in Book 09 (React)?
3. Why does HTML validation matter, even though browsers silently "fix" malformed HTML on their own?

<details><summary>Answers</summary>

1. A set of native browser technologies for creating custom, reusable HTML elements with their own encapsulated behavior and structure; `<user-card>` represents a genuine custom element, not a built-in one, defined via JavaScript and then usable like any native HTML tag.
2. Frameworks like React are built around the same core idea — reusable, custom, encapsulated components — just with additional tooling and syntax layered on top of this same native concept.
3. Because browser forgiveness means genuine markup errors can go completely unnoticed (the page still looks fine visually), while potentially causing subtler problems like inconsistent cross-browser rendering or unpredictable behavior once JavaScript manipulates the DOM.

</details>

---

# 🏁 Module 08 Checkpoint

Before moving to Module 09, you should be able to:
- [ ] Explain the difference between `<canvas>` and `<svg>`, and when to use each
- [ ] Recognize the Drag & Drop API's HTML attribute and general event pattern
- [ ] Explain localStorage vs. sessionStorage, and how Web Storage differs from cookies
- [ ] Understand the Geolocation API's permission model and UX best practices
- [ ] Explain Web Components conceptually and how they foreshadow frameworks like React
- [ ] Use the W3C Markup Validator to check a real HTML page

**Next up:** Module 09 — Real-World Project & Best Practices
