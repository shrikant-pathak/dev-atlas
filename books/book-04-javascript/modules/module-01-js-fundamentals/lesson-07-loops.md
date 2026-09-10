# Lesson 07: Loops

## Learning Objectives
By the end of this lesson, you will be able to:
- Write `for`, `while`, and `do...while` loops
- Use `break` and `continue` to control loop execution
- Recognize infinite loops and avoid them
- Nest loops when needed

## Introduction

Conditionals (Lesson 06) let a program make a decision once. Loops let a program **repeat** an action — essential for anything involving multiple items, like processing every product in a cart or every character in a string (both covered fully in Module 03).

## The `for` Loop

The most common loop when you know how many times to repeat something.

```js
for (let i = 0; i < 5; i++) {
  console.log(i);
}
// 0
// 1
// 2
// 3
// 4
```

A `for` loop has three parts, separated by semicolons:
1. **Initialization** — `let i = 0` — runs once, before the loop starts
2. **Condition** — `i < 5` — checked before every iteration; the loop continues while it's `true`
3. **Update** — `i++` — runs after every iteration

## The `while` Loop

Best when you don't know in advance how many iterations you'll need — the loop continues as long as its condition stays true.

```js
let count = 0;

while (count < 3) {
  console.log("Count is: " + count);
  count++;
}
```

**Careful**: if the condition never becomes `false`, you get an **infinite loop**, which will freeze or crash your program. Always make sure something inside the loop moves it toward the condition becoming false.

```js
// DANGER — infinite loop, count is never updated
// while (count < 3) {
//   console.log(count);
// }
```

## The `do...while` Loop

Like `while`, but it checks the condition **after** running the loop body — guaranteeing the body runs at least once, even if the condition is false from the start.

```js
let attempts = 0;

do {
  console.log("Attempt #" + (attempts + 1));
  attempts++;
} while (attempts < 3);
```

## `break` and `continue`

- **`break`** exits the loop entirely.
- **`continue`** skips the rest of the current iteration and moves to the next one.

```js
for (let i = 0; i < 10; i++) {
  if (i === 5) {
    break; // stop the loop completely once i is 5
  }
  console.log(i);
}
// 0, 1, 2, 3, 4

for (let i = 0; i < 5; i++) {
  if (i === 2) {
    continue; // skip printing 2, but keep looping
  }
  console.log(i);
}
// 0, 1, 3, 4
```

## Nested Loops

A loop inside another loop — useful for anything grid-like (rows and columns, for example).

```js
for (let row = 1; row <= 3; row++) {
  for (let col = 1; col <= 3; col++) {
    console.log(`Row ${row}, Col ${col}`);
  }
}
```

The inner loop completes fully for every single iteration of the outer loop.

## Practical Example

```js
// find-primes.js
// Find and log all prime numbers between 2 and 20 (a classic loop exercise)

for (let num = 2; num <= 20; num++) {
  let isPrime = true;

  for (let divisor = 2; divisor < num; divisor++) {
    if (num % divisor === 0) {
      isPrime = false;
      break; // no need to keep checking once we know it's not prime
    }
  }

  if (isPrime) {
    console.log(num + " is prime");
  }
}
```

## Revision Questions

<details>
<summary>1. What are the three parts of a `for` loop's parentheses, and what does each do?</summary>

Initialization (runs once before the loop starts), condition (checked before each iteration — the loop continues while it's true), and update (runs after each iteration). Example: `for (let i = 0; i < 5; i++)`.
</details>

<details>
<summary>2. What's the key difference between `while` and `do...while`?</summary>

`while` checks its condition before running the loop body, so the body might never run. `do...while` checks the condition after running the body, so the body always runs at least once.
</details>

<details>
<summary>3. What causes an infinite loop, and how do you avoid one?</summary>

An infinite loop happens when the loop's condition never becomes false — typically because the code inside the loop doesn't update the variable the condition depends on. Always ensure something in the loop body moves the condition toward becoming false.
</details>

<details>
<summary>4. What's the difference between `break` and `continue`?</summary>

`break` exits the loop entirely. `continue` skips only the rest of the current iteration and moves on to the next one — the loop keeps running.
</details>

<details>
<summary>5. In a nested loop, how many times does the inner loop run relative to the outer loop?</summary>

The inner loop runs to completion for every single iteration of the outer loop.
</details>
