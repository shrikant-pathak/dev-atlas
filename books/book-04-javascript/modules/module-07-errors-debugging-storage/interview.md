# Module 07 Interview Questions: Errors, Debugging & Browser Storage

## Conceptual Questions

**1. What's the difference between `try`/`catch` and using `.catch()` on a Promise?**
`try`/`catch` handles synchronous errors, or asynchronous errors inside an `async` function when combined with `await` (an awaited rejection behaves like a thrown error). `.catch()` is a Promise method that handles rejection directly on the Promise chain, without needing `async`/`await` syntax. Both ultimately handle the same category of failure, just with different syntax.

**2. Why extend the built-in `Error` class instead of just throwing a plain object like `{ message: 'failed' }`?**
Extending `Error` preserves `instanceof Error` checks, a proper `.stack` trace for debugging, and compatibility with anything expecting standard error behavior (like DevTools' error formatting). A plain object loses all of that.

**3. What's the practical difference between `localStorage`, `sessionStorage`, and cookies?**
`localStorage` persists indefinitely and is shared across tabs; `sessionStorage` is per-tab and cleared when the tab closes; both are JS-only and never sent to the server. Cookies are small (~4KB), automatically attached to matching HTTP requests, and can be marked `HttpOnly` to be invisible to JavaScript entirely — making them suited for server-side session/auth data.

**4. Why is `HttpOnly` important for session cookies specifically?**
It prevents JavaScript from reading the cookie at all, which protects the session token from being stolen through a cross-site scripting (XSS) vulnerability, since even injected malicious JS can't access it.

**5. Explain why `setTimeout(fn, 0)` doesn't run `fn` immediately.**
JavaScript's single-threaded event loop only runs a timer's callback once the call stack is empty and any pending microtasks have run. A `0ms` delay means "run as soon as possible after that," not "run synchronously right now."

## Practical / Coding Questions

**6. Write a function that safely reads and parses a JSON value from `localStorage`, returning a default on any failure.**
```javascript
function safeGet(key, defaultValue) {
  try {
    const raw = localStorage.getItem(key);
    return raw ? JSON.parse(raw) : defaultValue;
  } catch {
    return defaultValue;
  }
}
```

**7. What does this log, and why?**
```javascript
console.log('A');
setTimeout(() => console.log('B'), 0);
Promise.resolve().then(() => console.log('C'));
console.log('D');
```
Logs `A, D, C, B`. Synchronous code (`A`, `D`) runs first; then the microtask queue (`C`) is fully drained; only then does the macrotask queue's timer callback (`B`) run.

**8. Implement a basic `debounce(fn, delay)` function.**
```javascript
function debounce(fn, delay) {
  let timerId;
  return (...args) => {
    clearTimeout(timerId);
    timerId = setTimeout(() => fn(...args), delay);
  };
}
```

**9. How would you delete a cookie named `session`?**
```javascript
document.cookie = 'session=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
```
There's no dedicated delete method — overwriting with a past expiry date causes the browser to discard it.

**10. Given a bug that only reproduces on the 200th iteration of a loop, what DevTools feature would you use to investigate it efficiently?**
A conditional breakpoint set on the relevant line, with a condition like `i === 200`, so execution only pauses at that specific iteration instead of requiring 200 manual "step over" clicks.
