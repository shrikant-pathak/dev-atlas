# Lesson 05: Destructuring, Spread, and Rest

## Learning Objectives
By the end of this lesson, you will be able to:
- Destructure arrays and objects into individual variables
- Provide default values and rename variables during destructuring
- Use the spread operator to copy and combine arrays and objects
- Use rest parameters to collect multiple function arguments into an array

## Introduction

Now that you're comfortable with arrays (Lesson 04) and objects (Module 02, Lesson 07), this lesson covers three closely related ES6 features (formally covered in full in Module 06) that make working with both dramatically more convenient: **destructuring**, the **spread operator**, and **rest parameters**. You've actually already seen a hint of the underlying spread syntax used differently in earlier lessons — this lesson makes all of it explicit.

## Array Destructuring

Instead of accessing array items one by one with indexes (Lesson 04), you can unpack them directly into named variables:

```js
const coordinates = [12.9716, 77.5946];

// Without destructuring:
const lat = coordinates[0];
const lng = coordinates[1];

// With destructuring — identical result:
const [lat, lng] = coordinates;
```

You can skip elements you don't need with an empty slot:

```js
const [first, , third] = ["a", "b", "c"];
console.log(first, third); // "a" "c"
```

## Object Destructuring

Unpack object properties directly into variables matching the property names:

```js
const user = { name: "Ada", age: 30, city: "Pune" };

// Without destructuring:
const name = user.name;
const age = user.age;

// With destructuring — identical result:
const { name, age } = user;
```

### Renaming While Destructuring

```js
const { name: fullName } = user;
console.log(fullName); // "Ada" — note: `name` no longer exists as a variable here, only `fullName`
```

### Default Values

Useful when a property might not exist:

```js
const { name, country = "Unknown" } = user;
console.log(country); // "Unknown" — user has no `country` property, so the default is used
```

### Destructuring Function Parameters

Extremely common in real code, including React components you'll write later in this path — destructuring directly in a parameter list:

```js
function printUser({ name, age }) {
  console.log(`${name} is ${age} years old`);
}

printUser(user); // "Ada is 30 years old"
```

## The Spread Operator (`...`)

Spread "expands" an array or object's contents in a new location — commonly used for copying and combining.

### Spreading Arrays

```js
const nums = [1, 2, 3];
const copy = [...nums];          // [1, 2, 3] — a genuine new array, not the same reference
const combined = [...nums, 4, 5]; // [1, 2, 3, 4, 5]
const merged = [...nums, ...[6, 7]]; // [1, 2, 3, 6, 7]
```

This is the standard, non-mutating way (Lesson 04) to add to or combine arrays without touching the originals.

### Spreading Objects

```js
const user = { name: "Ada", age: 30 };
const updated = { ...user, age: 31 };      // { name: "Ada", age: 31 } — later keys override earlier ones
const withCity = { ...user, city: "Pune" }; // { name: "Ada", age: 30, city: "Pune" }
```

### Spreading Into Function Calls

```js
function add(a, b, c) {
  return a + b + c;
}

const nums = [1, 2, 3];
console.log(add(...nums)); // 6 — equivalent to add(1, 2, 3)
```

## Rest Parameters

The same `...` syntax, used in the opposite direction: **collecting** multiple values into a single array, rather than expanding one. Most commonly seen in function parameter lists, to accept any number of arguments.

```js
function sum(...numbers) {
  return numbers.reduce((total, n) => total + n, 0);
}

console.log(sum(1, 2));       // 3
console.log(sum(1, 2, 3, 4)); // 10
```

Rest can also collect the "remaining" items during destructuring:

```js
const [first, ...rest] = [1, 2, 3, 4];
console.log(first); // 1
console.log(rest);   // [2, 3, 4]

const { name, ...otherDetails } = { name: "Ada", age: 30, city: "Pune" };
console.log(otherDetails); // { age: 30, city: "Pune" }
```

**Spread and rest use identical syntax (`...`) but opposite meanings**: spread *expands* a collection out; rest *gathers* multiple values in. Which one you're looking at depends entirely on context — inside a destructuring pattern or parameter list, it's rest; anywhere else (array literal, object literal, function call), it's spread.

## Practical Example

```js
// checkout-summary.js

function summarizeOrder({ items, ...metadata }) {
  const itemTotal = items.reduce((sum, item) => sum + item.price, 0);
  return { itemTotal, ...metadata };
}

const order = {
  items: [{ price: 500 }, { price: 1200 }],
  customer: "Ada",
  orderId: "A123"
};

console.log(summarizeOrder(order));
// { itemTotal: 1700, customer: "Ada", orderId: "A123" }
```

## Revision Questions

<details>
<summary>1. Rewrite `const lat = coords[0]; const lng = coords[1];` using array destructuring.</summary>

`const [lat, lng] = coords;`
</details>

<details>
<summary>2. How do you rename a variable while object-destructuring, and provide a default value at the same time?</summary>

Combine both: `const { name: fullName = "Anonymous" } = user;` — this destructures `name` into a variable called `fullName`, falling back to `"Anonymous"` if `name` is missing.
</details>

<details>
<summary>3. What does `const copy = [...original];` produce, and why is this useful?</summary>

A brand-new array containing the same elements as `original`, but as a genuinely separate array in memory — useful for making a non-mutating copy before modifying it, so the original is never touched.
</details>

<details>
<summary>4. What's the difference between spread and rest, given they use the same `...` syntax?</summary>

Spread expands a collection's contents outward (e.g. into a new array, object, or function call). Rest gathers multiple individual values inward into a single array (e.g. in a function's parameter list or during destructuring). The direction is inferred from where the `...` appears.
</details>

<details>
<summary>5. In `const { name, ...otherDetails } = user;`, what ends up inside `otherDetails`?</summary>

Every property of `user` except `name` — rest collects "everything else" that wasn't explicitly destructured into its own named variable.
</details>
