cat > exercises.md << 'EOF'
# Exercise Set — How the Web Works

## Easy
- [ ] Name the rendering engine and JavaScript engine used by Chrome.
- [ ] What's the difference between the DOM and the CSSOM?
- [ ] What is a cookie, and why does it exist given that HTTP is stateless?
- [ ] Give one example each of a static website and a dynamic website.

---

## Medium
- [ ] Explain the full critical rendering path, from receiving HTML to pixels on screen.
- [ ] What's the difference between `async` and `defer` on a script tag, and when would you use each?
- [ ] Explain the relationship between cookies and sessions — why does a session ID get stored as a cookie rather than the whole session?
- [ ] What's the difference between `Cache-Control: no-cache` and `Cache-Control: no-store`?

---

## Hard
- [ ] A webpage feels laggy whenever the user scrolls, and DevTools shows constant "Layout" and "Paint" events. Explain what's likely happening and why.
- [ ] Compare session-based and token-based authentication. In what scenario would token-based auth be clearly preferable?
- [ ] Explain how versioned filenames (e.g., `app.a3f9c2.js`) solve the cache invalidation problem without needing to reduce `max-age`.

---

## Bonus
- [ ] Research and explain what a Service Worker is and how it relates to caching, beyond standard browser/CDN caching.
EOF