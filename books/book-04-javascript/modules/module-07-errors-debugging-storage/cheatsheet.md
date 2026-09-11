# Module 07 Cheatsheet: Errors, Debugging & Browser Storage

## Try/Catch/Finally
```javascript
try {
  riskyThing();
} catch (error) {
  console.log(error.message);
} finally {
  cleanup(); // always runs
}

throw new Error('message');

class MyError extends Error {
  constructor(message) {
    super(message);
    this.name = 'MyError';
  }
}

error instanceof TypeError
error instanceof MyError
```

## Console Methods
```javascript
console.log() / info() / warn() / error()
console.table(arrayOfObjects)
console.group('label') ... console.groupEnd()
console.time('label') ... console.timeEnd('label')
console.assert(condition, 'message')
console.trace()
console.count('label')
debugger; // pauses execution if DevTools is open
```

## localStorage / sessionStorage
```javascript
localStorage.setItem(key, value)   // value coerced to string!
localStorage.getItem(key)          // null if missing
localStorage.removeItem(key)
localStorage.clear()
localStorage.key(index)
localStorage.length

// Objects: always stringify/parse
localStorage.setItem('user', JSON.stringify(obj));
const obj = JSON.parse(localStorage.getItem('user'));

window.addEventListener('storage', (e) => { e.key, e.oldValue, e.newValue });
```
| | localStorage | sessionStorage |
|---|---|---|
| Lifetime | Until cleared | Until tab closes |
| Scope | All tabs, same origin | Per tab |

## Cookies
```javascript
document.cookie = 'name=value; max-age=3600; path=/; SameSite=Lax; Secure';
document.cookie; // returns ALL cookies as one string — must parse manually
// delete: re-set with a past expiry date
document.cookie = 'name=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/';
```
`HttpOnly` cookies are invisible to JS — set only via server `Set-Cookie` header.

## Timers
```javascript
const id = setTimeout(fn, delayMs, ...args);
clearTimeout(id);

const id2 = setInterval(fn, delayMs);
clearInterval(id2);
```
Microtasks (Promises) always run before the next macrotask (timers), regardless of delay.

```javascript
// Debounce — run once after events stop firing
function debounce(fn, delay) {
  let t;
  return (...args) => { clearTimeout(t); t = setTimeout(() => fn(...args), delay); };
}
// Throttle — run at most once per interval
function throttle(fn, limit) {
  let waiting = false;
  return (...args) => {
    if (!waiting) { fn(...args); waiting = true; setTimeout(() => waiting = false, limit); }
  };
}
```

## Window API
```javascript
window.location.href / .pathname / .search / .hash
new URLSearchParams(window.location.search).get('key')
window.history.pushState(state, '', url) // no reload
window.history.back() / forward() / go(n)
window.navigator.userAgent / .onLine / .language
window.addEventListener('resize' | 'online' | 'offline' | 'beforeunload', handler)
window.matchMedia('(max-width: 600px)').matches
window.open(url, target, features)
```
