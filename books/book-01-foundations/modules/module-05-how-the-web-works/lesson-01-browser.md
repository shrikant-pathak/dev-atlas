cat > lesson-01-browser.md << 'EOF'
# Lesson 01: Browser

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a web browser actually is and its core responsibilities.
- Identify the major components inside a browser.
- Name the major browser engines and why they matter for web development.

---

# Introduction

You've learned how data travels across the Internet using DNS, IP addresses, and HTTP. But once that data — HTML, CSS, JavaScript — arrives, something has to turn it into the visual, interactive page you actually see and use. That "something" is the **browser**, arguably the single most important piece of software a web developer builds for.

---

# What a Browser Actually Does

A browser is a program that:
1. Takes a URL and initiates the full request cycle you learned in Module 04 (DNS lookup, HTTP request).
2. Receives HTML, CSS, JavaScript, images, and other assets from the server.
3. Parses and renders that content into a visual page.
4. Executes JavaScript to make the page interactive.
5. Manages ongoing state — cookies, cache, history, and more (covered later in this module).

---

# Core Components of a Browser

- **User Interface** — the address bar, back/forward buttons, bookmarks menu, etc.
- **Browser Engine** — coordinates between the UI and the rendering engine.
- **Rendering Engine** — parses HTML/CSS and paints pixels on screen (its own dedicated lesson follows this one).
- **JavaScript Engine** — executes JavaScript code (e.g., V8 in Chrome, SpiderMonkey in Firefox).
- **Networking** — handles HTTP requests, caching, and connection management.
- **Data Storage** — manages cookies, local storage, session storage, and cached files.

---

# Major Browsers and Their Engines

| Browser | Rendering Engine | JavaScript Engine |
|---|---|---|
| Chrome / Edge | Blink | V8 |
| Firefox | Gecko | SpiderMonkey |
| Safari | WebKit | JavaScriptCore |

Most modern browsers (Chrome, Edge, Opera, Brave) share the same **Blink** rendering engine, since they're all built on the open-source **Chromium** project. This is why cross-browser testing today mainly comes down to testing against Chromium-based browsers, Firefox, and Safari — three distinct rendering engines, not a dozen.

---

# Why This Matters for Developers

Different engines can render the same HTML/CSS slightly differently, or support different JavaScript features at different times — this is the root cause of "it works in Chrome but breaks in Safari" bugs you'll encounter throughout your career. Understanding that browsers aren't identical black boxes, but distinct implementations following (mostly) shared web standards, explains why cross-browser testing is a real, ongoing part of web development rather than a one-time task.

---

# Revision Questions

1. What are the five core components of a browser?
2. Why do many popular browsers behave similarly despite having different names?
3. Name the rendering engine and JavaScript engine used by Firefox.

<details><summary>Answers</summary>

1. User Interface, Browser Engine, Rendering Engine, JavaScript Engine, Networking, and Data Storage.
2. Because many of them (Chrome, Edge, Opera, Brave) are built on the same open-source Chromium project and share the Blink rendering engine.
3. Firefox uses the Gecko rendering engine and the SpiderMonkey JavaScript engine.

</details>
EOF