# Lesson 4: RegExp Basics

## Learning Objectives
- Create regular expressions using literal and constructor syntax
- Understand common flags (`g`, `i`, `m`, `s`)
- Use core methods: `test()`, `exec()`, and the string methods that accept regex
- Understand character classes, quantifiers, and anchors
- Use capture groups and named capture groups
- Apply regex to real validation and parsing tasks

## Introduction

You've already used string methods like `.includes()`, `.split()`, and `.replace()` in Module 03. Those work great for exact substrings, but real-world text processing — validating an email format, extracting a hashtag, splitting on any amount of whitespace — needs pattern matching. Regular expressions (regex) are a mini pattern-matching language built into JavaScript for exactly this.

Regex has a reputation for being intimidating, but you only need a working subset of it for everyday tasks — form validation, search-and-replace, and parsing simple structured text.

## 1. Creating a regex

Two ways to create one:

```javascript
// Literal syntax — preferred when the pattern is known ahead of time
const pattern1 = /hello/;

// Constructor syntax — needed when building a pattern dynamically from a variable
const search = 'hello';
const pattern2 = new RegExp(search);
```

## 2. Flags

Flags change how the pattern matches, written after the closing slash:

```javascript
/hello/i   // case-insensitive
/hello/g   // global — find ALL matches, not just the first
/^hi/m     // multiline — ^ and $ match start/end of each line, not just the whole string
/a.b/s     // dotAll — `.` also matches newlines
```

```javascript
const text = 'Hello world, hello universe';
console.log(/hello/.test(text));   // true (matches "hello" in "hello universe")
console.log(/HELLO/i.test(text));  // true — case-insensitive
console.log(text.match(/hello/gi)); // ['Hello', 'hello'] — all matches, case-insensitive
```

## 3. Testing and matching

```javascript
const regex = /\d+/; // one or more digits

regex.test('Order #4521');      // true
regex.exec('Order #4521');      // ['4521', index: 7, ...] — details of the first match

'Order #4521'.match(regex);     // ['4521', index: 7, ...] — string method, same idea
'a1 b2 c3'.match(/\d/g);        // ['1', '2', '3'] — with the g flag, all matches as a plain array
```

`.match()` behaves differently with and without the `g` flag: without `g` it returns rich match details (like `.exec()`); with `g` it returns a simple array of all matched substrings.

## 4. Character classes

```javascript
/\d/   // any digit — same as [0-9]
/\D/   // any non-digit
/\w/   // any "word" character — letters, digits, underscore — same as [A-Za-z0-9_]
/\W/   // any non-word character
/\s/   // any whitespace (space, tab, newline)
/\S/   // any non-whitespace
/./    // any character except a newline
```

Custom character sets with `[...]`:

```javascript
/[aeiou]/     // any single vowel
/[^aeiou]/    // any character that is NOT a vowel (^ inside [] negates)
/[a-z]/       // any lowercase letter (range)
/[A-Za-z0-9]/ // any letter or digit
```

## 5. Quantifiers

Control how many times something can repeat:

```javascript
/a*/    // zero or more 'a'
/a+/    // one or more 'a'
/a?/    // zero or one 'a' (optional)
/a{3}/  // exactly 3 'a's
/a{2,}/ // 2 or more 'a's
/a{2,4}/// between 2 and 4 'a's
```

```javascript
console.log(/\d{3}-\d{4}/.test('555-1234')); // true — matches a phone-number-like pattern
console.log(/colou?r/.test('color'));        // true — the 'u' is optional
console.log(/colou?r/.test('colour'));       // true
```

## 6. Anchors

```javascript
/^hello/  // string must START with "hello"
/world$/  // string must END with "world"
/^hello$/ // string must be EXACTLY "hello", nothing else
```

```javascript
console.log(/^\d+$/.test('12345')); // true — entire string is digits
console.log(/^\d+$/.test('123a5')); // false — contains a non-digit
```

## 7. Groups and capturing

