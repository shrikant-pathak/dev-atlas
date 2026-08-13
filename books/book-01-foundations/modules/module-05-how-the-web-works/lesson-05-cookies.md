cat > lesson-05-cookies.md << 'EOF'
# Lesson 05: Cookies

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what cookies are and the problem they solve.
- Describe the different types of cookies and their attributes.
- Understand basic cookie security considerations.

---

# Introduction

Back in Module 04, you learned that HTTP is **stateless** — each request is independent, with no built-in memory of previous ones. But real websites clearly do remember things: they keep you logged in, remember items in your cart, and track preferences. **Cookies** are one of the primary tools that make this possible.

---

# What Is a Cookie?

A **cookie** is a small piece of data (typically under 4KB) that a server sends to a browser, which the browser then stores and automatically sends back with every subsequent request to that same domain. This is how a stateless protocol can maintain the illusion of "memory" across requests.

Set-Cookie: sessionId=abc123; Max-Age=3600; HttpOnly; Secure

---

# How Cookies Work, Step by Step

1. You log into a website; the server generates a unique session identifier.
2. The server sends this identifier back to your browser via a `Set-Cookie` header.
3. Your browser stores this cookie.
4. On every subsequent request to that domain, the browser automatically includes the cookie in the request headers.
5. The server reads the cookie to recognize who you are, without you needing to log in again on every single page.

---

# Common Cookie Attributes

- **Expires / Max-Age** — how long the cookie persists before being automatically deleted.
- **HttpOnly** — prevents JavaScript from accessing the cookie, protecting against certain attacks (like cross-site scripting).
- **Secure** — the cookie is only sent over HTTPS connections, never plain HTTP.
- **SameSite** — controls whether the cookie is sent along with cross-site requests, an important defense against certain attacks (like cross-site request forgery).

---

# Types of Cookies

- **Session cookies** — deleted automatically when the browser closes (no `Expires`/`Max-Age` set).
- **Persistent cookies** — remain until their specified expiration date, even after the browser closes.
- **First-party cookies** — set by the website you're actually visiting.
- **Third-party cookies** — set by a different domain than the one you're visiting (commonly used for cross-site advertising tracking, and increasingly restricted by modern browsers for privacy reasons).

---

# Practical Example

Open DevTools → Application tab → Cookies → select a domain to see all cookies currently stored for that site, including their attributes.

---

# Revision Questions

1. What problem do cookies solve, given that HTTP is stateless?
2. What does the `HttpOnly` attribute protect against?
3. What's the difference between a session cookie and a persistent cookie?

<details><summary>Answers</summary>

1. They let a server "remember" information about a user (like login state) across otherwise-independent HTTP requests, working around HTTP's stateless nature.
2. It prevents JavaScript from accessing the cookie's value, reducing the risk of the cookie being stolen through cross-site scripting attacks.
3. A session cookie is deleted when the browser closes; a persistent cookie remains stored until a specified expiration date, even after the browser is closed and reopened.

</details>
EOF