# Module 03 Quiz — Strings, Numbers, Dates & Collections

<details>
<summary>Q1. What character do template literals use instead of quotes?</summary>

Backticks (`` ` ``)
</details>

<details>
<summary>Q2. What does `"hello".toUpperCase()` return, and does it change the original string?</summary>

`"HELLO"` — it returns a new string; the original `"hello"` is unchanged since strings are immutable.
</details>

<details>
<summary>Q3. What does `parseInt("42px")` return?</summary>

`42`
</details>

<details>
<summary>Q4. In `new Date(2026, 8, 10)`, what month does `8` represent?</summary>

September — `Date` months are zero-indexed, so `0` is January and `8` is September.
</details>

<details>
<summary>Q5. Which array method removes the last element and returns it, mutating the original array?</summary>

`.pop()`
</details>

<details>
<summary>Q6. Which of `.map()`, `.filter()`, `.reduce()` would you use to sum all numbers in an array?</summary>

`.reduce()`
</details>

<details>
<summary>Q7. Rewrite `const first = arr[0]; const second = arr[1];` using destructuring.</summary>

`const [first, second] = arr;`
</details>

<details>
<summary>Q8. What does `{ ...obj, age: 31 }` do if `obj` already has an `age` property?</summary>

It creates a new object with all of `obj`'s properties, but with `age` overridden to `31`.
</details>

<details>
<summary>Q9. What happens if you try to add the same value twice to a `Set`?</summary>

The second addition is silently ignored — a `Set` only stores unique values.
</details>

<details>
<summary>Q10. What method retrieves a value from a `Map` by its key?</summary>

`.get(key)`
</details>

<details>
<summary>Q11. What keyword is used inside a generator function to produce a value?</summary>

`yield`
</details>

<details>
<summary>Q12. What loop construct works uniformly across arrays, strings, `Set`, and `Map`?</summary>

`for...of`
</details>
