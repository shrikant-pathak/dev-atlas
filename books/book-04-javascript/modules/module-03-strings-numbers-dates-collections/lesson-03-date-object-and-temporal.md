# Lesson 03: The Date Object and Temporal

## Learning Objectives
By the end of this lesson, you will be able to:
- Create and read values from a `Date` object
- Perform basic date arithmetic and formatting with `Date`
- Explain the well-known limitations of `Date`
- Explain what the new `Temporal` API is and how it addresses those limitations

## Introduction

Working with dates is one of the oldest sources of pain in JavaScript. This lesson covers the traditional `Date` object — which you'll still encounter constantly in existing code — and then introduces `Temporal`, the modern replacement that has now reached full standardization.

## Creating a Date

```js
const now = new Date();               // the current date and time
const specific = new Date(2026, 8, 10); // September 10, 2026 — note: months are 0-indexed!
const fromString = new Date("2026-09-10"); // parsed from an ISO-format string
```

**Months are zero-indexed** (`0` = January, `8` = September) — one of `Date`'s most notorious footguns, and a common source of off-by-one bugs.

## Reading Values From a Date

```js
const date = new Date(2026, 8, 10, 14, 30);

date.getFullYear();  // 2026
date.getMonth();      // 8 (September — remember, zero-indexed)
date.getDate();       // 10 (day of the month)
date.getDay();        // 4 (day of the week, 0 = Sunday)
date.getHours();      // 14
date.getMinutes();    // 30
```

## Date Arithmetic

`Date` objects are **mutable** — methods like `setDate()` change the object in place, which is unusual compared to the immutable strings (Lesson 01) and, as you'll see below, is one of the exact problems `Temporal` was built to fix.

```js
const date = new Date(2026, 8, 10);

date.setDate(date.getDate() + 7); // mutates `date` to be 7 days later
console.log(date.getDate()); // 17
```

## Getting the Current Timestamp

```js
Date.now(); // e.g. 1799731200000 — milliseconds since Jan 1, 1970 (the "Unix epoch")
```

This raw millisecond count is useful for measuring elapsed time or comparing two dates.

## Formatting Dates

```js
const date = new Date(2026, 8, 10);

date.toDateString();               // "Thu Sep 10 2026"
date.toISOString();                 // "2026-09-10T00:00:00.000Z"
date.toLocaleDateString("en-IN");   // "10/9/2026"
```

## The Well-Known Problems With `Date`

- **Mutability** — as shown above, methods like `setDate()` change the original object, unlike almost every other built-in you've used so far.
- **No built-in time zone support** — `Date` only understands the local system time zone and UTC; anything else requires manual offset math or a third-party library.
- **Confusing parsing** — `new Date("some string")` can behave inconsistently across environments depending on the exact string format.
- **Awkward duration math** — there's no built-in concept of "add 3 months and 2 days"; you have to do it manually with `getMonth()`/`setMonth()` and handle edge cases like month-end rollovers yourself.

## Temporal: The Modern Replacement

**`Temporal`** is a new, built-in JavaScript API designed specifically to fix these problems. As of this writing (September 2026), it has reached **Stage 4** in the TC39 standardization process — meaning it is now officially part of the ECMAScript 2026 specification — and ships natively in current versions of Chrome, Firefox, Edge, and Node.js. Safari support is still catching up, so a polyfill may still be needed for full cross-browser compatibility.

Unlike `Date`, every `Temporal` object is **immutable** — exactly like the strings from Lesson 01 — and it splits "date and time" into distinct, purpose-built types instead of one do-everything object:

```js
// Note: requires an environment with Temporal support, or a polyfill.

const plainDate = Temporal.PlainDate.from("2026-09-10");
console.log(plainDate.toString()); // "2026-09-10"

const later = plainDate.add({ days: 7 }); // returns a NEW object — plainDate itself is unchanged
console.log(later.toString());              // "2026-09-17"
console.log(plainDate.toString());          // "2026-09-10" — original untouched
```

`Temporal.PlainDate` handles a calendar date with no time or time zone attached; other types like `Temporal.ZonedDateTime` handle a full timestamp with an explicit time zone. Because `Temporal` is very new, this book will continue to teach `Date` as the primary tool for now (since it's what you'll encounter in the vast majority of existing code and libraries), while flagging `Temporal` as the direction the language — and this book's later modules — will increasingly move toward.

## Practical Example

```js
// membership-expiry.js

function getExpiryDate(signupDate, membershipDays) {
  const expiry = new Date(signupDate); // copy, to avoid mutating the original
  expiry.setDate(expiry.getDate() + membershipDays);
  return expiry;
}

const signup = new Date(2026, 8, 10);
const expiry = getExpiryDate(signup, 30);

console.log(signup.toDateString());  // "Thu Sep 10 2026" — unaffected
console.log(expiry.toDateString());  // "Sat Oct 10 2026"
```

Notice the deliberate `new Date(signupDate)` copy — a common defensive pattern precisely because `Date` is mutable, unlike the `Temporal` example above where an explicit copy would never be needed.

## Revision Questions

<details>
<summary>1. Why is `new Date(2026, 8, 10)` September 10, 2026, and not August 10?</summary>

`Date`'s month parameter is zero-indexed — `0` represents January, so `8` represents September. This is one of `Date`'s most common sources of off-by-one bugs.
</details>

<details>
<summary>2. Is the `Date` object mutable or immutable?</summary>

Mutable — methods like `setDate()` change the original object directly, unlike the immutable strings covered in Lesson 01.
</details>

<details>
<summary>3. What does `Date.now()` return?</summary>

The current number of milliseconds elapsed since January 1, 1970 (the Unix epoch) — useful for timestamps and measuring elapsed time.
</details>

<details>
<summary>4. Name two well-known limitations of the `Date` object.</summary>

Any two of: it's mutable (methods change the object in place rather than returning a new one), it has no built-in time zone support, its string parsing can behave inconsistently, and it has no built-in way to perform duration arithmetic cleanly.
</details>

<details>
<summary>5. What is `Temporal`, and what is its current standardization status?</summary>

`Temporal` is a new, immutable, built-in JavaScript API for working with dates, times, and time zones, designed to replace `Date`'s long-standing problems. As of September 2026 it has reached Stage 4 in the TC39 process, making it officially part of the ECMAScript 2026 specification, and it ships natively in current Chrome, Firefox, Edge, and Node.js — though Safari support is still catching up.
</details>
