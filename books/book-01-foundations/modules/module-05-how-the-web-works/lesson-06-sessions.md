# Lesson 06: Sessions

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a session is and how it differs from a cookie.
- Describe how server-side sessions typically work.
- Understand the tradeoffs between session-based and token-based authentication.

---

# Introduction

The last lesson covered cookies — small pieces of data stored in the browser. This lesson covers **sessions** — the server-side concept that cookies often support. It's a subtle but important distinction: a cookie is a storage mechanism, while a session is the actual concept of tracking a user's ongoing interaction with a site.

---

# What Is a Session?

A **session** represents a period of continuous interaction between a user and a website — typically starting when they log in and ending when they log out or their session expires. The server needs some way to associate each incoming request with the correct user's session data (their identity, permissions, cart contents, etc.).

---

# How Server-Side Sessions Typically Work

1. A user logs in successfully.
2. The server creates a **session** — a record stored server-side (often in memory, a database, or a fast cache like Redis) containing that user's data.
3. The server generates a unique **session ID** and sends it to the browser as a cookie.
4. On each subsequent request, the browser sends that session ID cookie back.
5. The server looks up the session ID in its storage to retrieve the associated user data — without needing to re-authenticate the user on every request.

This is why cookies and sessions are so closely linked: the cookie is typically just the "key" (the session ID); the actual session data lives securely on the server, not in the cookie itself.

---

# Session-Based vs. Token-Based Authentication

| | Session-Based | Token-Based (e.g., JWT) |
|---|---|---|
| Where data lives | Server-side storage | Encoded directly in the token itself |
| Server storage needed? | Yes | No (typically) |
| Scalability | Requires shared session storage across servers | Easier to scale across multiple servers |
| Revocation | Easy (just delete the server-side session) | Harder (token remains valid until it expires) |

You'll cover token-based authentication (particularly JWTs) in much more depth once you reach the backend books (Node.js, Express) later in this roadmap — but understanding the session-based approach first makes token-based auth's tradeoffs much clearer.

---

# Practical Example

Open DevTools → Application tab → Cookies → look for a cookie often named something like `sessionId`, `connect.sid`, or `PHPSESSID` — a strong sign the site is using server-side session-based authentication.

---

# Revision Questions

1. What's the difference between a cookie and a session?
2. Why is a session ID typically stored as a cookie rather than the entire session data itself?
3. Name one advantage of token-based authentication over session-based authentication.

<details><summary>Answers</summary>

1. A cookie is a small piece of data stored in the browser; a session is the server-side concept of tracking a user's ongoing interaction, often referenced via a session ID stored in a cookie.
2. Because storing sensitive session data directly in a cookie would expose it to the client and to interception; keeping it server-side and only sharing a reference (the session ID) is more secure and controllable.
3. Token-based authentication typically doesn't require server-side storage, making it easier to scale across multiple servers without needing shared session storage.

</details>
