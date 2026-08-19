# Lesson 07: Cache

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what caching is and why it improves web performance.
- Identify different types of caches involved in loading a webpage.
- Understand common cache-control mechanisms.

---

# Introduction

This final lesson of Module 05 covers **caching** — a concept quietly involved in almost every part of what you've learned so far in this module, from DNS lookups to asset loading. Caching is one of the most impactful, foundational ideas in all of web performance.

---

# What Is Caching?

**Caching** means storing a copy of data somewhere faster to access, so future requests for that same data don't need to repeat the full (often slower) process of fetching or generating it again.

You've actually already encountered caching earlier in this roadmap:
- DNS caching (Module 04, Lesson 04) — avoiding repeated DNS lookups for the same domain.
- Browser caching of previously loaded pages when using the back/forward buttons.

---

# Types of Caches in Web Development

- **Browser cache** — stores downloaded assets (images, CSS, JS files) locally, so revisiting a site doesn't require re-downloading unchanged files.
- **CDN cache** — Content Delivery Networks cache copies of static assets across servers worldwide, serving users from a nearby location rather than the original server every time.
- **Server-side cache** — a server might cache the results of expensive database queries or computations, avoiding repeated work for identical requests.
- **DNS cache** — as covered in Module 04, caching domain-to-IP lookups at multiple levels.

---

# Cache-Control Headers

Servers can specify exactly how a browser should cache a given resource using the `Cache-Control` HTTP header:

Cache-Control: max-age=3600
Cache-Control: no-cache
Cache-Control: no-store

- `max-age=3600` — cache this resource for 3600 seconds (1 hour) before checking for a newer version.
- `no-cache` — the browser can cache it, but must revalidate with the server before using the cached copy.
- `no-store` — never cache this resource at all (common for sensitive, private data).

---

# Cache Invalidation

One of the classic hard problems in computer science is knowing *when* to update a cache. Common strategies include:
- **Time-based expiration** — cache expires automatically after a set duration (`max-age`).
- **Versioned filenames** — assets include a hash or version in their filename (e.g., `app.a3f9c2.js`), so updating the file's content automatically changes its URL, forcing a fresh download without needing to wait for expiration.

---

# Why This Matters

Caching directly affects real-world website speed, server costs, and user experience. A well-cached site loads near-instantly for repeat visitors and reduces load on your servers; a poorly cached (or over-cached, serving stale content) site can feel slow or show outdated information. This is a foundational concept you'll return to repeatedly, especially once you reach deployment and performance topics later in this roadmap.

---

# Practical Example

Open DevTools → Network tab → reload a page twice → notice some requests show "(from disk cache)" or "(from memory cache)" instead of a fresh network request.

---

# Revision Questions

1. What problem does caching solve?
2. What's the difference between `Cache-Control: no-cache` and `Cache-Control: no-store`?
3. How does using a versioned filename (like `app.a3f9c2.js`) help with cache invalidation?

<details><summary>Answers</summary>

1. It avoids repeating slow or expensive work (like downloading a file again or re-running a database query) by storing and reusing a previously fetched or computed result.
2. `no-cache` allows caching but requires revalidation with the server before using the cached copy; `no-store` prevents caching entirely.
3. Since the filename changes whenever the file's content changes, browsers naturally treat it as a brand-new resource to download, bypassing the old cached version without needing to wait for a cache expiration time.

</details>

---

# 🏁 Module 05 Checkpoint

Before moving to Module 06, you should be able to:
- [ ] Explain what a browser does internally, from receiving HTML to rendering pixels
- [ ] Describe the critical rendering path (DOM, CSSOM, render tree, layout, paint)
- [ ] Explain how a page load involves many separate HTTP requests
- [ ] Distinguish static vs. dynamic websites
- [ ] Explain cookies, sessions, and caching, and how they relate to each other

**Next up:** Module 06 — Developer Environment
