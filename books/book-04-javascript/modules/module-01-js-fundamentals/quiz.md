# Module 01 Quiz — JavaScript Fundamentals

<details>
<summary>Q1. What does ASI stand for, and what does it do?</summary>

Automatic Semicolon Insertion — JavaScript automatically inserts missing semicolons in most cases, though this book writes them explicitly to avoid edge-case bugs.
</details>

<details>
<summary>Q2. Which keyword should you use by default when declaring a variable that won't be reassigned?</summary>

`const`
</details>

<details>
<summary>Q3. True or false: `const arr = [1,2]; arr.push(3);` throws an error.</summary>

False — `.push()` mutates the array's contents, which `const` allows. Only reassigning `arr` itself would throw.
</details>

<details>
<summary>Q4. What does `typeof undefined` return?</summary>

`"undefined"`
</details>

<details>
<summary>Q5. What is the result of `"Hello" + " " + "World"`?</summary>

`"Hello World"`
</details>

<details>
<summary>Q6. What does `5 === "5"` evaluate to?</summary>

`false` — strict equality does not coerce types, and a number is never strictly equal to a string.
</details>

<details>
<summary>Q7. What is the result of `10 % 3`?</summary>

`1` (the remainder after dividing 10 by 3)
</details>

<details>
<summary>Q8. Rewrite `if (isMember) { discount = 0.2; } else { discount = 0; }` as a ternary expression.</summary>

`const discount = isMember ? 0.2 : 0;`
</details>

<details>
<summary>Q9. In a `switch` statement, what keyword prevents fall-through to the next case?</summary>

`break`
</details>

<details>
<summary>Q10. How many times does `for (let i = 0; i < 3; i++) { console.log(i); }` log a value, and what are they?</summary>

Three times: `0`, `1`, `2`.
</details>

<details>
<summary>Q11. Which loop type guarantees its body runs at least once?</summary>

`do...while`
</details>

<details>
<summary>Q12. Is `0` truthy or falsy?</summary>

Falsy.
</details>

<details>
<summary>Q13. What does `Number("abc")` evaluate to?</summary>

`NaN` (Not a Number)
</details>
