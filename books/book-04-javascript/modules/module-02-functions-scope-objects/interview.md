# Module 02 Interview Questions — Functions, Scope & Objects

<details>
<summary>1. What's the difference between a function declaration and a function expression?</summary>

A function declaration (`function foo() {}`) is fully hoisted, including its body, so it can be called before its line in the code. A function expression (`const foo = function () {}`) is not — only the variable is hoisted (as `undefined` for `var`, or left in the Temporal Dead Zone for `let`/`const`), so the function itself isn't callable until that line executes.
</details>

<details>
<summary>2. Explain the Temporal Dead Zone.</summary>

The period between the start of a `let`/`const` variable's scope and the line where it's actually declared, during which the variable exists but accessing it throws a `ReferenceError`. It exists to catch use-before-declaration bugs that `var`'s looser hoisting would otherwise allow silently.
</details>

<details>
<summary>3. What is a closure, and give a practical use case.</summary>

A function that retains access to variables from its outer scope even after the outer function has finished executing. A common use case is creating private state — e.g. a counter or bank account object where the internal variable can only be changed through specific exposed methods.
</details>

<details>
<summary>4. What makes a function "higher-order"?</summary>

A function that takes another function as an argument, returns a function, or both — e.g. `Array.prototype.map`, or a custom validation pipeline that runs a list of rule functions against a value.
</details>

<details>
<summary>5. Why does `this` behave unpredictably inside a regular function callback, and how do arrow functions solve it?</summary>

`this` is determined by how a function is called, not where it's defined — so a regular function passed as a callback (e.g. to `setTimeout`) is typically invoked as a plain call, resetting `this` away from the object it was conceptually written inside. Arrow functions don't have their own `this` at all; they inherit `this` from their surrounding lexical scope, avoiding the problem entirely.
</details>

<details>
<summary>6. What's the difference between `call`, `apply`, and `bind`?</summary>

`call` and `apply` both invoke a function immediately with a specified `this` value — `call` takes additional arguments individually, `apply` takes them as an array. `bind` does not invoke the function; it returns a new function with `this` permanently locked to the specified value.
</details>

<details>
<summary>7. What is an IIFE, and why was it historically used?</summary>

An Immediately Invoked Function Expression — a function defined and called in the same statement. It was historically used to keep variables out of the global scope before JavaScript had a proper module system, often combined with a `return` statement to expose only a chosen public interface (the "module pattern").
</details>

<details>
<summary>8. What's the difference between dot notation and bracket notation for accessing object properties?</summary>

Dot notation (`obj.key`) requires a hardcoded, valid identifier property name. Bracket notation (`obj["key"]` or `obj[variable]`) is required when the property name is stored in a variable, contains special characters, or isn't a valid identifier.
</details>

<details>
<summary>9. Explain the prototype chain.</summary>

Every object can be linked to another object (its prototype). When a property or method isn't found directly on an object, JavaScript searches its prototype, then that prototype's prototype, and so on, until it's found or the chain reaches `null`. This is how objects share behavior without duplicating it onto every instance.
</details>

<details>
<summary>10. What does `Object.create(null)` give you that a plain object literal `{}` does not?</summary>

An object with absolutely no prototype — not even the default `Object.prototype` — meaning it lacks any automatically inherited methods like `toString()` that a plain object literal would still have access to.
</details>

<details>
<summary>11. What's the practical benefit of a getter over a plain property?</summary>

A getter computes its value fresh every time it's read, rather than needing to be manually kept in sync — for example, an `area` getter derived from a `radius` property will always be correct even if `radius` changes, without any extra code to recalculate it.
</details>

<details>
<summary>12. Can a `const`-declared object have its properties changed?</summary>

Yes — `const` only prevents reassigning the variable to point at a different object entirely. Adding, modifying, or deleting individual properties on the object it already points to is completely unaffected.
</details>
