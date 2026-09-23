# Lesson 02: `prefers-color-scheme` and System Detection

## Learning Objectives
- Understand the `prefers-color-scheme` media query as the browser/OS-level dark mode signal
- Detect a user's system preference with JavaScript via `window.matchMedia`
- Apply that preference to set `data-bs-theme` automatically on page load
- Distinguish "auto" theme (follows system) from a fixed light/dark choice

## Introduction
Lesson 01 showed how to manually set `data-bs-theme`. This lesson covers the far more common real-world requirement: automatically matching whatever light/dark preference the user has already configured at the operating system level, rather than forcing them to pick a theme within your site specifically.

## What `prefers-color-scheme` Actually Is
This is a CSS media feature — NOT a Bootstrap-specific concept — that reflects the operating system's current light/dark setting:

```css
@media (prefers-color-scheme: dark) {
  /* styles here apply when the OS is set to dark mode */
}
```

Nearly every modern OS (macOS, Windows, iOS, Android) exposes a system-wide light/dark toggle, and browsers surface that choice to web pages through exactly this media query — the same mechanism, notably, that's referenced in this project's own memory file for Book 04's dark-mode section coverage, and conceptually identical to any `@media` breakpoint query from Module 02, just detecting a preference rather than a viewport size.

## Detecting System Preference with JavaScript
To translate that CSS-level signal into a `data-bs-theme` attribute value, use `window.matchMedia`:

```javascript
function getSystemPreference() {
  return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}

document.documentElement.setAttribute('data-bs-theme', getSystemPreference());
```

`window.matchMedia(query)` returns an object whose `.matches` property is `true` if the query currently applies — this is standard DOM API territory, the same category of skill as the `addEventListener`/`.value` patterns from Book 04 that you've reused throughout this book (range inputs, form validation, spinners).

## Reacting to Live System Preference Changes
A user might change their OS theme WHILE your page is open (fairly common — many operating systems auto-switch at sunset/sunrise). `matchMedia`'s result object supports an event listener for exactly this:

```javascript
const darkModeQuery = window.matchMedia('(prefers-color-scheme: dark)');

darkModeQuery.addEventListener('change', (e) => {
  document.documentElement.setAttribute('data-bs-theme', e.matches ? 'dark' : 'light');
});
```

This is a genuinely different event target than anything used earlier in this book — rather than listening to a DOM element (a button, a form), you're listening directly to a media query's own change event, which fires whenever the underlying system setting changes, independent of any user interaction with your page at all.

## "Auto" as a Distinct Third Option
Real-world theme togglers (built fully in Lesson 04) typically offer three choices, not two: **Light**, **Dark**, and **Auto** (follow system). "Auto" isn't a real `data-bs-theme` value — it's a UI-level concept meaning "run the system-detection JavaScript above and don't override it," as opposed to a saved manual preference that ignores the system setting entirely. This distinction matters directly for Lesson 04's toggle logic and persistence behavior.

## Practical Example
A minimal page that sets the theme correctly on load based on system preference, before any user interaction happens:

```html
<html>
<head>
  <script>
    // Run before page renders, to avoid a flash of the wrong theme
    (function() {
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      document.documentElement.setAttribute('data-bs-theme', prefersDark ? 'dark' : 'light');
    })();
  </script>
</head>
<body>
  <div class="card">
    <div class="card-body">Theme matches your system setting automatically.</div>
  </div>
</body>
</html>
```

Placing this script in the `<head>`, running immediately (an Immediately Invoked Function Expression, or IIFE), is a deliberate choice: it sets the theme attribute before the page's visible content renders, avoiding a jarring "flash" of the wrong theme that would occur if this logic ran later, after the page had already painted in its default light theme.

## Revision Questions

<details>
<summary>1. Is `prefers-color-scheme` a Bootstrap-specific feature?</summary>
No — it's a standard CSS media feature reflecting the operating system's light/dark setting, conceptually the same mechanism as any `@media` breakpoint query, just detecting a preference rather than a viewport width.
</details>

<details>
<summary>2. What does `window.matchMedia('(prefers-color-scheme: dark)').matches` return?</summary>
A boolean — `true` if the system is currently set to dark mode, `false` otherwise.
</details>

<details>
<summary>3. Why would you attach a `'change'` event listener to a matchMedia result, rather than just checking it once on page load?</summary>
To react live if the user's system theme changes while your page remains open (e.g. many operating systems auto-switch at sunset/sunrise) — a one-time check on load wouldn't catch that.
</details>

<details>
<summary>4. Why should the system-preference detection script run in the `<head>` as an immediately-invoked function, rather than after the page loads?</summary>
To set the correct `data-bs-theme` value before the page's visible content renders, avoiding a jarring flash of the wrong theme that would occur if the theme were only corrected after the page had already painted in its default state.
</details>
