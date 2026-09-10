# Lesson 01: String Methods and Templates

## Learning Objectives
By the end of this lesson, you will be able to:
- Use template literals for string interpolation and multi-line strings
- Use common string methods to search, extract, and transform text
- Explain why strings are immutable in JavaScript
- Chain multiple string methods together

## Introduction

You've been using strings since Module 01, but only with basic concatenation (`+`). Real programs constantly need to search within text, pull pieces out of it, and reshape it — this lesson covers the toolkit JavaScript provides for exactly that, plus the modern, cleaner way to build strings: **template literals**.

## Template Literals

Written with backticks (`` ` ``) instead of quotes, template literals let you embed expressions directly inside a string using `${}` — you've actually already seen this a few times in earlier modules without a full explanation.

```js
const name = "Ada";
const age = 30;

// Old way (Module 01 style):
const message1 = "Hi, I'm " + name + " and I'm " + age + " years old.";

// Template literal:
const message2 = `Hi, I'm ${name} and I'm ${age} years old.`;
```

Anything inside `${}` is a full JavaScript expression — not just a variable:

```js
const price = 500;
console.log(`Total with tax: ₹${price * 1.18}`);
```

### Multi-line Strings

Template literals also preserve line breaks directly, without needing a special character:

```js
const note = `Dear user,
Thank you for signing up.
— The Team`;
```

## String Immutability

Strings in JavaScript are **immutable** — no method ever changes the original string; every string method returns a **new** string.

```js
const greeting = "hello";
greeting.toUpperCase();
console.log(greeting); // still "hello" — the original was never changed

const shouted = greeting.toUpperCase(); // must capture the new string
console.log(shouted); // "HELLO"
```

## Searching Within Strings

```js
const sentence = "The quick brown fox";

sentence.includes("quick");   // true
sentence.indexOf("brown");    // 10 — the starting index, or -1 if not found
sentence.startsWith("The");   // true
sentence.endsWith("fox");     // true
```

## Extracting Pieces of a String

```js
const sentence = "The quick brown fox";

sentence.slice(4, 9);    // "quick" — from index 4, up to (not including) index 9
sentence.slice(-3);      // "fox" — negative index counts from the end
sentence.split(" ");     // ["The", "quick", "brown", "fox"]
```

`.split()` is especially useful for turning a string into an array (arrays get their full lesson next — Lesson 04) so you can loop over the pieces.

## Transforming Strings

```js
const messy = "  Hello World  ";

messy.trim();               // "Hello World" — removes leading/trailing whitespace
messy.toLowerCase();        // "  hello world  "
messy.toUpperCase();        // "  HELLO WORLD  "
messy.replace("World", "There"); // "  Hello There  " — replaces first match only
messy.replaceAll("l", "L");       // "  HeLLo WorLd  " — replaces every match
```

## Combining and Padding Strings

```js
"Hello".concat(" ", "World"); // "Hello World" — rarely used; template literals are preferred
"5".padStart(3, "0");          // "005" — pad to a minimum length
"5".padEnd(3, "0");            // "500"
"ha".repeat(3);                 // "hahaha"
```

## Chaining Methods

Because every string method returns a new string, you can chain multiple calls together:

```js
const raw = "   Hello, DEV ATLAS!   ";

const cleaned = raw.trim().toLowerCase().replace("dev atlas", "Dev Atlas");
console.log(cleaned); // "hello, Dev Atlas!"
```

## Practical Example

```js
// username-generator.js

function generateUsername(firstName, lastName) {
  const clean = value => value.trim().toLowerCase();
  return `${clean(firstName)}_${clean(lastName)}`.slice(0, 20);
}

console.log(generateUsername("  Ada ", "Lovelace")); // "ada_lovelace"
console.log(generateUsername("Grace", "Hopper"));     // "grace_hopper"
```

## Revision Questions

<details>
<summary>1. What are two advantages of template literals over string concatenation with `+`?</summary>

They allow expressions to be embedded directly with `${}` (avoiding repeated `+` operators), and they preserve line breaks for multi-line strings without needing special escape characters.
</details>

<details>
<summary>2. What does it mean that strings are immutable in JavaScript?</summary>

No string method modifies the original string — every method that transforms a string (like `.toUpperCase()`) returns a brand-new string, leaving the original unchanged.
</details>

<details>
<summary>3. What's the difference between `.replace()` and `.replaceAll()`?</summary>

`.replace()` replaces only the first match found; `.replaceAll()` replaces every match in the string.
</details>

<details>
<summary>4. What does `sentence.slice(-3)` do?</summary>

It extracts the last 3 characters of the string — a negative index in `.slice()` counts backward from the end of the string.
</details>

<details>
<summary>5. Why is it possible to chain multiple string methods together, like `raw.trim().toLowerCase()`?</summary>

Because every string method returns a new string, and that returned string can immediately have another method called on it — the chain works because each step's output is a valid input for the next step.
</details>
