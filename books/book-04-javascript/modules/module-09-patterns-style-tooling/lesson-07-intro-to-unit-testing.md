# Lesson 7: Intro to Unit Testing

## Learning Objectives
- Understand what a unit test is and what makes a test "unit" versus other kinds of testing
- Write basic tests using Jest-style syntax: `describe`, `test`/`it`, `expect`
- Understand common matchers and how to test both sync and async code
- Understand mocking at a conceptual level
- Recognize how testing connects to everything else in this module (linting, npm scripts, patterns)

## Introduction

Every lesson in this module so far has been about making code easier to *read* and *maintain*. Testing is about making code easier to **trust** — proving, in an automated and repeatable way, that a piece of code does what you believe it does, and that it keeps doing so after you (or a teammate) change something else nearby. This lesson is a deliberately gentle introduction — a full testing curriculum is its own book — focused on the core mental model and the syntax you'll recognize in almost any modern JavaScript project.

## What "Unit" Means

A **unit test** verifies a single, small, isolated piece of code — typically one function — in complete isolation from the rest of the system: no real network calls, no real database, no dependency on other functions behaving correctly. This is distinct from **integration tests** (verifying multiple pieces work together correctly) and **end-to-end tests** (verifying a real user flow through the entire running application) — both real and valuable, but outside this lesson's scope.

The value of keeping unit tests narrow and isolated is precision: when a unit test fails, you know almost exactly which small piece of logic broke, rather than needing to investigate a tangle of interacting systems.

## Basic Syntax: describe, test, expect

Most JavaScript testing frameworks (Jest, Vitest — which you'll recognize from Lesson 5's Vite example — and others) share a nearly identical basic syntax:

```js
// math.js
export function add(a, b) {
  return a + b;
}

export function isEven(num) {
  return num % 2 === 0;
}
```

```js
// math.test.js
import { add, isEven } from './math.js';

describe('add', () => {
  test('adds two positive numbers', () => {
    expect(add(2, 3)).toBe(5);
  });

  test('handles negative numbers', () => {
    expect(add(-1, -1)).toBe(-2);
  });
});

describe('isEven', () => {
  test('returns true for even numbers', () => {
    expect(isEven(4)).toBe(true);
  });

  test('returns false for odd numbers', () => {
    expect(isEven(3)).toBe(false);
  });
});
```

- **`describe`** groups related tests together under a shared label — purely organizational, for readable output.
- **`test`** (or its alias `it`) defines one individual test case, with a description of what it verifies.
- **`expect(value)`** wraps the value you're checking, chained with a **matcher** describing the expected outcome.

## Common Matchers

```js
expect(value).toBe(5);                    // strict equality (===), for primitives
expect(array).toEqual([1, 2, 3]);         // deep equality, for objects/arrays
expect(value).toBeTruthy();               // any truthy value
expect(value).toBeFalsy();                // any falsy value
expect(value).toBeNull();
expect(fn).toThrow();                     // expects calling fn to throw an error
expect(array).toContain(3);               // array contains a specific item
expect(mockFn).toHaveBeenCalled();        // a mock function was called (see below)
expect(mockFn).toHaveBeenCalledWith('x'); // a mock function was called with specific args
```

The distinction between `toBe` and `toEqual` matters and is a common early mistake: `toBe` checks strict reference equality, which works fine for primitives (numbers, strings) but fails for objects/arrays that are *structurally* identical but not the *same reference* — for those, use `toEqual`.

```js
expect({ name: 'Ada' }).toBe({ name: 'Ada' });   // fails! different object references
expect({ name: 'Ada' }).toEqual({ name: 'Ada' }); // passes — same structure/values
```

## Testing Async Code

Since async/await (Module 05) is central to real-world JavaScript, testing frameworks support it directly:

```js
// api.js
export async function fetchUser(id) {
  const response = await fetch(`/api/users/${id}`);
  return response.json();
}
```

```js
// api.test.js
test('fetchUser returns user data', async () => {
  const user = await fetchUser(1);
  expect(user).toEqual({ id: 1, name: 'Ada' });
});
```

Just add `async` to the test function and `await` the call being tested — the test runner waits for the returned Promise to resolve (or reject) before checking the result, exactly like any other async code from Module 05.

## Mocking (Conceptual Introduction)

