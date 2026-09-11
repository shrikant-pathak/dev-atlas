# Lesson 2: Classes and Inheritance

## Learning Objectives
- Understand that ES6 classes are syntactic sugar over prototypal inheritance
- Write a class with a constructor, methods, and fields
- Use `extends` and `super` to build inheritance hierarchies
- Understand static methods and static properties
- Use getters and setters inside a class
- Understand private class fields (`#field`)
- Recognize how classes relate to `Object.create` and prototypes from Module 02

## Introduction

In Module 02 you learned how JavaScript's prototype chain works — how `Object.create()` lets one object inherit from another, and how constructor functions plus `.prototype` were used to fake "classes" before ES6. That pattern worked, but it was verbose and easy to get wrong (forgetting `new`, manually wiring up `.prototype.constructor`, etc.).

ES6 introduced the `class` keyword to give that same prototypal system a cleaner, more familiar syntax — the kind of syntax you've already been using in React class components or Vue class-based patterns. It's crucial to understand: **`class` does not add a new inheritance model to JavaScript.** Under the hood, it's still prototypes. `class` is sugar on top of what you already learned.

## 1. Basic class syntax

```javascript
class Person {
  constructor(name, age) {
    this.name = name;
    this.age = age;
  }

  greet() {
    return `Hi, I'm ${this.name}.`;
  }
}

const alice = new Person('Alice', 30);
console.log(alice.greet()); // "Hi, I'm Alice."
```

Compare this to the Module 02 constructor-function version:

```javascript
function Person(name, age) {
  this.name = name;
  this.age = age;
}
Person.prototype.greet = function () {
  return `Hi, I'm ${this.name}.`;
};
```

Same result. `greet` still lives on `Person.prototype`, not on each instance — you can verify this:

```javascript
console.log(Object.getPrototypeOf(alice) === Person.prototype); // true
console.log(alice.hasOwnProperty('greet')); // false — it's inherited
```

## 2. Class fields

Instead of assigning everything in the constructor, ES2022 class fields let you declare instance properties directly in the class body:

```javascript
class Person {
  species = 'Homo sapiens'; // class field, runs for every instance
  name;
  age;

  constructor(name, age) {
    this.name = name;
    this.age = age;
  }
}
```

This is the same field syntax you've likely seen in React class components for initializing state without a constructor:

```javascript
class Counter extends React.Component {
  state = { count: 0 }; // class field replacing constructor boilerplate
}
```

## 3. Inheritance with `extends` and `super`

`extends` sets up the prototype chain for you automatically:

```javascript
class Animal {
  constructor(name) {
    this.name = name;
  }
  speak() {
    return `${this.name} makes a sound.`;
  }
}

class Dog extends Animal {
  constructor(name, breed) {
    super(name); // must call super() before using `this`
    this.breed = breed;
  }
  speak() {
    return `${this.name} barks.`; // overrides Animal's speak
  }
  parentSpeak() {
    return super.speak(); // calls Animal's version explicitly
  }
}

const rex = new Dog('Rex', 'Labrador');
console.log(rex.speak());       // "Rex barks."
console.log(rex.parentSpeak()); // "Rex makes a sound."
console.log(rex instanceof Dog);    // true
console.log(rex instanceof Animal); // true — the chain goes all the way up
```

Two rules that trip people up:
- If a subclass defines a `constructor`, it **must** call `super(...)` before accessing `this`.
- If a subclass has **no** constructor at all, JavaScript auto-generates one that just calls `super(...args)` for you.

This exact pattern is what's happening every time you write `class MyScreen extends React.Component` in React or React Native — `React.Component`'s constructor sets up `this.props`, and `super(props)` is what wires that up in your subclass.

## 4. Static methods and properties

`static` members belong to the class itself, not to instances — useful for utility/factory functions related to the class:

```javascript
class Circle {
  static PI = 3.14159; // static field

  constructor(radius) {
    this.radius = radius;
  }

  area() {
    return Circle.PI * this.radius ** 2;
  }

  static fromDiameter(diameter) {
    return new Circle(diameter / 2); // factory method
  }
}

const c1 = new Circle(5);
const c2 = Circle.fromDiameter(10);
console.log(Circle.PI);       // 3.14159 — accessed on the class, not an instance
console.log(c1.PI);           // undefined — not inherited by instances
```

## 5. Getters and setters in classes

Recall getters/setters from Module 02's look at `Object.defineProperty`. Classes support the same idea with cleaner syntax:

```javascript
class Temperature {
  #celsius; // private field, see below

