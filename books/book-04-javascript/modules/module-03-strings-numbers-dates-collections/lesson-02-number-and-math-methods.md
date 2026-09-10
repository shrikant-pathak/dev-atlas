# Lesson 02: Number and Math Methods

## Learning Objectives
By the end of this lesson, you will be able to:
- Convert strings to numbers using `parseInt`, `parseFloat`, and `Number()`
- Format numbers for display using `toFixed()` and `toLocaleString()`
- Check for valid numbers using `Number.isInteger()` and `Number.isNaN()`
- Use common `Math` object methods for rounding, extremes, and randomness

## Introduction

Module 01, Lesson 04 introduced `number` as a primitive type and briefly touched `Number()` for explicit coercion. This lesson covers the full toolkit for working with numbers in real programs — converting user input, formatting output, and performing calculations via the built-in `Math` object.

## Converting Strings to Numbers

```js
Number("42");        // 42
Number("42.5");      // 42.5
Number("42px");      // NaN — Number() requires the ENTIRE string to be numeric

parseInt("42px");     // 42 — parseInt reads digits until it hits something non-numeric
parseFloat("42.5px"); // 42.5 — same idea, but keeps decimal points

parseInt("42.9");     // 42 — parseInt always truncates to a whole number
```

`parseInt` and `parseFloat` are more forgiving than `Number()` — useful when reading values from something like form input (covered in Module 04) that might include extra text.

**Always specify a radix (base) with `parseInt`** to avoid ambiguity with older JavaScript engines interpreting leading zeros as octal:

```js
parseInt("08", 10); // 8 — the "10" means "parse as base 10"
```

## Checking for Valid Numbers

```js
Number.isInteger(42);     // true
Number.isInteger(42.5);   // false
Number.isInteger("42");   // false — not even a number type, so automatically false

Number.isNaN(NaN);         // true
Number.isNaN("hello");     // false — "hello" is a string, not NaN itself

isNaN("hello");             // true — the global isNaN() coerces its argument first, which "hello" fails, becoming NaN
```

**Prefer `Number.isNaN()` over the global `isNaN()`** — the global version coerces its argument before checking, which produces confusing results like `isNaN("hello")` being `true` even though `"hello"` was never a number to begin with.

## Formatting Numbers for Display

```js
const price = 1234.5678;

price.toFixed(2);            // "1234.57" — rounds to 2 decimal places, returns a STRING
price.toLocaleString();       // "1,234.568" — locale-aware formatting with grouping separators
price.toLocaleString("en-IN"); // "1,234.568" — formatted per Indian numbering conventions
```

`.toFixed()` is the standard choice for currency and fixed-precision display; it always returns a string, so remember to convert back with `Number()` if you need to do more math with the result.

## The `Math` Object

Unlike `String` and `Number`, `Math` isn't a constructor — you never create a `Math` instance. It's simply a built-in object holding mathematical constants and functions.

```js
Math.round(4.5);   // 5  — rounds to nearest integer
Math.floor(4.9);    // 4  — always rounds down
Math.ceil(4.1);     // 5  — always rounds up
Math.abs(-7);        // 7  — absolute value
Math.max(3, 7, 2);   // 7
Math.min(3, 7, 2);   // 2
Math.pow(2, 5);       // 32 — 2 to the power of 5 (same as 2 ** 5 from Module 01, Lesson 05)
Math.sqrt(64);        // 8
```

### Random Numbers

`Math.random()` returns a decimal between `0` (inclusive) and `1` (exclusive). Combine it with `Math.floor()` to get a random whole number in a range:

```js
Math.random(); // e.g. 0.7328492...

function randomBetween(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

randomBetween(1, 6); // simulates a dice roll: 1 through 6
```

## Practical Example

```js
// price-formatter.js

function formatPrice(rawInput) {
  const value = parseFloat(rawInput);

  if (Number.isNaN(value)) {
    return "Invalid price";
  }

  return `₹${value.toFixed(2)}`;
}

console.log(formatPrice("499.999"));  // "₹500.00"
console.log(formatPrice("abc"));       // "Invalid price"
console.log(formatPrice("199px"));     // "₹199.00" — parseFloat reads the leading number
```

## Revision Questions

<details>
<summary>1. What's the difference between `Number("42px")` and `parseInt("42px")`?</summary>

`Number()` requires the entire string to be numeric, so `Number("42px")` returns `NaN`. `parseInt()` reads digits until it hits a non-numeric character, so `parseInt("42px")` returns `42`.
</details>

<details>
<summary>2. Why is `Number.isNaN()` preferred over the global `isNaN()`?</summary>

The global `isNaN()` coerces its argument to a number before checking, which can produce misleading results (e.g. `isNaN("hello")` is `true` because `"hello"` coerces to `NaN`). `Number.isNaN()` only returns `true` if the value is already, actually `NaN` — no coercion involved.
</details>

<details>
<summary>3. What type of value does `.toFixed()` return?</summary>

A string — even though it's formatting a number, the result is a string, so further math on it requires converting back with `Number()`.
</details>

<details>
<summary>4. What does `Math.floor(Math.random() * 10)` produce?</summary>

A random whole number from 0 to 9 — `Math.random()` gives a decimal from 0 (inclusive) up to but not including 1, multiplying by 10 scales that to 0–9.999..., and `Math.floor()` truncates it down to a whole number.
</details>

<details>
<summary>5. Is `Math` a constructor you create instances of, like `new Math()`?</summary>

No — `Math` is a built-in object with properties and methods available directly (e.g. `Math.round()`); it is never instantiated with `new`.
</details>