Real functions often depend on things you don't want a unit test to actually touch — a real network request, a real database, the real current time. **Mocking** replaces those dependencies with fake, controlled stand-ins for the duration of a test, so you can test your function's logic in isolation without its real-world side effects.

```js
// Mocking the global fetch function so no real network request happens
global.fetch = jest.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve({ id: 1, name: 'Ada' })
  })
);

test('fetchUser calls fetch with the correct URL', async () => {
  await fetchUser(1);
  expect(fetch).toHaveBeenCalledWith('/api/users/1');
});
```

This connects directly back to the Observer/Factory patterns from Lesson 1: a mock is essentially a fake object standing in for a real one, matching just enough of its shape (its "interface") to be usable by the code under test — and to the Proxy material from Lesson 2, since some mocking libraries implement mocks using `Proxy` internally to intercept calls.

## How Testing Connects to the Rest of This Module

- **Lesson 4 (npm)**: test runners like Jest and Vitest are themselves npm packages, installed as `devDependencies` (they're needed only during development, never shipped to production) and run via an npm script (`"test": "jest"`).
- **Lesson 5 (Bundlers)**: Vitest specifically is built to share configuration with Vite, so projects already using Vite for bundling get a matching, fast test runner with minimal extra setup.
- **Lesson 6 (ESLint)**: many teams add `eslint-plugin-jest` to lint their *test files* too, catching mistakes like a test with no assertions at all.
- **Lesson 1 (Patterns)**: well-structured code using clear patterns (small, focused functions; factories with predictable output) is inherently easier to write isolated unit tests for than a large, tangled function doing five things at once — testability is a natural side effect of good structure, not a separate concern bolted on afterward.

## Practical Example

A small, complete example testing a function with a mocked dependency, pulling together several ideas from this lesson:

```js
// discount.js
export function applyDiscount(price, getDiscountRate) {
  const rate = getDiscountRate();
  return price * (1 - rate);
}
```

```js
// discount.test.js
import { applyDiscount } from './discount.js';

describe('applyDiscount', () => {
  test('applies a 10% discount correctly', () => {
    const mockGetRate = jest.fn(() => 0.10);
    const result = applyDiscount(100, mockGetRate);

    expect(result).toBe(90);
    expect(mockGetRate).toHaveBeenCalled();
  });

  test('applies a 0% discount when rate is 0', () => {
    const mockGetRate = jest.fn(() => 0);
    expect(applyDiscount(50, mockGetRate)).toBe(50);
  });
});
```

Passing `getDiscountRate` as a parameter (rather than, say, fetching it from a real API inside `applyDiscount` directly) is itself a design choice that makes this function easy to test — another concrete link back to Lesson 1's idea that decoupled, isolated pieces of logic are both easier to reason about *and* easier to verify automatically.

## Revision Questions

<details>
<summary>1. What distinguishes a unit test from an integration test or an end-to-end test?</summary>

A unit test verifies a single, small, isolated piece of code (typically one function) with no real dependencies on other systems. Integration tests verify multiple pieces working together, and end-to-end tests verify a real user flow through the entire running application — both broader in scope than a unit test.
</details>

<details>
<summary>2. Why does expect({ name: 'Ada' }).toBe({ name: 'Ada' }) fail, while toEqual would pass?</summary>

`toBe` checks strict reference equality — the two objects are different objects in memory, even though their contents match, so the check fails. `toEqual` checks deep/structural equality, comparing the actual values inside the objects rather than their references, so it passes.
</details>

<details>
<summary>3. Why would you mock a function like fetch instead of letting a unit test make a real network request?</summary>

Mocking replaces the real dependency with a fake, controlled stand-in, so the test verifies your own function's logic in isolation, without depending on network availability, real server responses, or side effects like actually modifying real data — which would make the test slow, unreliable, or unsafe to run repeatedly.
</details>

<details>
<summary>4. How does passing getDiscountRate as a parameter to applyDiscount (rather than hardcoding the logic to fetch it internally) make the function easier to test?</summary>

Because the dependency is passed in rather than baked into the function, a test can substitute a simple mock function returning a known, fixed value instead of needing a real data source. This isolates the test to just `applyDiscount`'s own logic, without needing to also set up or mock whatever the real rate-fetching mechanism would be.
</details>
