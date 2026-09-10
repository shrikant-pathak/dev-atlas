# Lesson 06: Sets and Maps

## Learning Objectives
By the end of this lesson, you will be able to:
- Use a `Set` to store unique values and perform common set operations
- Use a `Map` to store key-value pairs with any type of key
- Explain when a `Map` is preferable to a plain object
- Convert between `Set`/`Map` and arrays

## Introduction

Arrays (Lesson 04) and objects (Module 02, Lesson 07) cover most everyday needs, but ES6 (formally covered in Module 06) introduced two more specialized collection types that solve specific problems more cleanly: **`Set`**, for storing unique values, and **`Map`**, for key-value pairs with more flexibility than a plain object.

## `Set` — A Collection of Unique Values

A `Set` automatically ignores duplicate values — nothing can be added to a `Set` twice.

```js
const uniqueNumbers = new Set([1, 2, 2, 3, 3, 3]);
console.log(uniqueNumbers); // Set(3) { 1, 2, 3 } — duplicates silently dropped
```

### Common `Set` Operations

```js
const tags = new Set();

tags.add("javascript");
tags.add("react");
tags.add("javascript"); // ignored — already present

tags.has("react");    // true
tags.delete("react");  // removes it
tags.size;               // 1

for (const tag of tags) {
  console.log(tag); // iterable, just like an array — for...of covered fully in Lesson 07
}
```

### Converting Between `Set` and Array

```js
const numbers = [1, 2, 2, 3, 3, 3];

const uniqueSet = new Set(numbers);   // Set(3) { 1, 2, 3 }
const uniqueArray = [...uniqueSet];    // [1, 2, 3] — spread operator (Lesson 05) turns it back into an array
```

This `[...new Set(array)]` pattern is the standard, idiomatic way to deduplicate an array in modern JavaScript.

## `Map` — Key-Value Pairs With Any Key Type

A `Map` is similar to a plain object, but with two important advantages: **any type of value can be a key** (not just strings/symbols, which is all a plain object allows), and a `Map` remembers **insertion order** reliably.

```js
const scores = new Map();

scores.set("Ada", 95);
scores.set("Grace", 88);

scores.get("Ada");    // 95
scores.has("Grace");   // true
scores.delete("Grace");
scores.size;             // 1
```

### Non-String Keys

```js
const userSettings = new Map();
const userObject = { id: 1 };

userSettings.set(userObject, { theme: "dark" }); // the object itself is the key
console.log(userSettings.get(userObject)); // { theme: "dark" }
```

A plain object would silently convert `userObject` to the string `"[object Object]"` if used as a key — a `Map` keeps it as the actual object reference.

### Iterating a `Map`

```js
const scores = new Map([
  ["Ada", 95],
  ["Grace", 88]
]);

for (const [name, score] of scores) {
  console.log(`${name}: ${score}`);
}
// "Ada: 95"
// "Grace: 88"
```

## When to Use `Map` Instead of a Plain Object

| Situation | Best choice |
|---|---|
| Keys are always simple strings, and you want easy JSON serialization | Plain object |
| Keys might be non-string values (numbers, objects) | `Map` |
| You need guaranteed insertion order and frequent additions/removals | `Map` |
| You're representing a fixed, known structure ("a user has a name and age") | Plain object |

## Practical Example

```js
// tag-counter.js

function countTags(posts) {
  const counts = new Map();

  for (const post of posts) {
    for (const tag of post.tags) {
      counts.set(tag, (counts.get(tag) || 0) + 1);
    }
  }

  return counts;
}

const posts = [
  { tags: ["js", "css"] },
  { tags: ["js", "html"] },
  { tags: ["css"] }
];

const tagCounts = countTags(posts);

for (const [tag, count] of tagCounts) {
  console.log(`${tag}: ${count}`);
}
// "js: 2"
// "css: 2"
// "html: 1"
```

## Revision Questions

<details>
<summary>1. What happens if you `.add()` the same value to a `Set` twice?</summary>

Nothing — the second `.add()` is silently ignored, since a `Set` only ever stores unique values.
</details>

<details>
<summary>2. What's the idiomatic one-line way to remove duplicates from an array using `Set`?</summary>

`[...new Set(array)]` — converting the array to a `Set` (removing duplicates), then spreading it back into a new array.
</details>

<details>
<summary>3. What key advantage does a `Map` have over a plain object for keys?</summary>

A `Map` can use any value — including objects, numbers, or other non-string values — as a key without converting it to a string, while a plain object effectively only supports string (or symbol) keys.
</details>

<details>
<summary>4. How do you retrieve a value from a `Map`?</summary>

`.get(key)` — analogous to `.set(key, value)` for adding one.
</details>

<details>
<summary>5. When might you prefer a plain object over a `Map`?</summary>

When keys are always simple strings representing a known, fixed structure (like a user's `name` and `age`), and you want easy JSON serialization — plain objects convert to JSON directly, while `Map` does not.
</details>
