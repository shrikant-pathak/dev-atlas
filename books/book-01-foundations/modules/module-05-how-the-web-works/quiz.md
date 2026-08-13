cat > quiz.md << 'EOF'
# Quiz — How the Web Works

## Multiple Choice
1. What rendering engine does Chrome use?
   a) Gecko  b) WebKit  c) Blink  d) Trident

2. Which of these combines the DOM and CSSOM?
   a) Render Tree  b) Paint Tree  c) Script Tree  d) Cache Tree

3. Which script attribute executes only after HTML parsing completes?
   a) async  b) defer  c) sync  d) none of these

4. Which cookie attribute prevents JavaScript from accessing it?
   a) Secure  b) SameSite  c) HttpOnly  d) Max-Age

---

## True / False
1. A static website generates different content for every visitor. (True/False)
2. Session data is typically stored server-side, with only a session ID stored in the browser cookie. (True/False)
3. `Cache-Control: no-store` allows caching as long as the browser revalidates first. (True/False)

---

## Short Answer
1. Explain, step by step, the critical rendering path.
2. Why might a developer choose token-based authentication over session-based authentication?
3. What's the practical difference between browser cache and CDN cache?

---

## Coding Questions
1. Write an HTML `<script>` tag that loads `app.js` without blocking HTML parsing, executing only after parsing completes.
2. Write an example `Cache-Control` header value that tells the browser to cache a resource for exactly one hour.

<details><summary>Answers</summary>

**Multiple Choice:** 1-c, 2-a, 3-b, 4-c

**True/False:** 1-False (static sites serve the same content to everyone), 2-True, 3-False (no-store prevents caching entirely; no-cache is the one that allows caching with revalidation)

**Coding Question 1:** `<script src="app.js" defer></script>`

**Coding Question 2:** `Cache-Control: max-age=3600`

</details>
EOF