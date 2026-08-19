# Lesson 04: Web Storage API

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what localStorage and sessionStorage are and how they differ.
- Understand how Web Storage compares to cookies (Book 01).
- Recognize the basic API shape you'll use once you reach JavaScript.

---

# Introduction

This lesson connects directly back to Book 01, Module 05's cookies lesson — Web Storage is a more modern, JavaScript-focused alternative for storing data directly in the browser, without the overhead cookies carry.

---

# What Is Web Storage?

The **Web Storage API** provides two mechanisms for storing key-value data directly in the browser: **localStorage** and **sessionStorage**. Both are accessed and manipulated entirely through JavaScript (Book 04) — there's no HTML tag involved, but understanding the concept now sets up that later material, and it's genuinely foundational browser capability worth knowing exists.

---

# localStorage vs. sessionStorage

| | localStorage | sessionStorage |
|---|---|---|
| Persistence | Survives browser restarts, indefinitely | Cleared when the tab/browser closes |
| Scope | Shared across all tabs of the same origin | Isolated to a single tab |
| Typical use | User preferences, saved drafts, theme settings | Temporary form data, multi-step wizards |

---

# A Preview of the API (Book 04 Territory)

```javascript
// Storing data
localStorage.setItem('theme', 'dark');
sessionStorage.setItem('draftText', 'Hello, this is a draft...');

// Retrieving data
const theme = localStorage.getItem('theme'); // "dark"

// Removing data
localStorage.removeItem('theme');

// Clearing everything
localStorage.clear();
```

Both storage types share this exact same simple API shape — `setItem`, `getItem`, `removeItem`, `clear` — the only real difference between them is persistence duration and scope, as covered above.

---

# Web Storage vs. Cookies (Recall Book 01, Module 05)

This comparison genuinely matters, since both solve overlapping problems but for different purposes:

| | Cookies | Web Storage |
|---|---|---|
| Sent to server automatically? | Yes, with every HTTP request | No — stays purely client-side |
| Typical size limit | ~4KB | ~5-10MB (much larger) |
| Primary use case | Server-side session/auth data | Client-side app state, preferences |
| Accessed via | Both server (headers) and JavaScript | JavaScript only |

**The key distinction:** cookies are meant for data the *server* needs to see on every request (like a session ID, Book 01, Module 05, Lesson 06); Web Storage is meant for data that only the *browser/JavaScript* needs, with zero server involvement at all. Using localStorage for authentication tokens, for instance, is a common but genuinely debated security tradeoff you'll examine more closely once you reach backend authentication topics later in this roadmap.

---

# An Important Limitation: Strings Only

Web Storage can only store strings — storing complex data (objects, arrays) requires converting to and from JSON text:

```javascript
const user = { name: "Shrikant", role: "developer" };
localStorage.setItem('user', JSON.stringify(user));

const retrieved = JSON.parse(localStorage.getItem('user'));
console.log(retrieved.name); // "Shrikant"
```

`JSON.stringify()`/`JSON.parse()` are core JavaScript concepts you'll cover fully in Book 04 — filed away here as a preview of a pattern you'll use constantly.

---

# Practical Example (Conceptual, JavaScript Preview)

```javascript
// A theme toggle that remembers the user's preference across visits
const savedTheme = localStorage.getItem('theme') || 'light';
document.body.className = savedTheme;

function toggleTheme() {
  const newTheme = document.body.className === 'light' ? 'dark' : 'light';
  document.body.className = newTheme;
  localStorage.setItem('theme', newTheme);
}
```

---

# Revision Questions

1. What's the core difference in persistence between localStorage and sessionStorage?
2. Why is Web Storage generally preferred over cookies for purely client-side data?
3. What data type does Web Storage store natively, and how do you work around that limitation for objects?

<details><summary>Answers</summary>

1. localStorage persists indefinitely, surviving browser restarts; sessionStorage is cleared as soon as the tab or browser closes.
2. Because cookies are automatically sent with every HTTP request (adding overhead and being visible to the server), while Web Storage stays purely client-side with a much larger storage capacity — better suited for data the server doesn't need to see.
3. Only strings; objects/arrays must be converted using `JSON.stringify()` before storing and `JSON.parse()` after retrieving.

</details>
