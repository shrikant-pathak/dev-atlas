# Module 07 Exercises: Errors, Debugging & Browser Storage

## Exercise 1: Try/Catch & Custom Errors
Write a function `parseConfig(jsonString)` that:
1. Parses `jsonString` with `JSON.parse`, catching and re-throwing a custom `ConfigError` (extending `Error`) with a friendlier message if parsing fails.
2. Validates the parsed object has a `port` field that's a number, throwing a `ValidationError` (also extending `Error`) if not.
3. Uses `finally` to log `"Config parse attempt finished"` regardless of outcome.

## Exercise 2: Debugging Practice
Take this buggy function, add `console.group`/`console.table`/`debugger` statements to investigate it, find the bug, and fix it:
```javascript
function averagePrice(items) {
  let total;
  for (const item of items) {
    total += item.price;
  }
  return total / items.length;
}
```

## Exercise 3: Local/Session Storage
Build a simple "recently viewed products" tracker:
1. `addRecentProduct(product)` — adds a product object to a list kept in `localStorage`, keeping only the last 5.
2. `getRecentProducts()` — returns the list (empty array if none exist).
3. Handle the case where stored JSON is corrupted by wrapping the parse in `try`/`catch` and falling back to an empty array.

## Exercise 4: Cookies
Write a `CookieUtil` object with `set(name, value, days)`, `get(name)`, and `remove(name)` methods (don't just copy the lesson's version — write your own). Use it to build a "don't show this banner again" flag that expires after 30 days.

## Exercise 5: Timers
1. Implement `debounce(fn, delay)` and `throttle(fn, limit)` from scratch without looking at the lesson.
2. Build a countdown function `startCountdown(seconds, onTick, onDone)` using `setInterval`, returning a cancel function.
3. Explain (in a comment) why a recursive `setTimeout` might be safer than `setInterval` for a polling function that calls a slow API.

## Exercise 6: Window API
Build a small "connectivity + viewport" status widget:
1. Log the current viewport size on load, and again (debounced) on every `resize`.
2. Log `"Online"`/`"Offline"` when connectivity changes.
3. Read a `?tab=` query parameter from the URL using `URLSearchParams` and log it, defaulting to `"home"` if absent.

## Challenge: Put it all together
Build a `SafeStorage` module that:
- Wraps `localStorage` with `try`/`catch` around every operation, throwing a custom `StorageError` on quota issues
- Automatically JSON-stringifies/parses values
- Debounces writes to a given key so rapid successive saves within 500ms only hit `localStorage` once
- Exposes a way to clean up (cancel pending debounced writes) — think about what this maps to in a component's unmount/cleanup lifecycle
