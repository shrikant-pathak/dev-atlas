# Lesson 07: Object Literals and Methods

## Learning Objectives
By the end of this lesson, you will be able to:
- Create objects using object literal syntax
- Access and modify properties using dot notation and bracket notation
- Add methods to an object, including using shorthand syntax
- Use property shorthand when a variable name matches a desired property name

## Introduction

So far, every value you've stored in a variable has been a single primitive (Module 01, Lesson 04) or a function (this module). An **object** lets you group multiple related values together under one variable — the foundation for representing anything more complex than a single piece of data, and something you've actually already seen used in Lessons 03, 05, and 06 without a full explanation. This lesson gives objects their proper introduction.

## Creating an Object Literal

```js
const user = {
  name: "Ada",
  age: 30,
  isActive: true
};
```

Each `key: value` pair is called a **property**. Keys are usually strings (quotes are optional if the key is a valid identifier), and values can be anything — a string, number, boolean, another object, an array (Module 03), or a function.

## Accessing Properties

### Dot Notation
The most common way — used when you know the exact property name in advance.

```js
console.log(user.name); // "Ada"
console.log(user.age);  // 30
```

### Bracket Notation
Required when the property name is stored in a variable, contains special characters, or isn't a valid identifier.

```js
console.log(user["name"]); // "Ada"

const key = "age";
console.log(user[key]); // 30 — dot notation couldn't do this; user.key would look for a literal "key" property
```

## Modifying and Adding Properties

```js
user.age = 31;              // modify an existing property
user.email = "ada@dev.io";  // add a brand-new property

console.log(user);
// { name: "Ada", age: 31, isActive: true, email: "ada@dev.io" }
```

Recall from Module 01, Lesson 03: an object declared with `const` can still have its properties changed — `const` only prevents reassigning `user` to a completely different object.

## Deleting a Property

```js
delete user.isActive;
console.log(user.isActive); // undefined
```

## Methods

A **method** is simply a function stored as a property value.

```js
const user = {
  name: "Ada",
  greet: function () {
    return `Hi, I'm ${this.name}`;
  }
};

console.log(user.greet()); // "Hi, I'm Ada"
```

Recall from Lesson 05: because `greet` is called *as a method* (`user.greet()`), `this` correctly refers to `user`.

### Method Shorthand

ES6 (formally covered in Module 06) allows a shorter way to write methods, dropping `function` and the colon:

```js
const user = {
  name: "Ada",
  greet() {
    return `Hi, I'm ${this.name}`;
  }
};
```

This is the standard style used in modern codebases (you've already seen it used in Lessons 03 and 06) and the style this book uses from here on for object methods.

## Property Shorthand

When a variable's name matches the property key you want, you can skip repeating it:

```js
const name = "Ada";
const age = 30;

// Without shorthand:
const user1 = { name: name, age: age };

// With shorthand — identical result:
const user2 = { name, age };
```

## Practical Example

```js
// product.js

const taxRate = 0.18;

function createProduct(name, price) {
  return {
    name,   // property shorthand
    price,  // property shorthand
    getPriceWithTax() {
      return this.price + this.price * taxRate;
    },
    applyDiscount(percent) {
      this.price -= this.price * (percent / 100);
    }
  };
}

const product = createProduct("Keyboard", 2000);

console.log(product.getPriceWithTax()); // 2360
product.applyDiscount(10);
console.log(product.price);              // 1800
console.log(product["name"]);            // "Keyboard" — bracket notation works too
```

## Revision Questions

<details>
<summary>1. When must you use bracket notation instead of dot notation to access a property?</summary>

When the property name is stored in a variable, contains special characters, or isn't a valid identifier — dot notation only works with a literal, hardcoded property name.
</details>

<details>
<summary>2. Can you add a new property to an object that was declared with `const`?</summary>

Yes — `const` only prevents reassigning the variable to an entirely different object; adding, modifying, or deleting individual properties is still allowed.
</details>

<details>
<summary>3. What is a "method" in the context of an object?</summary>

A function stored as a property value on an object, typically called using dot or bracket notation on that object (e.g. `user.greet()`).
</details>

<details>
<summary>4. Rewrite `{ greet: function () { ... } }` using method shorthand.</summary>

`{ greet() { ... } }`
</details>

<details>
<summary>5. What does property shorthand let you do, and when does it apply?</summary>

It lets you write `{ name }` instead of `{ name: name }` whenever a variable's name is identical to the property key you want to use — saving repetition.
</details>