  constructor(celsius) {
    this.#celsius = celsius;
  }

  get fahrenheit() {
    return this.#celsius * 9 / 5 + 32;
  }

  set fahrenheit(value) {
    this.#celsius = (value - 32) * 5 / 9;
  }
}

const temp = new Temperature(25);
console.log(temp.fahrenheit); // 77 — called like a property, not a method
temp.fahrenheit = 100;
console.log(temp.celsius);    // internal value updated via the setter
```

## 6. Private class fields (`#field`)

Before ES2022, JavaScript had no true privacy — the `_underscorePrefix` convention you may have seen was just that: a convention, not enforcement. The `#` syntax creates genuinely private fields, accessible only inside the class body:

```javascript
class BankAccount {
  #balance = 0; // truly private — inaccessible from outside

  constructor(owner) {
    this.owner = owner;
  }

  deposit(amount) {
    if (amount <= 0) throw new Error('Deposit must be positive');
    this.#balance += amount;
  }

  get balance() {
    return this.#balance;
  }
}

const acc = new BankAccount('Priya');
acc.deposit(100);
console.log(acc.balance);   // 100
console.log(acc.#balance);  // SyntaxError — cannot access private field from outside
```

Private methods work the same way (`#privateMethod() {}`), and there's also `static #privateStatic` for private static members.

## 7. `instanceof` and checking types

```javascript
console.log(rex instanceof Dog);    // true
console.log(rex instanceof Animal); // true
console.log(rex instanceof Object); // true — everything inherits from Object
```

`instanceof` walks up the prototype chain checking whether `ClassName.prototype` appears anywhere in it — the same chain you built manually with `Object.create()` in Module 02, just wired up automatically by `extends`.

## Practical Example

A small hierarchy modeling shapes, showing inheritance, method overriding, `super`, static factory methods, and a private field:

```javascript
class Shape {
  static shapeCount = 0;

  constructor(name) {
    this.name = name;
    Shape.shapeCount++;
  }

  area() {
    throw new Error('area() must be implemented by subclass');
  }

  describe() {
    return `${this.name} has an area of ${this.area().toFixed(2)}`;
  }
}

class Rectangle extends Shape {
  #width;
  #height;

  constructor(width, height) {
    super('Rectangle');
    this.#width = width;
    this.#height = height;
  }

  area() {
    return this.#width * this.#height;
  }

  static square(side) {
    return new Rectangle(side, side);
  }
}

class Circle extends Shape {
  constructor(radius) {
    super('Circle');
    this.radius = radius;
  }

  area() {
    return Math.PI * this.radius ** 2;
  }
}

const shapes = [new Rectangle(4, 5), Rectangle.square(3), new Circle(2)];

shapes.forEach(shape => console.log(shape.describe()));
console.log(`Total shapes created: ${Shape.shapeCount}`);
```

## Revision Questions

<details>
<summary>1. Is `class` a new inheritance model in JavaScript?</summary>

No. It's syntactic sugar over the same prototype-based inheritance covered in Module 02. Class methods still live on the constructor's `.prototype`, and `instanceof` still walks the prototype chain.
</details>

<details>
<summary>2. What must a subclass constructor do before it can use `this`?</summary>

It must call `super(...)` to run the parent class's constructor first. Accessing `this` before calling `super()` throws a `ReferenceError`.
</details>

<details>
<summary>3. How do static members differ from instance members?</summary>

Static members (`static PI = ...`, `static method() {}`) belong to the class itself and are accessed as `ClassName.member`. They are not inherited by instances — `instance.PI` would be `undefined`.
</details>

<details>
<summary>4. What problem do private fields (`#field`) solve that the old `_underscore` convention didn't?</summary>

The underscore prefix was purely a naming convention — external code could still read or modify `_field` freely. Private fields (`#field`) are enforced by the language: any access from outside the class body throws a `SyntaxError`.
</details>

<details>
<summary>5. When you write `get fahrenheit()` inside a class, how is it used by callers?</summary>

It's accessed like a plain property (`temp.fahrenheit`), not called like a method (`temp.fahrenheit()`), even though it runs a function under the hood. The matching `set fahrenheit(value)` lets `temp.fahrenheit = 100` run custom logic on assignment.
</details>
