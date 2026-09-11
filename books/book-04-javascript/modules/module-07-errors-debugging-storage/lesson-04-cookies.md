# Lesson 4: Cookies

## Learning Objectives
- Understand what cookies are and how they differ from Web Storage
- Read and write cookies via `document.cookie`
- Understand cookie attributes: `expires`, `max-age`, `path`, `domain`, `Secure`, `SameSite`, `HttpOnly`
- Understand when cookies are sent to the server automatically
- Know when to use cookies vs. `localStorage`/`sessionStorage`

## Introduction

Before `localStorage` existed (it arrived with HTML5 in the early 2010s), **cookies** were the only way to persist small bits of data in the browser — and they're still essential today for a very specific reason Web Storage doesn't cover: cookies are automatically sent to the server with every matching HTTP request. This makes them central to authentication and session management, even in modern apps built with React, Vue, or React Native's WebView-based flows.

## 1. What is a cookie?

A cookie is a small piece of data (typically under 4KB) stored by the browser and associated with a specific domain. Unlike `localStorage`, which lives only in JavaScript's reach, cookies are automatically attached to the `Cookie` HTTP header on every request to their matching domain — including page loads, `fetch()` calls, and image requests.

## 2. Reading and writing with `document.cookie`

The API is notoriously awkward — `document.cookie` looks like a normal property but behaves specially:

```javascript
document.cookie = 'username=Sam'; // sets ONE cookie — does not overwrite others!
document.cookie = 'theme=dark';   // adds a second, separate cookie

console.log(document.cookie); // 'username=Sam; theme=dark' — ALL cookies, as one string
```

Reading `document.cookie` always returns every cookie for the current page as a single semicolon-separated string — there's no built-in `getItem`/`setItem` like Web Storage has. You have to parse it yourself:

```javascript
function getCookie(name) {
  const cookies = document.cookie.split('; ');
  for (const cookie of cookies) {
    const [key, value] = cookie.split('=');
    if (key === name) return decodeURIComponent(value);
  }
  return null;
}

console.log(getCookie('username')); // 'Sam'
```

## 3. Cookie attributes

Attributes are appended to the same string, separated by semicolons:

```javascript
document.cookie = 'sessionId=abc123; expires=Fri, 31 Dec 2026 23:59:59 GMT; path=/; Secure; SameSite=Strict';
```

| Attribute | Meaning |
|---|---|
| `expires` | Exact date the cookie is deleted. Omitted = "session cookie," deleted when the browser closes. |
| `max-age` | Lifetime in seconds from now — often preferred over `expires` since it doesn't require formatting a date. |
| `path` | Which URL paths on the domain get this cookie (default: current path). |
| `domain` | Which (sub)domains get this cookie. |
| `Secure` | Only sent over HTTPS. |
| `SameSite` | Controls cross-site sending: `Strict` (never cross-site), `Lax` (default in modern browsers — allows some safe cross-site cases like top-level navigation), `None` (always sent, requires `Secure`). |
| `HttpOnly` | **Cannot be set via `document.cookie`** — only settable by the server via the `Set-Cookie` response header. Blocks all JavaScript access, protecting against theft via XSS. |

```javascript
// max-age example: expires in 1 hour (3600 seconds)
document.cookie = 'theme=dark; max-age=3600; path=/';
```

## 4. Deleting a cookie

There's no `deleteCookie()` — you delete a cookie by re-setting it with an already-expired date:

```javascript
function deleteCookie(name) {
  document.cookie = `${name}=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/`;
}

deleteCookie('username');
```

## 5. `HttpOnly` cookies and why you'll never see them in JS

If you inspect `document.cookie` and a cookie you know exists (like a session token) isn't there, it's very likely `HttpOnly`. Servers set these via the `Set-Cookie` response header, and browsers deliberately hide them from JavaScript entirely — this is a security measure so that a cross-site scripting (XSS) bug can't be used to steal an auth token. As a frontend developer, you'll mostly interact with non-`HttpOnly` cookies (like a theme preference) directly, and let the server manage `HttpOnly` session cookies invisibly.

## 6. Cookies vs. Web Storage — when to use which

| | Cookies | localStorage/sessionStorage |
|---|---|---|
| Sent to server automatically | Yes, every matching request | No — must be sent manually (e.g., in a header) |
| Size limit | ~4KB | ~5-10MB |
| Accessible to JS | Yes, unless `HttpOnly` | Always |
| Typical use | Auth/session tokens, server-read data | UI preferences, cached data, draft state |

**Rule of thumb:** if the server needs to read the value on every request (like "is this user logged in?"), use a cookie. If it's purely for the frontend's own use, `localStorage`/`sessionStorage` (Lesson 3) is simpler and has far more room.

## Practical Example

A small cookie utility module, plus a consent-banner example showing real attribute usage:

```javascript
const CookieUtil = {
  set(name, value, days = 7) {
    const maxAge = days * 24 * 60 * 60; // convert days to seconds
    document.cookie = `${encodeURIComponent(name)}=${encodeURIComponent(value)}; max-age=${maxAge}; path=/; SameSite=Lax`;
  },

  get(name) {
    const match = document.cookie
      .split('; ')
      .find(row => row.startsWith(`${encodeURIComponent(name)}=`));
    return match ? decodeURIComponent(match.split('=')[1]) : null;
  },

  remove(name) {
    document.cookie = `${encodeURIComponent(name)}=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/`;
  },
};

// Cookie consent banner logic
function initCookieConsent() {
  if (CookieUtil.get('cookieConsent') === null) {
    showConsentBanner();
  }
}

function acceptCookies() {
  CookieUtil.set('cookieConsent', 'accepted', 365); // remember for a year
  hideConsentBanner();
}

function showConsentBanner() { console.log('Showing consent banner'); }
function hideConsentBanner() { console.log('Hiding consent banner'); }

initCookieConsent();
```

## Revision Questions

<details>
<summary>1. What is the single biggest functional difference between cookies and `localStorage`?</summary>

Cookies are automatically included in the HTTP request to their matching domain on every page load, `fetch()` call, etc. `localStorage` is never sent to the server automatically — it stays purely client-side unless the app explicitly reads and sends it.
</details>

<details>
<summary>2. Why can't you delete a cookie directly?</summary>

There's no delete API for cookies — you overwrite the cookie with the same name but set its expiration date to a time in the past, which causes the browser to discard it.
</details>

<details>
<summary>3. What does the `HttpOnly` attribute do, and why can't you set it from JavaScript?</summary>

It prevents the cookie from being accessed via `document.cookie` at all. It can only be set by the server through the `Set-Cookie` response header — this protects sensitive cookies (like session tokens) from being stolen via a cross-site scripting attack.
</details>

<details>
<summary>4. What's the difference between `SameSite=Strict` and `SameSite=Lax`?</summary>

`Strict` never sends the cookie on any cross-site request. `Lax` (the modern default) allows it in some safe cross-site scenarios, like when a user clicks a link that navigates to your site from another site.
</details>

<details>
<summary>5. If you need the server to check a user's login state on every request, should you use a cookie or `localStorage`? Why?</summary>

A cookie — because it's automatically attached to every matching HTTP request, letting the server check it without any extra work from the frontend. `localStorage` isn't sent automatically, so the frontend would need to manually attach it to every request itself.
</details>
