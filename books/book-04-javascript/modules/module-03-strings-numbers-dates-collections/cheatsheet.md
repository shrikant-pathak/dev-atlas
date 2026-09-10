# Module 03 Cheatsheet — Strings, Numbers, Dates & Collections

## Template Literals
```js
`Hi ${name}, total: ${price * 1.18}`
```

## String Methods
```js
str.includes("x")  str.indexOf("x")  str.startsWith("x")  str.endsWith("x")
str.slice(a, b)    str.split(" ")     str.trim()
str.toUpperCase()  str.toLowerCase()
str.replace(a, b)  str.replaceAll(a, b)
str.padStart(n, "0")  str.padEnd(n, "0")  str.repeat(n)
```
Strings are immutable — every method returns a new string.

## Number / Math
```js
Number("42")        parseInt("42px")     parseFloat("42.5px")
Number.isInteger(x)  Number.isNaN(x)      // prefer over global isNaN()
num.toFixed(2)        num.toLocaleString()

Math.round(x)  Math.floor(x)  Math.ceil(x)  Math.abs(x)
Math.max(...)  Math.min(...)  Math.pow(a,b)  Math.sqrt(x)
Math.random()  // 0 up to (not including) 1
```

## Date
```js
new Date()                    // now
new Date(2026, 8, 10)          // months are 0-indexed!
date.getFullYear() / getMonth() / getDate() / getDay() / getHours()
date.setDate(date.getDate() + 7) // MUTATES
Date.now()                      // ms since epoch
date.toISOString() / toDateString() / toLocaleDateString()
```
`Temporal` — immutable ES2026 replacement for `Date`, e.g. `Temporal.PlainDate.from("2026-09-10")`.

## Arrays — Mutating vs Non-Mutating
```js
// Mutating
arr.push(x)  arr.pop()  arr.shift()  arr.unshift(x)  arr.splice(i, n)
arr.sort()  arr.sort((a,b) => a-b)  arr.reverse()

// Non-mutating
arr.slice(a, b)  arr.concat(other)
```

## Core Array Methods
```js
arr.forEach(item => ...)
arr.map(item => ...)              // transform → new array
arr.filter(item => ...)           // keep matching → new array
arr.reduce((acc, item) => ..., start) // combine → single value
arr.find(item => ...)  arr.findIndex(item => ...)
arr.includes(x)  arr.join(", ")
```

## Destructuring
```js
const [a, , c] = arr;
const { name, age = 0 } = obj;
const { name: fullName } = obj;
function fn({ name, age }) { }
```

## Spread / Rest
```js
[...arr]                 // copy
[...arr, 4, 5]             // combine
{ ...obj, key: "new" }     // copy + override
fn(...arr)                  // spread into call

function sum(...nums) { }   // rest — gather args
const [first, ...rest] = arr;
const { a, ...others } = obj;
```

## Set
```js
const s = new Set([1,2,2,3]);   // Set(3) {1,2,3}
s.add(x)  s.has(x)  s.delete(x)  s.size
[...new Set(arr)]                // dedupe an array
```

## Map
```js
const m = new Map();
m.set(key, value)  m.get(key)  m.has(key)  m.delete(key)  m.size
for (const [k, v] of m) { }
```

## Iterators / Generators
```js
for (const item of iterable) { }   // works on arrays, strings, Set, Map

function* gen() {
  yield 1;
  yield 2;
}

const obj = {
  [Symbol.iterator]: function* () { yield 1; yield 2; }
};
```
