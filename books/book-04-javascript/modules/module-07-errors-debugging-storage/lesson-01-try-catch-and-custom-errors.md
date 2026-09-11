# Lesson 1: Try/Catch and Custom Errors

## Learning Objectives
- Use `try`/`catch`/`finally` to handle runtime errors
- Understand the built-in `Error` object and its properties
- Throw your own errors with `throw`
- Create custom error classes by extending `Error`
- Understand how errors propagate up the call stack
- Handle errors in async code (`async`/`await` + `try`/`catch`)

## Introduction

Throughout this book you've occasionally seen code that could fail — a `fetch()` call in Module 05 that might reject, a `JSON.parse()` that could throw on malformed input. So far you've relied on `.catch()` for Promises. This lesson covers JavaScript's general-purpose error-handling mechanism: `try`/`catch`, which works for both synchronous code and, combined with `async`/`await`, asynchronous code too.

## 1. The `try`/`catch` statement

```javascript
try {
  const result = JSON.parse('{ invalid json');
  console.log(result);
} catch (error) {
  console.log('Something went wrong:', error.message);
}
```

Code in the `try` block runs normally until something throws. The moment it does, execution jumps straight to `catch`, skipping the rest of the `try` block entirely.

## 2. `finally`

`finally` runs **no matter what** — whether the `try` block succeeded, failed, or even if the `catch` block itself threw a new error. It's used for cleanup that must always happen (closing a connection, hiding a loading spinner):

```javascript
function loadData() {
  showSpinner();
  try {
    const data = riskyParse();
    return data;
  } catch (error) {
    console.error('Load failed:', error.message);
    return null;
  } finally {
    hideSpinner(); // always runs, success or failure
  }
}
```

## 3. The `Error` object

```javascript
const err = new Error('Something broke');
console.log(err.message); // 'Something broke'
console.log(err.name);    // 'Error'
console.log(err.stack);   // multi-line stack trace, useful for debugging (see Lesson 2)
```

JavaScript has several built-in error subtypes you'll encounter, each still an `Error` under the hood:

```javascript
new TypeError('x is not a function');       // wrong type used
new RangeError('Invalid array length');     // value out of allowed range
new ReferenceError('x is not defined');     // referencing something that doesn't exist
new SyntaxError('Unexpected token');        // usually thrown by the engine itself, e.g. bad JSON.parse input
```

## 4. Throwing your own errors

`throw` works with any value, but conventionally you throw an `Error` (or subclass) so callers get a `.message` and `.stack`:

```javascript
function withdraw(balance, amount) {
  if (amount > balance) {
    throw new Error('Insufficient funds');
  }
  return balance - amount;
}

try {
  withdraw(100, 150);
} catch (error) {
  console.log(error.message); // 'Insufficient funds'
}
```

## 5. Catching specific error types

Since `catch` receives one error object, use `instanceof` (Module 06, Lesson 2) to branch on the kind of error:

```javascript
try {
  riskyOperation();
} catch (error) {
  if (error instanceof TypeError) {
    console.log('A type error occurred:', error.message);
  } else if (error instanceof RangeError) {
    console.log('A range error occurred:', error.message);
  } else {
    console.log('Unknown error:', error.message);
    throw error; // re-throw if you don't know how to handle it
  }
}
```

Re-throwing is an important pattern: if a `catch` block can't meaningfully recover from an error, it should let it propagate rather than silently swallowing it.

## 6. Custom error classes

Recall `class`/`extends` from Module 06, Lesson 2. Extending `Error` lets you create domain-specific error types that still behave like real errors (with `.message`, `.stack`, `instanceof Error`):

