# Lesson 07: Iterators and Generators

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what makes a value "iterable" in JavaScript
- Use `for...of` to loop over any iterable
- Write a generator function using `function*` and `yield`
- Explain practical use cases for generators

## Introduction

Throughout this module you've used `for...of` to loop over arrays, `Set`s, and `Map`s (Lesson 06) without explaining *why* that works uniformly across such different data structures. The answer is the **iterable protocol** — a shared agreement that lets JavaScript loop over very different collection types using the same syntax. This lesson explains that protocol, and introduces **generators**, a powerful tool for building custom iterables.

## The Iterable Protocol

A value is "iterable" if it implements a special method, accessible via `Symbol.iterator`, that returns an **iterator** — an object with a `.next()` method that produces values one at a time.

```js
const numbers = [10, 20, 30];
const iterator = numbers[Symbol.iterator]();

iterator.next(); // { value: 10, done: false }
iterator.next(); // { value: 20, done: false }
iterator.next(); // { value: 30, done: false }
iterator.next(); // { value: undefined, done: true }
```

You'll almost never call `[Symbol.iterator]()` and `.next()` directly like this in real code — `for...of` does it automatically, which is exactly why it works identically on arrays, strings, `Set`s, and `Map`s (Lesson 06), even though they're structured completely differently internally.

```js
for (const num of numbers) {
  console.log(num);
}
// 10
// 20
// 30
```

**Not everything is iterable** — plain objects, for instance, are not, by default:

```js
const user = { name: "Ada", age: 30 };

for (const value of user) {
  console.log(value);
}
// TypeError: user is not iterable
```

(This is exactly why iterating an object's properties requires a different approach, like `for...in` or `Object.entries()` combined with `for...of` — both covered fully in Module 04.)

## Generator Functions

A **generator function** is a special kind of function, declared with `function*`, that can pause and resume its execution — producing a sequence of values over time rather than returning just one value all at once.

```js
function* countToThree() {
  yield 1;
  yield 2;
  yield 3;
}

const gen = countToThree();

gen.next(); // { value: 1, done: false }
gen.next(); // { value: 2, done: false }
gen.next(); // { value: 3, done: false }
gen.next(); // { value: undefined, done: true }
```

Each call to `.next()` resumes the generator right where it left off, running until the next `yield` (or the function ends). Because generators automatically implement the iterable protocol, they work directly with `for...of`:

```js
for (const num of countToThree()) {
  console.log(num);
}
// 1
// 2
// 3
```

## Why Generators Are Useful

### Lazy Sequences

A generator can represent a sequence that's computed one value at a time, on demand — useful for very large or even infinite sequences that would be impossible to store as a full array in memory.

```js
function* infiniteCounter() {
  let count = 1;
  while (true) { // safe here — the generator pauses at each yield rather than looping forever immediately
    yield count;
    count++;
  }
}

const counter = infiniteCounter();

console.log(counter.next().value); // 1
console.log(counter.next().value); // 2
console.log(counter.next().value); // 3
// could keep calling .next() forever — nothing is pre-computed until asked for
```

### Building a Custom Iterable

You can add a `[Symbol.iterator]` method (using a generator, for simplicity) to make your own objects work with `for...of`, exactly like the built-ins do:

```js
const range = {
  start: 1,
  end: 5,
  [Symbol.iterator]: function* () {
    for (let i = this.start; i <= this.end; i++) {
      yield i;
    }
  }
};

for (const num of range) {
  console.log(num);
}
// 1, 2, 3, 4, 5
```

## Practical Example

```js
// paginated-results.js
// A generator that yields one "page" of results at a time from a larger array.

function* paginate(items, pageSize) {
  for (let i = 0; i < items.length; i += pageSize) {
    yield items.slice(i, i + pageSize); // .slice() from Lesson 04
  }
}

const results = ["a", "b", "c", "d", "e", "f", "g"];

for (const page of paginate(results, 3)) {
  console.log(page);
}
// ["a", "b", "c"]
// ["d", "e", "f"]
// ["g"]
```

## Revision Questions

<details>
<summary>1. What makes a value "iterable" in JavaScript?</summary>

It implements a method accessible via `Symbol.iterator` that returns an iterator object — one with a `.next()` method producing `{ value, done }` results one at a time. This shared protocol is what lets `for...of` work uniformly across arrays, strings, `Set`s, and `Map`s.
</details>

<details>
<summary>2. Is a plain object iterable by default?</summary>

No — attempting `for...of` on a plain object throws a `TypeError`, since plain objects don't implement the iterable protocol out of the box.
</details>

<details>
<summary>3. How do you declare a generator function, and what keyword produces its values?</summary>

With `function*` (an asterisk after `function`), and values are produced using the `yield` keyword inside the function body.
</details>

<details>
<summary>4. What happens each time `.next()` is called on a generator?</summary>

The generator resumes execution from exactly where it last paused, and runs until it hits the next `yield` (returning that value) or the function completes (returning `{ value: undefined, done: true }`).
</details>

<details>
<summary>5. Why are generators well-suited for representing very large or infinite sequences?</summary>

Because values are computed one at a time, on demand, as `.next()` is called — nothing needs to be pre-computed or stored all at once in memory, unlike a regular array which must exist in full before it can be used.
</details>
