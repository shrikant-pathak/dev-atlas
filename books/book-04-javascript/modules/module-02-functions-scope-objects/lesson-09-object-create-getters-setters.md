# Lesson 09: Object.create, Getters and Setters

## Learning Objectives
By the end of this lesson, you will be able to:
- Create objects with `Object.create()` and explain how it relates to prototypes
- Define getters and setters on an object
- Explain why getters/setters are useful for computed or validated properties
- Recognize when to reach for `Object.create()` versus a plain object literal

## Introduction

Lesson 08 introduced prototypes and used `Object.create()` briefly to link one prototype to another. This lesson gives `Object.create()` its own proper treatment, and introduces **getters and setters** — a way to make a property behave like it's computed or validated on access, while still being used exactly like a normal property.

## `Object.create()`

`Object.create(proto)` creates a brand-new, empty object whose prototype is set directly to `proto` — a more explicit alternative to the constructor-function-plus-`new` approach from Lesson 08.

```js
const animalPrototype = {
  eat() {
    return `${this.name} is eating.`;
  }
};

const dog = Object.create(animalPrototype);
dog.name = "Rex";

console.log(dog.eat()); // "Rex is eating." — found via the prototype chain
console.log(Object.getPrototypeOf(dog) === animalPrototype); // true
```

This is a common pattern for **prototypal inheritance without constructor functions** — you build one plain "template" object holding shared behavior, then create individual objects linked to it.

### `Object.create(null)`

Passing `null` creates an object with **no prototype at all** — not even the default `Object.prototype`. This means it has none of the automatically inherited methods you saw in Lesson 08 (like `toString()`), which is occasionally useful for a "pure data" object with zero surprises from inherited behavior.

```js
const pureData = Object.create(null);
pureData.key = "value";

console.log(pureData.toString); // undefined — no inherited methods at all
```

## Getters

A **getter** lets you define a property that runs a function when it's *read*, while still being accessed with plain property syntax (no parentheses).

```js
const circle = {
  radius: 5,
  get area() {
    return Math.PI * this.radius ** 2;
  }
};

console.log(circle.area); // 78.53981633974483 — read like a property, computed like a method
```

Notice: no `()` — `area` looks and behaves exactly like a regular property from the outside, even though it's actually computed fresh every time it's accessed.

## Setters

A **setter** lets you run custom logic when a property is *assigned*, again using plain assignment syntax.

```js
const user = {
  firstName: "Ada",
  lastName: "Lovelace",
  get fullName() {
    return `${this.firstName} ${this.lastName}`;
  },
  set fullName(value) {
    const parts = value.split(" ");
    this.firstName = parts[0];
    this.lastName = parts[1];
  }
};

console.log(user.fullName); // "Ada Lovelace" — getter

user.fullName = "Grace Hopper"; // setter runs here
console.log(user.firstName);     // "Grace"
console.log(user.lastName);      // "Hopper"
```

(`.split()` is a string method covered fully in Module 03 — for now, just notice it turns `"Grace Hopper"` into `["Grace", "Hopper"]`.)

## Why Use Getters/Setters Instead of Plain Properties?

- **Computed values** — `area` doesn't need to be manually recalculated and kept in sync every time `radius` changes; it's always correct because it's computed on read.
- **Validation** — a setter can reject or adjust invalid values before they're stored:

```js
const account = {
  _balance: 0, // the leading underscore is just a convention signaling "internal use"
  get balance() {
    return this._balance;
  },
  set balance(value) {
    if (value < 0) {
      console.log("Balance cannot be negative.");
      return;
    }
    this._balance = value;
  }
};

account.balance = 500;
console.log(account.balance); // 500

account.balance = -100;
console.log(account.balance); // still 500 — the setter rejected the invalid value
```

## Practical Example

```js
// temperature.js

const weatherStation = {
  _celsius: 20,
  get celsius() {
    return this._celsius;
  },
  set celsius(value) {
    this._celsius = value;
  },
  get fahrenheit() {
    return this._celsius * 9 / 5 + 32;
  },
  set fahrenheit(value) {
    this._celsius = (value - 32) * 5 / 9;
  }
};

console.log(weatherStation.fahrenheit); // 68

weatherStation.fahrenheit = 100;
console.log(weatherStation.celsius.toFixed(1)); // "37.8"
```

## Revision Questions

<details>
<summary>1. What does `Object.create(proto)` do?</summary>

It creates a brand-new object whose prototype is directly set to `proto`, giving it access to `proto`'s properties and methods via the prototype chain.
</details>

<details>
<summary>2. What's different about an object created with `Object.create(null)`?</summary>

It has no prototype at all — not even the default `Object.prototype` — so it lacks any automatically inherited methods like `toString()`.
</details>

<details>
<summary>3. How is a getter accessed — with or without parentheses?</summary>

Without parentheses — a getter is accessed exactly like a plain property (e.g. `circle.area`, not `circle.area()`), even though it runs a function behind the scenes.
</details>

<details>
<summary>4. What's one practical reason to use a setter instead of allowing direct property assignment?</summary>

To validate or transform a value before it's stored — for example, rejecting a negative value assigned to a `balance` property instead of silently accepting it.
</details>

<details>
<summary>5. In the `fullName` example, what happens internally when you run `user.fullName = "Grace Hopper";`?</summary>

The setter for `fullName` runs, splitting `"Grace Hopper"` into parts and assigning `"Grace"` to `firstName` and `"Hopper"` to `lastName` — even though the syntax looks like a normal property assignment.
</details>
