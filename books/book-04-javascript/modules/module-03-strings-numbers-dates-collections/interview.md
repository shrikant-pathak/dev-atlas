# Module 03 Interview Questions — Strings, Numbers, Dates & Collections

<details>
<summary>1. Are strings mutable or immutable in JavaScript? What does that mean in practice?</summary>

Immutable — no string method changes the original string in place; every transforming method (like `.toUpperCase()`) returns a brand-new string, so the original must be reassigned or captured separately if you want the change.
</details>

<details>
<summary>2. Why is `Number.isNaN()` generally preferred over the global `isNaN()`?</summary>

The global `isNaN()` coerces its argument to a number before checking, so non-numeric values like strings can produce misleading `true` results. `Number.isNaN()` only returns `true` for an actual `NaN` value, with no coercion.
</details>

<details>
<summary>3. What are two well-known problems with the `Date` object that `Temporal` was designed to fix?</summary>

Any two of: `Date` is mutable (methods like `setDate()` change the object in place), it has no built-in time zone support, its string parsing can be inconsistent across environments, and it lacks clean built-in duration arithmetic.
</details>

<details>
<summary>4. What's the difference between `.map()` and `.forEach()`?</summary>

`.map()` returns a new array containing the transformed result of each element. `.forEach()` returns nothing (`undefined`) — it's used purely to run side effects for each element, not to produce a new collection.
</details>

<details>
<summary>5. Why does `[10, 1, 2].sort()` not sort numerically by default?</summary>

`.sort()` without a comparator function converts elements to strings and sorts them lexicographically, so numeric order isn't respected. A comparator like `(a, b) => a - b` must be passed for correct numeric sorting.
</details>

<details>
<summary>6. What's the difference between spread and rest, given they share the same `...` syntax?</summary>

Spread expands a collection's elements outward, such as into a new array/object or a function call. Rest gathers multiple individual values inward into a single array, typically in a function's parameter list or a destructuring pattern. The direction is inferred from where the syntax is used.
</details>

<details>
<summary>7. When would you choose a `Map` over a plain object?</summary>

When keys need to be non-string values (like objects or numbers), when insertion order must be reliably preserved, or when the collection will have frequent additions and removals — a `Map` handles all of these more cleanly than a plain object.
</details>

<details>
<summary>8. What's the idiomatic way to remove duplicate values from an array?</summary>

`[...new Set(array)]` — converting the array into a `Set` (which automatically discards duplicates), then spreading it back into a new array.
</details>

<details>
<summary>9. What makes a value "iterable" in JavaScript?</summary>

It implements a method accessible via `Symbol.iterator` that returns an iterator object with a `.next()` method producing values one at a time — this shared protocol is what allows `for...of` to work identically across arrays, strings, `Set`s, and `Map`s.
</details>

<details>
<summary>10. What is a generator function, and what keyword does it use to produce values?</summary>

A function declared with `function*` that can pause and resume execution, producing a sequence of values over time via the `yield` keyword, rather than computing and returning everything at once.
</details>

<details>
<summary>11. Why might a generator be preferable to returning a full array for a very large sequence?</summary>

A generator computes and yields values one at a time, on demand, rather than requiring the entire sequence to be built and held in memory upfront — making it suitable for very large or even infinite sequences.
</details>

<details>
<summary>12. Is a plain JavaScript object iterable with `for...of` by default?</summary>

No — plain objects don't implement the iterable protocol out of the box, so `for...of` on one throws a `TypeError`; a different approach (like `Object.entries()`) is needed to loop over an object's properties.
</details>
