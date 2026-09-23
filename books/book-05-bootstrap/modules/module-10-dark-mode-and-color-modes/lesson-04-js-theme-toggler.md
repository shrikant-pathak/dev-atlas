# Lesson 04: JS Theme Toggler

## Learning Objectives
- Build a full Light/Dark/Auto theme toggle UI
- Persist the user's manual choice using `localStorage`
- Correctly layer manual preference over system detection on page load
- Avoid a flash of incorrect theme on page load, building on Lesson 02's IIFE pattern

## Introduction
This closes out Module 10 by assembling everything from Lessons 01–03 into the single most common real-world dark-mode feature: a visible toggle button that lets a user override system preference, remembers their choice across visits, and still respects "follow system" as a valid, explicit option. This is also the first lesson in this book to use `localStorage`, a new browser API for persisting data between page loads.

## What `localStorage` Adds to What You Already Know
Every JavaScript pattern used throughout this book so far — `addEventListener`, reading `.value`, `matchMedia` — only affects the CURRENT page load; refresh the page, and all of that state is gone. `localStorage` is a simple key-value browser storage mechanism that persists across page reloads and browser restarts, which is exactly what's needed here: without it, a user's manually chosen dark mode would silently reset back to system preference every time they navigated to a new page or reopened the site.

```javascript
localStorage.setItem('theme', 'dark');    // save
const saved = localStorage.getItem('theme');  // retrieve (returns null if never set)
localStorage.removeItem('theme');          // clear (used for "Auto")
```

## Full Theme Resolution Logic
Putting Lessons 01–03 together, theme resolution on page load needs to check TWO sources, in priority order: a saved manual preference first, falling back to system preference only if no manual choice was ever made:

```javascript
(function() {
  const savedTheme = localStorage.getItem('theme');
  const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
  const theme = savedTheme || (systemPrefersDark ? 'dark' : 'light');
  document.documentElement.setAttribute('data-bs-theme', theme);
})();
```

This is the same head-placed IIFE pattern from Lesson 02, extended with one additional check — `localStorage.getItem('theme')` — placed FIRST in the priority order, since an explicit past user choice should always override the system default.

## Building the Toggle UI
A three-option button group (Light / Dark / Auto), reusing `.btn-group` from Module 06, Lesson 02:

```html
<div class="btn-group" role="group" aria-label="Theme selector">
  <button type="button" class="btn btn-outline-secondary" data-theme-value="light">Light</button>
  <button type="button" class="btn btn-outline-secondary" data-theme-value="dark">Dark</button>
  <button type="button" class="btn btn-outline-secondary" data-theme-value="auto">Auto</button>
</div>
```

```javascript
document.querySelectorAll('[data-theme-value]').forEach(button => {
  button.addEventListener('click', () => {
    const value = button.getAttribute('data-theme-value');

    if (value === 'auto') {
      localStorage.removeItem('theme');
      const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      document.documentElement.setAttribute('data-bs-theme', systemPrefersDark ? 'dark' : 'light');
    } else {
      localStorage.setItem('theme', value);
      document.documentElement.setAttribute('data-bs-theme', value);
    }
  });
});
```

Notice "Auto" doesn't set `data-bs-theme="auto"` — recall from Lesson 02 that "auto" isn't a real theme value Bootstrap understands, only a UI-level concept — clicking it instead REMOVES the saved preference and re-runs the same system-detection logic used on initial page load, then sets an actual `"light"` or `"dark"` value.

## Practical Example
A complete, working toggler combining the flash-avoiding head script, the button group, and the click handler:

```html
<head>
  <script>
    (function() {
      const savedTheme = localStorage.getItem('theme');
      const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      document.documentElement.setAttribute('data-bs-theme', savedTheme || (systemPrefersDark ? 'dark' : 'light'));
    })();
  </script>
</head>
<body>
  <div class="btn-group" role="group" aria-label="Theme selector">
    <button type="button" class="btn btn-outline-secondary" data-theme-value="light">Light</button>
    <button type="button" class="btn btn-outline-secondary" data-theme-value="dark">Dark</button>
    <button type="button" class="btn btn-outline-secondary" data-theme-value="auto">Auto</button>
  </div>

  <script>
    document.querySelectorAll('[data-theme-value]').forEach(button => {
      button.addEventListener('click', () => {
        const value = button.getAttribute('data-theme-value');
        if (value === 'auto') {
          localStorage.removeItem('theme');
          const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
          document.documentElement.setAttribute('data-bs-theme', systemPrefersDark ? 'dark' : 'light');
        } else {
          localStorage.setItem('theme', value);
          document.documentElement.setAttribute('data-bs-theme', value);
        }
      });
    });
  </script>
</body>
```

## Revision Questions

<details>
<summary>1. Why is `localStorage` needed here, when every other JS pattern used earlier in this book (event listeners, matchMedia) already works fine?</summary>
Those earlier patterns only persist for the current page load; `localStorage` persists across page reloads and browser restarts, which is required so a user's manually chosen theme doesn't silently reset to system preference on every new page visit.
</details>

<details>
<summary>2. In the full theme-resolution logic, which takes priority: a saved manual preference, or the system's current setting?</summary>
The saved manual preference takes priority — the system preference is only used as a fallback when `localStorage.getItem('theme')` returns nothing (i.e., the user never made an explicit choice).
</details>

<details>
<summary>3. Why doesn't clicking "Auto" set `data-bs-theme="auto"` directly?</summary>
`"auto"` isn't a real theme value Bootstrap understands — it's a UI-level concept meaning "follow the system," so clicking it instead removes the saved preference and re-runs the actual system-detection logic to set a genuine `"light"` or `"dark"` value.
</details>

<details>
<summary>4. Why does the initial theme-resolution script need to run in the `<head>` as an immediately-invoked function, rather than at the bottom of the page?</summary>
Same reasoning as Lesson 02 — running it before the page's visible content renders avoids a flash of the wrong theme that would otherwise briefly show before JavaScript at the bottom of the page corrected it.
</details>
