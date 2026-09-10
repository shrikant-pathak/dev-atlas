# Lesson 04: Arrays and Methods

## Learning Objectives
By the end of this lesson, you will be able to:
- Create, index, and modify arrays
- Distinguish mutating array methods from non-mutating ones
- Use `map`, `filter`, and `reduce` to transform and summarize array data
- Use common utility methods like `find`, `includes`, `join`, and `sort`

## Introduction

You've used arrays in passing since earlier modules (`const scores = [10, 20, 30];` back in Module 02, Lesson 03) without a full introduction. An **array** is an ordered list of values — and it's where the higher-order functions from Module 02, Lesson 04 truly shine, since almost every powerful array method is a higher-order function under the hood.

## Creating and Indexing Arrays

```js
const fruits = ["apple", "banana", "cherry"];

fruits[0];         // "apple" — arrays are zero-indexed
fruits[2];         // "cherry"
fruits.length;      // 3
fruits[fruits.length - 1]; // "cherry" — common pattern for "the last item"
```

Arrays can hold mixed types, including other arrays and objects:

```js
const mixed = [1, "two", true, { three: 3 }, [4, 5]];
```

## Mutating vs. Non-Mutating Methods

This distinction matters as much for arrays as it did for `const` (Module 01, Lesson 03) and `Date` (Lesson 03) — some array methods change the original array, and some return a brand-new one.

### Mutating Methods (change the original array)

```js
const nums = [1, 2, 3];

nums.push(4);       // adds to the end → [1, 2, 3, 4]
nums.pop();          // removes from the end → [1, 2, 3]
nums.unshift(0);      // adds to the start → [0, 1, 2, 3]
nums.shift();          // removes from the start → [1, 2, 3]
nums.splice(1, 1);      // removes 1 item starting at index 1 → [1, 3]
nums.splice(1, 0, 9);    // inserts 9 at index 1, removes nothing → [1, 9, 3]
```

### Non-Mutating Methods (return a new array/value, leave the original untouched)

```js
const nums = [1, 2, 3];

nums.slice(1);        // [2, 3] — nums is still [1, 2, 3]
nums.concat([4, 5]);   // [1, 2, 3, 4, 5] — nums is still [1, 2, 3]
```

**Prefer non-mutating methods whenever possible** — they're safer and more predictable, especially once you reach patterns in React (later in this path) that rely on never modifying data directly.

## Searching Arrays

```js
const users = ["Ada", "Grace", "Alan"];

users.includes("Grace");   // true
users.indexOf("Alan");     // 2
users.find(name => name.startsWith("G"));      // "Grace" — first match, or undefined
users.findIndex(name => name.startsWith("G")); // 1
```

## `forEach`, `map`, `filter`, `reduce` — The Core Four

These are the higher-order functions (Module 02, Lesson 04) you'll use constantly in real code.

### `.forEach()` — run something for each item, return nothing

```js
const nums = [1, 2, 3];
nums.forEach(num => console.log(num * 2));
// 2
// 4
// 6
```

### `.map()` — transform every item into a new array (non-mutating)

```js
const nums = [1, 2, 3];
const doubled = nums.map(num => num * 2);
console.log(doubled); // [2, 4, 6]
console.log(nums);     // [1, 2, 3] — unchanged
```

### `.filter()` — keep only items that pass a test (non-mutating)

```js
const nums = [1, 2, 3, 4, 5, 6];
const evens = nums.filter(num => num % 2 === 0);
console.log(evens); // [2, 4, 6]
```

### `.reduce()` — combine every item into a single result

```js
const nums = [1, 2, 3, 4];
const total = nums.reduce((accumulator, current) => accumulator + current, 0);
console.log(total); // 10
```

`reduce`'s first argument to the callback (`accumulator`) carries forward the running result; the second argument (`0` here) is the starting value. `.reduce()` is the most flexible of the four — `map` and `filter` can both technically be built using `reduce`, though you'll use the more specific methods for clarity in real code.

## Other Common Utility Methods

```js
const nums = [3, 1, 4, 1, 5];

nums.sort();                 // [1, 1, 3, 4, 5] — MUTATES, and sorts as strings by default!
nums.sort((a, b) => a - b);   // correct numeric ascending sort
nums.reverse();               // MUTATES — reverses in place

const words = ["Hello", "World"];
words.join(" ");               // "Hello World" — the inverse of String's .split() from Lesson 01
```

**`sort()` without a comparator sorts elements as strings** — a classic gotcha, since `[10, 1, 2].sort()` produces `[1, 10, 2]`, not `[1, 2, 10]`. Always pass a comparator function for numeric sorting.

## Practical Example

```js
// order-summary.js

const orders = [
  { product: "Keyboard", price: 2000, quantity: 2 },
  { product: "Mouse", price: 500, quantity: 3 },
  { product: "Monitor", price: 12000, quantity: 1 }
];

const lineItemTotals = orders.map(order => order.price * order.quantity);
console.log(lineItemTotals); // [4000, 1500, 12000]

const grandTotal = orders.reduce((sum, order) => sum + order.price * order.quantity, 0);
console.log(grandTotal); // 17500

const expensiveItems = orders.filter(order => order.price > 1000);
console.log(expensiveItems.map(order => order.product)); // ["Keyboard", "Monitor"]
```

## Revision Questions

<details>
<summary>1. Name two mutating array methods and two non-mutating ones.</summary>

Mutating: `.push()`, `.pop()`, `.shift()`, `.unshift()`, `.splice()`, `.sort()`, `.reverse()` (any two). Non-mutating: `.slice()`, `.concat()`, `.map()`, `.filter()` (any two).
</details>

<details>
<summary>2. What's the difference between `.map()` and `.filter()`?</summary>

`.map()` transforms every element into a new value, producing a new array of the same length. `.filter()` keeps only the elements that pass a given test, producing a new array that may be shorter.
</details>

<details>
<summary>3. What does `.reduce()` do, and what are its two key arguments?</summary>

It combines every element of an array into a single result. Its callback receives an `accumulator` (the running result so far) and the `current` element; `.reduce()` also takes an optional starting value for the accumulator.
</details>

<details>
<summary>4. Why does `[10, 1, 2].sort()` produce `[1, 10, 2]` instead of `[1, 2, 10]`?</summary>

Without a comparator function, `.sort()` converts elements to strings and sorts them lexicographically (alphabetically) — comparing "10" and "2" as text, "1" comes before "2" as a character. Passing a numeric comparator (`(a, b) => a - b`) fixes this.
</details>

<details>
<summary>5. Why are non-mutating methods generally preferred over mutating ones?</summary>

They're safer and more predictable — the original array is never accidentally changed elsewhere in the program, which becomes especially important once working with patterns (like those used in React, later in this path) that rely on data never being modified directly.
</details>
