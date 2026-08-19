# Lesson 03: Request / Response

## Learning Objectives
By the end of this lesson, you will be able to:
- Trace a complete page load as a sequence of requests and responses.
- Understand how a browser loads a page's additional assets after the initial HTML.
- Explain the difference between blocking and non-blocking resource loading.

---

# Introduction

Module 04 covered the mechanics of a single HTTP request/response. This lesson zooms out to show how a browser actually uses many requests and responses together to fully load a typical webpage — because a real page is never just one HTTP exchange.

---

# Loading a Page: More Than One Request

When you visit a webpage, the very first request retrieves the HTML document itself. But that HTML almost always references additional resources — CSS files, JavaScript files, images, fonts — each requiring its **own** separate HTTP request/response cycle.

A simple page might trigger a sequence like:
1. `GET /index.html` → HTML document returned
2. `GET /styles/main.css` → stylesheet returned
3. `GET /scripts/app.js` → JavaScript file returned
4. `GET /images/logo.png` → image returned
5. Several more requests for fonts, additional scripts, tracking scripts, etc.

Modern websites can easily trigger 50–100+ individual requests to fully load.

---

# Blocking vs. Non-Blocking Resources

Not all resources are treated equally by the browser while parsing HTML:

- **Render-blocking resources** — by default, CSS blocks rendering until it's fully downloaded and parsed (the browser doesn't want to show unstyled content). `<script>` tags, by default, also block HTML parsing entirely while they download and execute.
- **Non-blocking loading** — attributes like `async` and `defer` on `<script>` tags let JavaScript download without blocking HTML parsing, differing in exactly when the script executes relative to the rest of the page.

```html
<script src="app.js"></script>          <!-- blocks HTML parsing -->
<script src="app.js" async></script>     <!-- downloads in parallel, executes ASAP -->
<script src="app.js" defer></script>     <!-- downloads in parallel, executes after HTML parsing completes -->
```

---

# Why This Matters for Performance

Understanding request/response chains explains why website performance isn't just about server speed — it's about minimizing the number of requests, their size, and ensuring non-critical resources don't block the page from becoming visible and usable quickly. This becomes a much deeper topic once you reach performance optimization later in your learning path, but the conceptual foundation starts here.

---

# Practical Example

Open DevTools → Network tab → reload any real website → observe the full waterfall of individual requests, their timing, and which ones happen in parallel versus sequentially.

---

# Revision Questions

1. Why does loading a single webpage typically involve many separate HTTP requests?
2. What's the difference between `async` and `defer` on a `<script>` tag?
3. Why does CSS block rendering by default?

<details><summary>Answers</summary>

1. Because the initial HTML document usually references many additional resources (CSS, JS, images, fonts), each requiring its own separate request/response cycle.
2. `async` downloads the script in parallel and executes it as soon as it's ready (potentially interrupting HTML parsing); `defer` downloads in parallel but waits to execute until after HTML parsing is fully complete.
3. Browsers block rendering on CSS to avoid briefly showing unstyled content (a flash of unstyled content, or FOUC) before styles are applied.

</details>
