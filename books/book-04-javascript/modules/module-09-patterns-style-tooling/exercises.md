# Module 09 Exercises

## Lesson 1: Design Patterns

**1. Module pattern bank account**
Build a `BankAccount` module (IIFE-based) that keeps `balance` fully private, exposing only `deposit(amount)`, `withdraw(amount)`, and `getBalance()`.

**2. Observer-based form validator**
Build an `EventEmitter`-based system where a form emits a `'field:changed'` event, and two independent listeners react to it — one logging the change, another updating a "form is dirty" flag.

**3. Factory with shared defaults**
Write a `createShape(type, options)` factory supporting `'circle'`, `'square'`, and `'triangle'`, each returning an object with a shared `area()` method appropriate to its shape.

**4. Singleton vs module comparison**
Write a class-based `Singleton` config object, then rewrite the same functionality as a plain ES module exporting a single config object. In a comment, explain why both behave the same way in practice.

## Lesson 2: Proxy and Reflect

**5. Validating proxy**
Build a `Proxy` around a `product` object that throws a `TypeError` if `price` is ever set to a negative number, using `Reflect.set` for the actual assignment when valid.

**6. Logging proxy**
Build a generic `withLogging(target)` function that wraps any object in a `Proxy`, logging every `get` and `set` operation with the property name and value involved.

**7. Default value proxy**
Build a `Proxy` that returns `'N/A'` for any property that doesn't exist on the target object, instead of `undefined`.

## Lesson 3: Naming Conventions & Style Guide

**8. Rename pass**
Given a snippet with `var x = getUsr(); var f = x.length > 0;`, rewrite it applying the casing and naming principles from the lesson.

**9. Boolean audit**
Find (or write) three boolean variables named unclearly (e.g., `status`, `flag`, `check`) and rename each to read like a yes/no question.

**10. Pick and justify**
Read a short comparison of Airbnb vs. Standard style guides online, then write 3–4 sentences on which you'd choose for a new solo project versus a 10-person team project, and why.

## Lesson 4: npm and Package Management

**11. Build a package.json from scratch**
Create a `package.json` for a small CLI tool with one production dependency, two dev dependencies, and three custom scripts (`start`, `test`, `lint`).

**12. Semver ranges**
Given the current version `2.4.1`, write out what `^2.4.1` and `~2.4.1` each would and would not allow as an update, with two concrete example versions for each.

**13. Explain the lockfile**
In your own words (2–3 sentences), explain what could go wrong on a team project if `package-lock.json` were added to `.gitignore` instead of committed.

## Lesson 5: Bundlers Overview

**14. Tree-shaking test**
Write a small `utils.js` file exporting three functions, only import and use one of them in `app.js`, and (if you have a bundler available) inspect the production build output to confirm the unused functions were removed.

**15. Compare startup approaches**
In 3–4 sentences, explain in your own words why Vite's dev server can start almost instantly on a large project, while a traditional upfront-bundling dev server cannot.

## Lesson 6: Linting with ESLint

**16. Configure from scratch**
Set up ESLint in a small existing project (or a new one), configure `no-unused-vars` and `eqeqeq` as errors, and intentionally write code that violates each to confirm they're caught.

**17. Extend a preset**
Add `eslint-config-airbnb` (or another published preset) to a project, then override one rule from it to better match your own preference, documenting why in a comment.

## Lesson 7: Intro to Unit Testing

**18. Test a pure function**
Write a `formatCurrency(amount)` function and at least three unit tests covering a normal case, a zero case, and a negative-number case.

**19. Mock a dependency**
Write a function that depends on an injected "clock" function (e.g., `getCurrentYear()`), then write a test that mocks the clock to a fixed value and asserts the function's output based on that fixed value.

**20. toBe vs toEqual**
Write one test that intentionally uses `toBe` on two structurally identical but separately-created objects (expecting it to fail), then fix it using `toEqual`, and explain the difference in a comment.
