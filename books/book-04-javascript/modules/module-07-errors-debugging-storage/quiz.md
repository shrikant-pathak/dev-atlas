# Module 07 Quiz: Errors, Debugging & Browser Storage

1. Which block always runs, whether or not an error was thrown?
   a) `try`
   b) `catch`
   c) `finally`
   d) `throw`

2. What must a custom error class call in its constructor?
   a) `this.init()`
   b) `Error.new()`
   c) `super(message)`
   d) Nothing special is required

3. Which console method renders an array of objects as a table?
   a) `console.log()`
   b) `console.table()`
   c) `console.group()`
   d) `console.list()`

4. What type does `localStorage.getItem()` always return (assuming the key exists)?
   a) The original type that was stored
   b) A string
   c) An object
   d) `null`

5. Which storage is cleared when its tab is closed?
   a) `localStorage`
   b) `sessionStorage`
   c) Cookies
   d) All of the above

6. Which cookie attribute makes a cookie completely inaccessible to JavaScript?
   a) `Secure`
   b) `SameSite`
   c) `HttpOnly`
   d) `max-age`

7. Between a Promise `.then()` callback and a `setTimeout(fn, 0)` callback scheduled at the same moment, which runs first?
   a) The `setTimeout` callback
   b) The Promise callback
   c) They run at exactly the same time
   d) It's undefined/random

8. What does `clearInterval()` require to work?
   a) Nothing, it clears all intervals
   b) The ID returned by the matching `setInterval()` call
   c) The exact delay value used
   d) A reference to the function itself

9. Which pattern ensures a function runs at most once per fixed time period, no matter how often it's triggered?
   a) Debounce
   b) Throttle
   c) Memoization
   d) Currying

10. Which `window` API lets you update the URL shown in the address bar without reloading the page?
    a) `window.location.reload()`
    b) `window.navigator`
    c) `window.history.pushState()`
    d) `window.open()`

---

## Answer Key
1. c) `finally`
2. c) `super(message)`
3. b) `console.table()`
4. b) A string
5. b) `sessionStorage`
6. c) `HttpOnly`
7. b) The Promise callback
8. b) The ID returned by the matching `setInterval()` call
9. b) Throttle
10. c) `window.history.pushState()`