```javascript
class ValidationError extends Error {
  constructor(message, field) {
    super(message);       // sets this.message
    this.name = 'ValidationError'; // overrides the default 'Error' name
    this.field = field;   // custom extra data
  }
}

class NotFoundError extends Error {
  constructor(resource) {
    super(`${resource} not found`);
    this.name = 'NotFoundError';
  }
}

function validateAge(age) {
  if (typeof age !== 'number') {
    throw new ValidationError('Age must be a number', 'age');
  }
  if (age < 0) {
    throw new ValidationError('Age cannot be negative', 'age');
  }
}

try {
  validateAge(-5);
} catch (error) {
  if (error instanceof ValidationError) {
    console.log(`Validation failed on "${error.field}": ${error.message}`);
  }
}
```

## 7. Errors in async code

In Module 05 you learned `async`/`await`. A rejected Promise inside an `async` function behaves exactly like a thrown error — `try`/`catch` catches it directly, no `.catch()` needed:

```javascript
async function fetchUser(id) {
  try {
    const response = await fetch(`/api/users/${id}`);
    if (!response.ok) {
      throw new NotFoundError(`User ${id}`);
    }
    return await response.json();
  } catch (error) {
    console.error('Failed to fetch user:', error.message);
    throw error; // propagate to the caller
  }
}
```

## 8. Error propagation up the call stack

If a function doesn't catch an error, it automatically propagates up to whichever function called it, and so on, until either something catches it or it reaches the top and crashes the program (or, in the browser, logs an uncaught error to the console without halting the whole page):

```javascript
function level3() {
  throw new Error('Failure at level 3');
}
function level2() {
  level3(); // no try/catch here — error passes through
}
function level1() {
  try {
    level2();
  } catch (error) {
    console.log('Caught at level1:', error.message); // 'Failure at level 3'
  }
}
level1();
```

## Practical Example

A small form-processing function combining custom errors, `finally`, and async error handling:

```javascript
class ValidationError extends Error {
  constructor(message, field) {
    super(message);
    this.name = 'ValidationError';
    this.field = field;
  }
}

function validateSignup({ email, password }) {
  if (!email?.includes('@')) {
    throw new ValidationError('Invalid email address', 'email');
  }
  if (!password || password.length < 8) {
    throw new ValidationError('Password must be at least 8 characters', 'password');
  }
}

async function submitSignup(formData) {
  showSpinner();
  try {
    validateSignup(formData);
    const response = await fetch('/api/signup', {
      method: 'POST',
      body: JSON.stringify(formData),
    });
    if (!response.ok) {
      throw new Error(`Server responded with ${response.status}`);
    }
    return await response.json();
  } catch (error) {
    if (error instanceof ValidationError) {
      console.log(`Fix the "${error.field}" field: ${error.message}`);
    } else {
      console.log('Signup failed:', error.message);
    }
    return null;
  } finally {
    hideSpinner();
  }
}

function showSpinner() { console.log('Loading...'); }
function hideSpinner() { console.log('Done.'); }
```

## Revision Questions

<details>
<summary>1. What runs a `finally` block, and when?</summary>

`finally` always runs after `try`/`catch`, regardless of whether the `try` succeeded, the `catch` handled an error, or even if the `catch` block itself threw. It's meant for cleanup that must happen unconditionally.
</details>

<details>
<summary>2. How would you create an error type specific to your application?</summary>

Extend the built-in `Error` class, call `super(message)` in the constructor to set `.message`, then set `this.name` to your custom type name and add any extra properties needed.
</details>

<details>
<summary>3. What happens if a function doesn't catch an error it encounters?</summary>

The error propagates up to the function that called it, and continues propagating until some `catch` block handles it, or it reaches the top of the program uncaught.
</details>

<details>
<summary>4. Why might a `catch` block re-throw an error instead of handling it?</summary>

If the `catch` block doesn't know how to meaningfully recover from that particular error, silently swallowing it can hide bugs. Re-throwing lets a more appropriate handler further up the call stack deal with it.
</details>

<details>
<summary>5. How does `try`/`catch` interact with `async`/`await`?</summary>

Inside an `async` function, an `await`ed Promise that rejects behaves like a thrown error — it can be caught directly with a normal `try`/`catch` block, without needing `.catch()`.
</details>
