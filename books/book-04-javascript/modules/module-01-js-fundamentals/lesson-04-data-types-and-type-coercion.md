# Lesson 04: Data Types and Type Coercion

## Learning Objectives
By the end of this lesson, you will be able to:
- Identify JavaScript's primitive data types
- Use the `typeof` operator to inspect a value's type
- Explain the difference between `null` and `undefined`
- Explain implicit vs. explicit type coercion, and predict common coercion results
- List JavaScript's falsy values and explain truthy/falsy evaluation

## Introduction

In Lesson 03 you declared variables without focusing much on *what kind* of value they held. This lesson covers JavaScript's data types in full, plus one of the language's most famous — and most misunderstood — behaviors: **type coercion**, which explains why some comparisons and operations produce surprising results.

## JavaScript's Primitive Data Types

JavaScript values fall into two categories: **primitives** and **objects**. This lesson covers primitives; objects arrive in Module 02.

| Type | Example | Description |
|---|---|---|
| `string` | `"hello"` | Text, in single, double, or backtick quotes |
| `number` | `42`, `3.14` | All numbers — JavaScript has no separate integer type |
| `boolean` | `true`, `false` | Logical true/false |
| `undefined` | `undefined` | A variable that has been declared but not assigned a value |
| `null` | `null` | An intentional "no value," set explicitly by the programmer |
| `symbol` | `Symbol("id")` | A unique, immutable identifier (rarely used until advanced code) |
| `bigint` | `123n` | Integers larger than `Number` can safely represent (rare in day-to-day code) |

```js
const city = "Pune";          // string
const age = 29;               // number
const isLoggedIn = true;      // boolean
let nextStep;                 // undefined (declared, not assigned)
const middleName = null;      // null (explicitly "nothing")
```

### `undefined` vs `null`
- `undefined` means "this hasn't been given a value yet" — JavaScript sets this automatically.
- `null` means "this value is intentionally empty" — you set this deliberately.

## The `typeof` Operator

```js
typeof "hello";     // "string"
typeof 42;           // "number"
typeof true;         // "boolean"
typeof undefined;    // "undefined"
typeof null;         // "object"  ← a famous, long-standing JavaScript bug, kept for backward compatibility
typeof Symbol();      // "symbol"
typeof 10n;          // "bigint"
```

`typeof null === "object"` is a bug from JavaScript's very first version, kept forever for backward compatibility — worth remembering because it shows up in interviews and real bugs alike.

## Implicit Coercion

JavaScript tries to be "helpful" by converting types automatically in certain operations — this is often the source of confusing bugs.

```js
"5" + 3;      // "53" — number 3 is converted to a string, then concatenated
"5" - 3;      // 2   — string "5" is converted to a number, then subtracted
"5" * "2";    // 10  — both strings converted to numbers
true + 1;     // 2   — true becomes 1
false + 1;    // 1   — false becomes 0
```

`+` behaves differently depending on the other operand: with a string present, it concatenates; with numbers, it adds. `-`, `*`, and `/` always try to convert to numbers, since there's no such thing as string subtraction. You'll see all of these operators formally in Lesson 05.

## Explicit Coercion

Deliberately converting a value using built-in functions — always preferred over relying on implicit coercion, because it makes your intent clear.

```js
String(42);        // "42"
Number("42");       // 42
Number("hello");    // NaN (Not a Number)
Boolean(0);          // false
Boolean("hello");    // true
```

## Equality and Coercion (`==` vs `===`)

JavaScript has two equality operators, and coercion is exactly what separates them:

```js
0 == "0";         // true  — "0" is coerced to 0 before comparing
0 == "";          // true  — "" is coerced to 0
0 == false;       // true  — false is coerced to 0

0 === "0";        // false — different types, no coercion
0 === false;      // false — different types, no coercion
```

`==` (loose equality) coerces operands to the same type before comparing. `===` (strict equality) never coerces — it compares both value and type directly. Those `==` results are technically consistent with JavaScript's rules, but they rarely match what a programmer intends, which is why **`===` and `!==` are the standard in professional code**, including everything in this book from here on.

## Truthy and Falsy Values

Every JavaScript value is either "truthy" or "falsy" when evaluated in a boolean context (like an `if` condition, which you'll formally cover in Lesson 06), even if it isn't a literal `true`/`false`.

**The complete list of falsy values in JavaScript:**

```js
false
0
-0
""          // empty string
null
undefined
NaN
```

**Everything else is truthy** — including, surprisingly:

```js
"0"          // truthy! (it's a non-empty string)
"false"      // truthy! (it's a non-empty string)
[]           // truthy! (an empty array is still an object)
{}           // truthy! (an empty object is still an object)
```

## Practical Example

```js
// input-check.js

function describeValue(value) {
  console.log(value, "→ type:", typeof value, "| truthy:", Boolean(value));
}

describeValue("");
describeValue("0");
describeValue(0);
describeValue(null);
describeValue(undefined);
describeValue([]);

// "" → type: string | truthy: false
// "0" → type: string | truthy: true
// 0 → type: number | truthy: false
// null → type: object | truthy: false
// undefined → type: undefined | truthy: false
// [] → type: object | truthy: true
```

(You'll formally cover writing functions like `describeValue` in Module 02 — for now, focus on the type and truthy/falsy results being logged.)

## Revision Questions

<details>
<summary>1. What's the difference between `undefined` and `null`?</summary>

`undefined` is the automatic value of a variable that has been declared but not yet assigned. `null` is an intentional value a programmer assigns to represent "no value."
</details>

<details>
<summary>2. What does `typeof null` return, and why is this notable?</summary>

It returns `"object"`, which is a long-standing bug in JavaScript dating back to its first version, kept for backward compatibility.
</details>

<details>
<summary>3. What is type coercion, and what's the difference between implicit and explicit coercion?</summary>

Type coercion is JavaScript converting a value from one type to another. Implicit coercion happens automatically as a side effect of an operation (like `"5" + 3`); explicit coercion is done deliberately using functions like `Number()` or `String()`.
</details>

<details>
<summary>4. Why is `===` preferred over `==`?</summary>

`==` coerces operands to the same type before comparing, which can produce results that don't match programmer intent (e.g. `0 == false` is `true`). `===` compares both value and type without coercion, making comparisons predictable.
</details>

<details>
<summary>5. Is `[]` (an empty array) truthy or falsy? Is `"0"` (a string) truthy or falsy?</summary>

Both are truthy. `[]` is an object, and all objects are truthy regardless of contents. `"0"` is a non-empty string, and only the empty string `""` is falsy — the specific string `"0"` is not on the falsy list.
</details>
