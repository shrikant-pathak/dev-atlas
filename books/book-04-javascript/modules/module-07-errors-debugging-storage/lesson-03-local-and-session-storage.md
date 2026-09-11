# Lesson 3: Local and Session Storage

## Learning Objectives
- Understand the Web Storage API (`localStorage` and `sessionStorage`)
- Store, retrieve, update, and remove data
- Understand the difference between `localStorage` and `sessionStorage`
- Understand storage limitations (strings only, size limits, same-origin)
- Store and retrieve structured data using `JSON.stringify`/`JSON.parse`
- Listen for the `storage` event across tabs

## Introduction

Modules 04 and 05 covered reading data from the DOM and from a server. But sometimes you want to persist small amounts of data directly in the browser — a theme preference, a draft form, an auth token — without hitting a server at all. The **Web Storage API** provides two simple, synchronous key-value stores for exactly this: `localStorage` and `sessionStorage`.

## 1. `localStorage` basics

```javascript
localStorage.setItem('theme', 'dark');
console.log(localStorage.getItem('theme')); // 'dark'

localStorage.removeItem('theme');
console.log(localStorage.getItem('theme')); // null — key no longer exists

localStorage.setItem('theme', 'dark');
localStorage.clear(); // removes EVERYTHING in localStorage for this origin
```

Data in `localStorage` persists indefinitely — it survives page reloads, browser restarts, even the computer restarting. It's only cleared when explicitly removed by code or by the user clearing site data.

## 2. `sessionStorage` basics

Identical API, different lifetime:

```javascript
sessionStorage.setItem('draftMessage', 'Hello, I wanted to...');
console.log(sessionStorage.getItem('draftMessage'));
```

`sessionStorage` is cleared automatically when the **tab** is closed. Each tab also gets its own independent `sessionStorage`, even for the same site — opening the same page in two tabs gives two separate `sessionStorage` instances (unlike `localStorage`, which is shared across all tabs of the same origin).

| | `localStorage` | `sessionStorage` |
|---|---|---|
| Lifetime | Until explicitly cleared | Until the tab closes |
| Shared across tabs? | Yes (same origin) | No — per tab |
| Typical use | Theme, saved preferences, cached data | Draft form data, wizard/multi-step state |

## 3. Storage only holds strings

This is the most common source of bugs with Web Storage: every value is coerced to a string.

```javascript
localStorage.setItem('count', 5);
console.log(localStorage.getItem('count'));        // '5' — a string, not a number!
console.log(typeof localStorage.getItem('count')); // 'string'

localStorage.setItem('user', { name: 'Sam' });
console.log(localStorage.getItem('user')); // '[object Object]' — NOT useful!
```

## 4. Storing structured data with JSON

To store objects or arrays properly, serialize with `JSON.stringify()` on the way in and parse with `JSON.parse()` on the way out — same functions you used with `fetch()` responses in Module 05:

```javascript
const user = { name: 'Sam', age: 28, preferences: { theme: 'dark' } };

localStorage.setItem('user', JSON.stringify(user));

const stored = JSON.parse(localStorage.getItem('user'));
console.log(stored.name);              // 'Sam'
console.log(stored.preferences.theme); // 'dark'
```

A safe helper pattern, guarding against missing keys with optional chaining/nullish coalescing (Module 06, Lesson 3):

```javascript
function getStoredUser() {
  const raw = localStorage.getItem('user');
  return raw ? JSON.parse(raw) : null;
}

function saveUser(user) {
  localStorage.setItem('user', JSON.stringify(user));
}
```

## 5. Checking for a key's existence

```javascript
if (localStorage.getItem('theme') !== null) {
  console.log('Theme preference exists');
}

// Iterating all keys
for (let i = 0; i < localStorage.length; i++) {
  const key = localStorage.key(i);
  console.log(key, '=', localStorage.getItem(key));
}
```

## 6. Storage limits and same-origin restriction

