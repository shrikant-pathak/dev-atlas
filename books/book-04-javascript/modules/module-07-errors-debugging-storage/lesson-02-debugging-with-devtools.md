# Lesson 2: Debugging with DevTools

## Learning Objectives
- Use `console` methods beyond `console.log()`
- Set and use breakpoints in browser DevTools
- Use the `debugger` statement
- Read and interpret a stack trace
- Inspect variables, the call stack, and scope while paused
- Use the Network and Elements panels for debugging beyond pure JS

## Introduction

You've used `console.log()` throughout this entire book to inspect values. That's a perfectly valid debugging technique, but it doesn't scale well — for complex bugs (a value that's wrong somewhere deep in an async chain, a DOM event that isn't firing as expected) you need tools that let you pause execution and look around. Every modern browser ships DevTools for exactly this, and the same skills transfer directly to debugging React/React Native apps in their respective devtools.

## 1. Beyond `console.log()`

```javascript
console.log('basic message');
console.info('info-level message');
console.warn('a warning, shown in yellow');
console.error('an error, shown in red with a stack trace');

console.table([{ name: 'Alice', age: 30 }, { name: 'Bob', age: 25 }]); // renders as an actual table

console.group('User details');
console.log('Name: Alice');
console.log('Age: 30');
console.groupEnd(); // collapses/indents related logs together

console.time('loop');
for (let i = 0; i < 1000000; i++) {} // just to measure something
console.timeEnd('loop'); // logs "loop: 4.2ms" — quick performance check

console.assert(1 === 2, 'This will log because the assertion is false');

console.trace('Show me how we got here'); // prints a full stack trace on demand

console.count('clicked'); // logs "clicked: 1", "clicked: 2"... each time it's called
```

## 2. Breakpoints in DevTools

Open DevTools (F12 or right-click → Inspect), go to the **Sources** panel, find your file, and click a line number to set a **breakpoint**. When execution reaches that line, it pauses, and you can:

- Inspect all variables currently in scope
- Step through code line by line (**Step over**, **Step into**, **Step out**)
- Hover over any variable to see its current value
- Type expressions into the **Console** while paused — it evaluates them in the paused scope

**Conditional breakpoints**: right-click a line number → "Add conditional breakpoint" — the code only pauses when your condition is true, essential when a bug only happens on, say, the 500th iteration of a loop.

## 3. The `debugger` statement

You can trigger a breakpoint directly from code, without manually finding the line in DevTools:

```javascript
function calculateTotal(items) {
  let total = 0;
  for (const item of items) {
    debugger; // execution pauses here automatically IF DevTools is open
    total += item.price;
  }
  return total;
}
```

`debugger` does nothing if DevTools isn't open — it's safe to leave in code temporarily during development, though it should be removed before committing.

## 4. Reading a stack trace

Recall from Lesson 1 that every `Error` has a `.stack` property. When an uncaught error appears in the console, DevTools shows this same information, listing the chain of function calls that led to the error, most recent first:

TypeError: Cannot read properties of undefined (reading 'name')
at getUserName (app.js:15)
at displayUser (app.js:22)
at handleClick (app.js:30)


Reading bottom to top: `handleClick` was called first (probably from a click event), which called `displayUser`, which called `getUserName`, where the error actually occurred at line 15. Clicking any line in DevTools jumps straight to that source location.

## 5. The Call Stack panel

While paused at a breakpoint, the **Call Stack** panel in DevTools shows the same information interactively — every function currently "in progress," with the ability to click each frame to inspect that function's local variables at that exact point in execution.

## 6. Watch expressions and the Scope panel

While paused:
- The **Scope** panel automatically lists every variable in the current local, closure (recall closures from Module 02, Lesson 3), and global scope.
- **Watch expressions** let you pin a specific expression (like `items.length` or `user?.name`) to track its value across every step, without hunting for it in the Scope panel each time.

## 7. Network panel basics

For debugging `fetch()` calls from Module 05, the **Network** panel shows every request: its status code, response body, headers, and timing. This is often faster than adding `console.log()` statements around a fetch call — you can see the actual response the server sent, replay the request, or check whether it was even sent at all.

## 8. Elements panel and live DOM inspection

Ties back to Module 04's DOM work: the **Elements** panel shows the live DOM tree (which may differ from your original HTML source after JS has run). You can edit attributes/styles directly in the browser to test changes instantly, and use "Break on... subtree modifications" to pause execution the moment a specific element changes — useful for catching unexpected DOM mutations.

## Practical Example

A buggy function and the debugging process for it, shown as commented-out DevTools steps:

```javascript
function getDiscountedPrice(items, discountPercent) {
  console.group('getDiscountedPrice');
  console.log('items:', items);
  console.log('discountPercent:', discountPercent);

  let total = 0;
  for (const item of items) {
    // debugger; // <- uncomment to pause here on each iteration and inspect `item`
    total += item.price;
  }

  const discount = total * (discountPercent / 100);
  console.assert(discount >= 0, 'Discount should never be negative!');

  console.timeEnd('discount-calc'); // paired with a console.time('discount-calc') at the caller
  console.groupEnd();

  return total - discount;
}

console.time('discount-calc');
try {
  const result = getDiscountedPrice([{ price: 50 }, { price: 30 }], 10);
  console.log('Final price:', result); // 72
} catch (error) {
  console.error('Calculation failed:', error); // stack trace shown automatically
}
```

## Revision Questions

<details>
<summary>1. What's the advantage of `console.table()` over `console.log()` for an array of objects?</summary>

`console.table()` renders the array as an actual sortable table with one column per property, which is far easier to scan than the nested object output of `console.log()` for anything beyond a couple of items.
</details>

<details>
<summary>2. What does the `debugger` statement do, and when is it a no-op?</summary>

It pauses execution at that line, exactly like a manually set breakpoint. It only has an effect if DevTools is currently open; otherwise, the line is effectively skipped with no impact.
</details>

<details>
<summary>3. When reading a stack trace, which call happened first: the top line or the bottom line?</summary>

The bottom line happened first. Stack traces list the most recent call at the top and the earliest/originating call at the bottom.
</details>

<details>
<summary>4. What's a conditional breakpoint useful for?</summary>

Pausing execution only when a specific condition is true — for example, only on the 500th loop iteration, or only when a variable equals a specific unexpected value — instead of manually stepping through every iteration to find the one that matters.
</details>

<details>
<summary>5. Why might the Network panel be faster than `console.log()` for debugging a `fetch()` call?</summary>

It shows the actual request and response directly — status code, headers, full response body, and timing — without needing to add logging statements around the fetch call, and lets you inspect or even replay past requests.
</details>
