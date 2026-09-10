# Lesson 08: Prototypes and Inheritance

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a prototype is and how the prototype chain works
- Explain how method lookup traverses the prototype chain
- Create objects that share behavior via prototypes
- Use `Object.getPrototypeOf()` to inspect an object's prototype

## Introduction

In Lesson 07 you created objects with their own individual methods. But what if you need many objects that all share the same behavior — without copying that behavior onto every single one? JavaScript solves this with **prototypes**: a mechanism where objects can look up properties and methods on another object they're linked to, forming what's called the **prototype chain**.

## Every Object Has a Prototype

Even a plain object literal has a hidden link to a prototype object, which is why plain objects already have access to built-in methods you may have used without noticing:

```js
const user = { name: "Ada" };

console.log(user.toString()); // "[object Object]"
```

`user` doesn't define `toString()` itself — JavaScript looks it up on `user`'s prototype (in this case, `Object.prototype`, the root prototype almost everything ultimately links to) and finds it there.

## Inspecting the Prototype

```js
const user = { name: "Ada" };

console.log(Object.getPrototypeOf(user) === Object.prototype); // true
```

## Functions Have a `prototype` Property

Every regular function (Lesson 01) automatically gets a `prototype` property — an object where you can attach shared behavior for anything created from that function.

```js
function Person(name, age) {
  this.name = name;
  this.age = age;
}

Person.prototype.greet = function () {
  return `Hi, I'm ${this.name}`;
};

const ada = new Person("Ada", 30);
const grace = new Person("Grace", 40);

console.log(ada.greet());   // "Hi, I'm Ada"
console.log(grace.greet()); // "Hi, I'm Grace"
```

The `new` keyword creates a new object, sets `this` to it inside `Person` (recall Lesson 05 — `this` depends on how a function is called, and `new` is one specific calling style), and links that new object's prototype to `Person.prototype`. Both `ada` and `grace` share the exact same `greet` function in memory — it's defined once on the prototype, not copied onto each object.

## The Prototype Chain

If a property isn't found directly on an object, JavaScript looks up its prototype, then that prototype's prototype, and so on, until it either finds the property or reaches the end of the chain (`null`).

```js
console.log(ada.hasOwnProperty("name"));  // true — "name" is directly on ada
console.log(ada.hasOwnProperty("greet")); // false — "greet" lives on Person.prototype, not ada itself
console.log(ada.greet());                  // still works — found via the prototype chain
```

## Building Inheritance with Prototypes

Objects can be chained so one "inherits" behavior from another — the basis of everything object-oriented in pre-class JavaScript (and still what powers `class` syntax under the hood, which you'll formally cover in Module 06).

```js
function Animal(name) {
  this.name = name;
}

Animal.prototype.eat = function () {
  return `${this.name} is eating.`;
};

function Dog(name) {
  Animal.call(this, name); // reuse Animal's setup logic (Lesson 05 — call())
}

Dog.prototype = Object.create(Animal.prototype); // link Dog's prototype to Animal's
Dog.prototype.bark = function () {
  return `${this.name} says woof!`;
};

const rex = new Dog("Rex");

console.log(rex.eat());  // "Rex is eating."  — found via the prototype chain, from Animal
console.log(rex.bark()); // "Rex says woof!"  — found directly on Dog.prototype
```

`Object.create()` gets its own dedicated look in Lesson 09, since it's also useful outside of inheritance chains.

## Practical Example

```js
// shape-hierarchy.js

function Shape(name) {
  this.name = name;
}

Shape.prototype.describe = function () {
  return `This is a ${this.name}.`;
};

function Circle(radius) {
  Shape.call(this, "circle");
  this.radius = radius;
}

Circle.prototype = Object.create(Shape.prototype);
Circle.prototype.area = function () {
  return Math.PI * this.radius ** 2;
};

const myCircle = new Circle(5);

console.log(myCircle.describe());       // "This is a circle."
console.log(myCircle.area().toFixed(2)); // "78.54"
```

## Revision Questions

<details>
<summary>1. What is a prototype?</summary>

An object that another object is linked to, from which it can inherit properties and methods that aren't defined directly on itself.
</details>

<details>
<summary>2. What is the "prototype chain," and what happens when a property isn't found on an object directly?</summary>

The prototype chain is the sequence of linked prototype objects JavaScript searches through. If a property isn't found directly on an object, JavaScript checks its prototype, then that prototype's prototype, and so on, until it's found or the chain ends at `null`.
</details>

<details>
<summary>3. If two objects created via `new Person(...)` both call `.greet()`, are they running two separate copies of that function?</summary>

No — both objects share the exact same `greet` function defined once on `Person.prototype`; it isn't duplicated onto each individual object.
</details>

<details>
<summary>4. What does `Object.getPrototypeOf(obj)` do?</summary>

It returns the prototype object that `obj` is linked to, letting you inspect the prototype chain directly.
</details>

<details>
<summary>5. In the `Dog`/`Animal` example, why is `Animal.call(this, name)` used inside `Dog`?</summary>

To reuse `Animal`'s property-setup logic for the new `Dog` instance, explicitly running it with `this` set to the new object being constructed — otherwise `Dog` would have to duplicate that setup code itself.
</details>
