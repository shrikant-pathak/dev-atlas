# Lesson 06: Control Flow — Conditionals

## Learning Objectives
By the end of this lesson, you will be able to:
- Write `if`, `else if`, and `else` statements
- Use a `switch` statement as an alternative to long `if/else` chains
- Combine conditions using the logical operators from Lesson 05
- Choose between `if/else`, `switch`, and the ternary operator appropriately

## Introduction

Lesson 05 gave you expressions that evaluate to `true` or `false`. Conditionals let your program actually **branch** — run different code depending on those results. This is where JavaScript stops being a simple calculator and starts making decisions, which is the core of what "logic" means in programming.

## The `if` Statement

```js
const age = 20;

if (age >= 18) {
  console.log("You can vote.");
}
```

The code inside `{ }` only runs if the condition in `( )` evaluates to `true`.

## `if / else`

```js
const age = 15;

if (age >= 18) {
  console.log("You can vote.");
} else {
  console.log("You cannot vote yet.");
}
```

## `if / else if / else`

For more than two branches:

```js
const score = 72;

if (score >= 90) {
  console.log("Grade: A");
} else if (score >= 75) {
  console.log("Grade: B");
} else if (score >= 60) {
  console.log("Grade: C");
} else {
  console.log("Grade: F");
}
```

JavaScript checks each condition top to bottom and runs the first one that's `true`, then skips the rest — order matters.

## Combining Conditions

Using the logical operators from Lesson 05:

```js
const hasTicket = true;
const isVIP = false;
const age = 17;

if (hasTicket && age >= 18) {
  console.log("Entry allowed.");
} else if (isVIP) {
  console.log("VIP entry allowed regardless of age.");
} else {
  console.log("Entry denied.");
}
```

## The `switch` Statement

When you're checking one value against many possible exact matches, `switch` can be more readable than a long `if/else if` chain.

```js
const day = "Tuesday";

switch (day) {
  case "Monday":
    console.log("Start of the work week.");
    break;
  case "Tuesday":
  case "Wednesday":
  case "Thursday":
    console.log("Midweek.");
    break;
  case "Friday":
    console.log("Almost the weekend!");
    break;
  default:
    console.log("It's the weekend.");
}
```

Notes:
- `break` stops execution from "falling through" into the next case. Forgetting it is one of the most common `switch` bugs.
- Multiple `case` labels can share one block (see `"Tuesday"`/`"Wednesday"`/`"Thursday"` above) by stacking cases with no code between them.
- `default` runs when nothing else matches — equivalent to a final `else`.

## Choosing the Right Tool

| Situation | Best choice |
|---|---|
| One simple true/false branch, producing a value | Ternary (Lesson 05) |
| A few conditions, possibly with ranges (`>=`, `&&`, etc.) | `if / else if / else` |
| One value checked against many exact, known options | `switch` |

## Practical Example

```js
// shipping-cost.js

const country = "IN";
const orderTotal = 1200;

let shippingCost;

switch (country) {
  case "IN":
    shippingCost = orderTotal >= 999 ? 0 : 49;
    break;
  case "US":
  case "CA":
    shippingCost = orderTotal >= 2000 ? 0 : 199;
    break;
  default:
    shippingCost = 299;
}

if (shippingCost === 0) {
  console.log("You qualify for free shipping!");
} else {
  console.log(`Shipping cost: ₹${shippingCost}`);
}
```

## Revision Questions

<details>
<summary>1. What happens if you forget `break` in a `switch` case?</summary>

Execution "falls through" into the next case block regardless of whether its condition matches, running code that wasn't intended to run — a common source of bugs.
</details>

<details>
<summary>2. In an `if / else if / else` chain, does JavaScript check every condition?</summary>

No — it checks conditions top to bottom and runs the first one that's `true`, skipping the rest. If none match, the `else` block (if present) runs.
</details>

<details>
<summary>3. When is `switch` a better choice than `if/else if`?</summary>

When checking a single value against several exact, known options — it tends to be more readable than a long chain of `else if` comparisons.
</details>

<details>
<summary>4. When is a ternary operator preferable to a full `if/else`?</summary>

When the branch is simple and just needs to produce a value (e.g. assigning one of two values to a variable) rather than running multiple statements.
</details>

<details>
<summary>5. What does the `default` case in a `switch` statement do?</summary>

It runs when none of the other `case` values match — functionally equivalent to a final `else` in an if/else chain.
</details>