Parentheses create a **capture group** — a portion of the match you can extract separately:

```javascript
const dateStr = '2026-09-11';
const match = dateStr.match(/(\d{4})-(\d{2})-(\d{2})/);

console.log(match[0]); // '2026-09-11' — full match
console.log(match[1]); // '2026' — first group (year)
console.log(match[2]); // '09'   — second group (month)
console.log(match[3]); // '11'   — third group (day)
```

**Named capture groups** (ES2018) make this far more readable — instead of remembering `match[1]`, `match[2]`, you get named properties:

```javascript
const match = dateStr.match(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/);
console.log(match.groups.year);  // '2026'
console.log(match.groups.month); // '09'
```

## 8. Regex with `.replace()` and `.split()`

Recall `.replace()` from Module 03 — it accepts a regex as its first argument, which unlocks pattern-based replacement:

```javascript
const messy = 'one,two;three  four';
console.log(messy.split(/[,;\s]+/)); // ['one', 'two', 'three', 'four'] — split on any of these separators

const sentence = 'The cat sat on the mat';
console.log(sentence.replace(/at/g, 'og')); // 'The cog sog on the mog'

// Using a captured group in the replacement with $1
const name = 'Doe, John';
console.log(name.replace(/(\w+), (\w+)/, '$2 $1')); // 'John Doe'
```

## Practical Example

A small form-validation helper using several regex techniques together:

```javascript
function validateForm({ email, phone, username }) {
  const errors = [];

  // Simple (not exhaustive) email shape check
  if (!/^[\w.-]+@[\w-]+\.[a-z]{2,}$/i.test(email)) {
    errors.push('Invalid email format');
  }

  // US-style phone: 555-123-4567
  if (!/^\d{3}-\d{3}-\d{4}$/.test(phone)) {
    errors.push('Phone must be in the format 555-123-4567');
  }

  // Username: 3-16 chars, letters/digits/underscore only
  if (!/^\w{3,16}$/.test(username)) {
    errors.push('Username must be 3-16 letters, digits, or underscores');
  }

  return errors;
}

console.log(validateForm({
  email: 'sam@example.com',
  phone: '555-123-4567',
  username: 'sam_dev',
})); // []

console.log(validateForm({
  email: 'not-an-email',
  phone: '5551234567',
  username: 'a',
}));
// ['Invalid email format', 'Phone must be in the format 555-123-4567', 'Username must be 3-16 letters, digits, or underscores']

// Extracting hashtags from a social post using a global regex + named groups
function extractHashtags(text) {
  const matches = [...text.matchAll(/#(?<tag>\w+)/g)];
  return matches.map(m => m.groups.tag);
}

console.log(extractHashtags('Loving the #sunset and #ocean views today!'));
// ['sunset', 'ocean']
```

## Revision Questions

<details>
<summary>1. What's the difference between `/hello/` and `/hello/g`?</summary>

Without the `g` flag, methods like `.match()` stop after the first match. With `g`, they find every match in the string. `.test()` and `.exec()` also behave differently with `g` — `.exec()` remembers its position between calls when `g` is set.
</details>

<details>
<summary>2. What does `\d{2,4}` match?</summary>

Between 2 and 4 consecutive digits (inclusive).
</details>

<details>
<summary>3. What's the difference between `/^hello/` and `/^hello$/`?</summary>

`/^hello/` matches any string that starts with "hello", regardless of what follows. `/^hello$/` requires the entire string to be exactly "hello" and nothing else.
</details>

<details>
<summary>4. What do parentheses do in a regex pattern?</summary>

They create a capture group — a sub-match you can retrieve individually (e.g., `match[1]`) or reference in a replacement string (`$1`). Named groups (`(?<name>...)`) let you access them by name via `match.groups`.
</details>

<details>
<summary>5. How would you split a string on any combination of commas, semicolons, or whitespace?</summary>

`str.split(/[,;\s]+/)` — a character class containing all three separator types, with `+` so consecutive separators are treated as one split point.
</details>