- Storage is scoped per **origin** (protocol + domain + port) — `https://app.com` and `https://api.app.com` have completely separate storage, and so do `http://` vs `https://` versions of the same domain.
- Most browsers cap each origin around **5–10MB** combined for `localStorage`. Exceeding it throws a `QuotaExceededError` — worth wrapping storage writes in `try`/`catch` (Lesson 1) for production code.
- Storage is synchronous and blocks the main thread — avoid storing very large amounts of data or doing it in a hot loop.

```javascript
function safeSetItem(key, value) {
  try {
    localStorage.setItem(key, value);
    return true;
  } catch (error) {
    if (error instanceof DOMException && error.name === 'QuotaExceededError') {
      console.error('Storage quota exceeded');
    }
    return false;
  }
}
```

## 7. The `storage` event

When `localStorage` changes in **one tab**, other open tabs of the same origin can react via the `storage` event — this does NOT fire in the tab that made the change, only in other tabs:

```javascript
window.addEventListener('storage', (event) => {
  console.log('Key changed:', event.key);
  console.log('Old value:', event.oldValue);
  console.log('New value:', event.newValue);
});
```

This is commonly used to sync login/logout state across multiple open tabs of the same app.

## Practical Example

A small preferences manager combining safe JSON storage, error handling, and cross-tab sync:

```javascript
const PREFS_KEY = 'app_preferences';

function loadPreferences() {
  try {
    const raw = localStorage.getItem(PREFS_KEY);
    return raw ? JSON.parse(raw) : { theme: 'light', fontSize: 16 };
  } catch (error) {
    console.warn('Could not parse stored preferences, using defaults');
    return { theme: 'light', fontSize: 16 };
  }
}

function savePreferences(prefs) {
  try {
    localStorage.setItem(PREFS_KEY, JSON.stringify(prefs));
    return true;
  } catch (error) {
    console.error('Failed to save preferences:', error.message);
    return false;
  }
}

function updateTheme(theme) {
  const prefs = loadPreferences();
  prefs.theme = theme;
  savePreferences(prefs);
  applyTheme(theme);
}

function applyTheme(theme) {
  console.log(`Applying ${theme} theme`);
}

// Keep other tabs in sync when preferences change elsewhere
window.addEventListener('storage', (event) => {
  if (event.key === PREFS_KEY && event.newValue) {
    const updated = JSON.parse(event.newValue);
    applyTheme(updated.theme);
  }
});

const current = loadPreferences();
console.log('Current preferences:', current);
updateTheme('dark');
```

## Revision Questions

<details>
<summary>1. What's the key lifetime difference between `localStorage` and `sessionStorage`?</summary>

`localStorage` persists indefinitely until explicitly cleared, and is shared across all tabs of the same origin. `sessionStorage` is cleared when its tab closes and is isolated per tab, even for the same site.
</details>

<details>
<summary>2. Why does `localStorage.getItem('count')` return `'5'` instead of `5` after `setItem('count', 5)`?</summary>

Web Storage only stores strings — any value passed to `setItem` is coerced to a string. Numbers, booleans, and objects must be explicitly converted (e.g., with `JSON.stringify`/`Number()`) when storing and retrieving.
</details>

<details>
<summary>3. Why is storage scoped by "origin" rather than just by domain name?</summary>

Origin includes protocol, domain, AND port. `http://app.com` and `https://app.com` are different origins with separate storage, as are `app.com:3000` and `app.com:8080`.
</details>

<details>
<summary>4. In which tab does the `storage` event fire when you call `localStorage.setItem()`?</summary>

It fires in every OTHER open tab of the same origin, but not in the tab that made the change itself.
</details>

<details>
<summary>5. What should you do to avoid an unhandled `QuotaExceededError`?</summary>

Wrap `localStorage.setItem()` calls in `try`/`catch`, and check whether the caught error is a `DOMException` with `name === 'QuotaExceededError'` to handle that specific case gracefully.
</details>
