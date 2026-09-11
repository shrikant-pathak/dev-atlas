# Lesson 6: Window API Basics

## Learning Objectives
- Understand the `window` global object and its role
- Use `window.location` to read and change the URL
- Use `window.history` for navigation control
- Use `window.navigator` for browser/device info
- Handle window-level events like `resize` and `beforeunload`
- Open and interact with new windows/tabs

## Introduction

Throughout this book, you've used globals like `document`, `console`, `setTimeout`, and `fetch` without much comment on where they actually come from. In a browser, ALL of these are properties of one giant global object: `window`. This lesson looks directly at `window` itself and the browser-level APIs it exposes beyond the DOM.

## 1. `window` is the global object

In browser JavaScript, `window` IS the global scope object — any variable declared with `var` at the top level (recall `var`'s global-scope behavior from Module 01) becomes a property of `window`:

```javascript
var globalVar = 'hello';
console.log(window.globalVar); // 'hello'

console.log(window.document === document); // true — `document` is really `window.document`
console.log(window.console === console);   // true
console.log(window === globalThis);        // true in browsers (globalThis, from Module 06 Lesson 5, is universal across environments)
```

Note: `let` and `const` declarations at the top level do NOT become `window` properties — only `var` and implicit globals do.

## 2. `window.location`

Represents the current URL and lets you navigate:

```javascript
console.log(window.location.href);     // full URL, e.g. 'https://example.com/products?id=5'
console.log(window.location.protocol); // 'https:'
console.log(window.location.host);     // 'example.com'
console.log(window.location.pathname); // '/products'
console.log(window.location.search);   // '?id=5'
console.log(window.location.hash);     // '' (or '#section' if present)

window.location.href = 'https://example.com/about'; // navigates the page
window.location.reload();                             // reloads the current page
```

Parsing query parameters cleanly uses `URLSearchParams`:

```javascript
const params = new URLSearchParams(window.location.search);
console.log(params.get('id')); // '5'
```

## 3. `window.history`

Controls the browser's session history — the back/forward stack:

```javascript
window.history.back();    // like clicking the browser's back button
window.history.forward(); // like clicking forward
window.history.go(-2);    // go back 2 entries

// Change the URL WITHOUT reloading the page — the foundation of client-side routing
// used by React Router, Vue Router, etc.
window.history.pushState({ page: 'about' }, '', '/about');

window.addEventListener('popstate', (event) => {
  console.log('User navigated back/forward:', event.state);
});
```

## 4. `window.navigator`

Exposes info about the browser and device:

```javascript
console.log(navigator.userAgent);  // browser/OS identification string
console.log(navigator.language);   // e.g. 'en-US'
console.log(navigator.onLine);     // true/false — network connectivity
console.log(navigator.geolocation); // GeolocationAPI, if available (requires permission)

navigator.clipboard.writeText('Copied text!'); // returns a Promise (Module 05)
```

## 5. Window-level events

```javascript
window.addEventListener('resize', () => {
  console.log(`Window is now ${window.innerWidth}x${window.innerHeight}`);
});

window.addEventListener('online', () => console.log('Back online'));
window.addEventListener('offline', () => console.log('Connection lost'));

window.addEventListener('beforeunload', (event) => {
  event.preventDefault(); // triggers the browser's "leave site?" confirmation
  event.returnValue = ''; // required for some browsers to show the prompt
});
```

Combine `resize` with the debounce pattern from Lesson 5, since `resize` can fire dozens of times per second while dragging a window:

```javascript
function debounce(fn, delay) {
  let timerId;
  return (...args) => {
    clearTimeout(timerId);
    timerId = setTimeout(() => fn(...args), delay);
  };
}

window.addEventListener('resize', debounce(() => {
  console.log('Resize settled at', window.innerWidth, window.innerHeight);
}, 200));
```

## 6. Opening and controlling new windows

```javascript
const newWin = window.open('https://example.com', '_blank', 'width=600,height=400');

if (newWin) {
  newWin.focus();
  // newWin.close(); // can close it programmatically too
} else {
  console.log('Popup was blocked by the browser');
}
```

Modern browsers block `window.open()` calls that don't happen directly in response to a user action (like a click), so this pattern only reliably works inside an event handler.

## 7. `window.matchMedia` — responding to CSS media queries in JS

Useful for behavior that needs to react to the same breakpoints your CSS uses (tying back to Book 03's responsive design coverage):

```javascript
const mobileQuery = window.matchMedia('(max-width: 600px)');

console.log(mobileQuery.matches); // true/false right now

mobileQuery.addEventListener('change', (event) => {
  console.log(event.matches ? 'Switched to mobile layout' : 'Switched to desktop layout');
});
```

## Practical Example

A small "connection and viewport watcher" combining several window APIs, event handling, and the debounce pattern from Lesson 5:

```javascript
function debounce(fn, delay) {
  let timerId;
  return (...args) => {
    clearTimeout(timerId);
    timerId = setTimeout(() => fn(...args), delay);
  };
}

function initAppWatchers() {
  // Track viewport size changes
  const handleResize = debounce(() => {
    console.log(`Viewport: ${window.innerWidth}x${window.innerHeight}`);
  }, 200);
  window.addEventListener('resize', handleResize);

  // Track connectivity
  window.addEventListener('online', () => console.log('Connection restored'));
  window.addEventListener('offline', () => console.log('Connection lost — showing offline banner'));

  // Warn before leaving if there's unsaved work
  let hasUnsavedChanges = false;
  window.addEventListener('beforeunload', (event) => {
    if (hasUnsavedChanges) {
      event.preventDefault();
      event.returnValue = '';
    }
  });

  // Read the current page's query params
  const params = new URLSearchParams(window.location.search);
  console.log('Current tab:', params.get('tab') ?? 'default');

  // React to a responsive breakpoint
  const mobileQuery = window.matchMedia('(max-width: 600px)');
  mobileQuery.addEventListener('change', (e) => {
    console.log(e.matches ? 'Now on mobile layout' : 'Now on desktop layout');
  });
}

initAppWatchers();
```

## Revision Questions

<details>
<summary>1. What is the relationship between `window` and globals declared with `var`?</summary>

`window` IS the global object in browser JavaScript. Any top-level `var` declaration (or implicit global) automatically becomes a property of `window`. `let`/`const` declarations do not.
</details>

<details>
<summary>2. How can you change the URL shown in the address bar without triggering a page reload?</summary>

`window.history.pushState(state, '', newUrl)` — this is the mechanism client-side routers (React Router, Vue Router) use to simulate navigation within a single-page app.
</details>

<details>
<summary>3. Why should a `resize` event handler usually be debounced?</summary>

`resize` can fire many times per second while a window is actively being dragged, so running expensive logic on every single event can hurt performance. Debouncing waits until resizing has settled before running the handler.
</details>

<details>
<summary>4. What must be true for `window.open()` to reliably succeed rather than being blocked?</summary>

It generally must be called synchronously within a direct user-initiated event handler (like a click), since browsers block popups triggered outside of a clear user action.
</details>

<details>
<summary>5. What does `window.matchMedia('(max-width: 600px)').matches` tell you?</summary>

Whether the given CSS media query currently matches the viewport — `true` if the window is 600px wide or less at that moment. Combined with its `change` event, JS code can react live to the same breakpoints used in CSS.
</details>
