# Module 01 Interview Questions — JavaScript Fundamentals

<details>
<summary>1. What's the difference between `var`, `let`, and `const`?</summary>

`var` is function-scoped, hoisted, and can be re-declared — largely considered legacy and error-prone. `let` and `const` are both block-scoped (ES6); `let` allows reassignment, `const` does not. Modern code defaults to `const`, uses `let` only when reassignment is needed, and avoids `var`.
</details>

<details>
<summary>2. Why does relying on Automatic Semicolon Insertion (ASI) carry risk?</summary>

ASI inserts missing semicolons automatically in most cases, but has edge cases — like a bare `return` followed by a value on the next line — where it inserts a semicolon in a place that silently changes what the code does. Writing semicolons explicitly avoids this entire category of bugs.
</details>

<details>
<summary>3. Does `const` make an array or object immutable?</summary>

No. `const` only prevents reassigning the variable to a different value; the contents of an array or object it points to can still be mutated (e.g. via `.push()`), and this changes in later modules once objects are covered fully.
</details>

<details>
<summary>4. Explain the difference between `null` and `undefined`.</summary>

`undefined` is the default value JavaScript assigns to a declared-but-unassigned variable, or to a missing function argument or object property. `null` is a value a developer assigns deliberately to represent an intentional absence of value.
</details>

<details>
<summary>5. Why does `typeof null` return `"object"`?</summary>

It's a bug from JavaScript's original 1995 implementation, where values were represented internally with a type tag, and `null`'s tag happened to match the one used for objects. It has never been fixed because doing so would break existing code across the web.
</details>

<details>
<summary>6. What is type coercion? Give an example of implicit vs. explicit coercion.</summary>

Type coercion is converting a value from one type to another. Implicit coercion happens automatically, e.g. `"5" + 3` produces `"53"` because the number is coerced to a string. Explicit coercion is deliberate, e.g. `Number("5")` produces the number `5`.
</details>

<details>
<summary>7. Why is `===` preferred over `==`?</summary>

`==` performs type coercion before comparing, which can produce results that don't match programmer intent (e.g. `0 == false` is `true`). `===` compares both value and type without coercion, making comparisons predictable and reducing bugs.
</details>

<details>
<summary>8. List JavaScript's falsy values.</summary>

`false`, `0`, `-0`, `""`, `null`, `undefined`, and `NaN`. Every other value — including empty arrays and objects — is truthy.
</details>

<details>
<summary>9. What's the difference between `break` and `continue` in a loop?</summary>

`break` terminates the loop entirely. `continue` skips only the remainder of the current iteration and proceeds to the next one.
</details>

<details>
<summary>10. When would you choose a `switch` statement over an `if/else if` chain?</summary>

When checking a single value against several exact, known possibilities — a `switch` tends to read more clearly than a long chain of equality checks, especially when several cases share the same result.
</details>

<details>
<summary>11. What does a `do...while` loop guarantee that a `while` loop does not?</summary>

A `do...while` loop always executes its body at least once, because the condition is checked after the first execution rather than before. A `while` loop may never execute its body if the condition starts out false.
</details>

<details>
<summary>12. Is `[]` truthy or falsy in JavaScript? Why does this surprise many developers?</summary>

It's truthy. Many developers expect an empty array to behave like `0` or `""` (falsy), but in JavaScript any object — including an empty array or object — is truthy; only the specific values on the falsy list are falsy.
</details>
