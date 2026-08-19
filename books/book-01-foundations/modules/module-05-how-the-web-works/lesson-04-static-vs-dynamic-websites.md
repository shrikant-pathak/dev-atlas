# Lesson 04: Static vs. Dynamic Websites

## Learning Objectives
By the end of this lesson, you will be able to:
- Distinguish between static and dynamic websites.
- Explain how content is generated differently in each approach.
- Identify real-world examples and tradeoffs of each.

---

# Introduction

Not every website works the same way behind the scenes. Some send the exact same HTML to every visitor; others build custom HTML on the fly for each request. Understanding this distinction sets up concepts you'll meet constantly once you reach backend development and frameworks like Next.js later in this roadmap.

---

# Static Websites

A **static website** serves pre-built HTML, CSS, and JavaScript files exactly as they are stored — no server-side processing generates the content per request. The same file is sent to every visitor, every time (unless the file itself is updated).

**Characteristics:**
- Fast, since there's no server-side computation required per request
- Simple and cheap to host (can even be served from a CDN with no traditional server at all)
- Content only changes when the underlying files are manually updated and redeployed

**Examples:** a portfolio site, a documentation page, a marketing landing page.

---

# Dynamic Websites

A **dynamic website** generates HTML on the server for each request, often based on a database, user session, or other real-time data. The same URL can produce different content depending on who's asking and when.

**Characteristics:**
- Content can be personalized (e.g., "Welcome back, Shrikant")
- Requires server-side logic (a backend, covered extensively later in this roadmap) and typically a database
- Slightly slower per-request than static content, since work happens at request time

**Examples:** a social media feed, an e-commerce product page with live pricing/inventory, a logged-in dashboard.

---

# Comparison

| | Static | Dynamic |
|---|---|---|
| Content generation | Pre-built, same for everyone | Generated per request |
| Speed | Very fast | Depends on server/database logic |
| Personalization | None | Possible |
| Hosting complexity | Simple (even just files + CDN) | Requires a server/backend |
| Example | Portfolio site | E-commerce dashboard |

---

# The Modern Middle Ground

Modern frameworks (which you'll meet in Book 10 — Next.js) blur this line intentionally, offering:
- **Static Site Generation (SSG)** — pages are pre-built at deploy time, like a static site, but from dynamic data sources.
- **Server-Side Rendering (SSR)** — pages are dynamically generated per request, like a traditional dynamic site, but using modern frontend frameworks.

Understanding the pure static vs. dynamic distinction now makes these more advanced hybrid approaches much easier to grasp later.

---

# Revision Questions

1. What's the core difference between a static and a dynamic website?
2. Why might a portfolio site be a good candidate for a static approach?
3. Why does a dynamic website typically require a database?

<details><summary>Answers</summary>

1. A static website serves the same pre-built content to every visitor; a dynamic website generates content on the server for each request, often based on real-time or user-specific data.
2. Because its content rarely changes and doesn't need personalization — a static approach is faster, simpler, and cheaper to host.
3. Because dynamic content (like a user's data or live inventory) needs to be stored and retrieved somewhere reliably, which is exactly what a database is for.

</details>
