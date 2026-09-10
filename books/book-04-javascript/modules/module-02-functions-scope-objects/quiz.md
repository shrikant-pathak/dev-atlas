# Module 02 Quiz — Functions, Scope & Objects

<details>
<summary>Q1. What does a function return if it has no `return` statement?</summary>

`undefined`
</details>

<details>
<summary>Q2. Which function syntax is fully hoisted, including its body?</summary>

Function declarations (`function foo() {}`).
</details>

<details>
<summary>Q3. What does "lexical scoping" mean?</summary>

A function's access to outer variables is determined by where it's physically defined in the code, not by where it's called from.
</details>

<details>
<summary>Q4. True or false: `let` and `const` are not hoisted at all.</summary>

False — they are hoisted, but remain unusable in the Temporal Dead Zone until their declaration line executes.
</details>

<details>
<summary>Q5. What does a closure allow a function to do?</summary>

Retain access to variables from its outer scope, even after the outer function has finished executing.
</details>

<details>
<summary>Q6. What is a callback?</summary>

A function passed as an argument to another function, to be invoked at some point during that function's execution.
</details>

<details>
<summary>Q7. What does `this` refer to inside a plain function call in strict mode?</summary>

`undefined`
</details>

<details>
<summary>Q8. Which method returns a new function with `this` permanently locked, without calling it immediately?</summary>

`.bind()`
</details>

<details>
<summary>Q9. What is an IIFE?</summary>

An Immediately Invoked Function Expression — a function that is defined and called in the same statement.
</details>

<details>
<summary>Q10. Rewrite `const obj = { name: name, age: age };` using property shorthand (assuming variables `name` and `age` already exist).</summary>

`const obj = { name, age };`
</details>

<details>
<summary>Q11. What is the "prototype chain"?</summary>

The sequence of linked prototype objects JavaScript searches through when a property isn't found directly on an object.
</details>

<details>
<summary>Q12. How is a getter accessed on an object — like a property, or like a method call?</summary>

Like a property — without parentheses — even though it runs a function behind the scenes.
</details>
