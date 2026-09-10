# Module 02 Cheatsheet — Functions, Scope & Objects

## Function Syntaxes
```js
function greet(name) { return `Hi ${name}`; }   // declaration — fully hoisted

const greet = function (name) { return `Hi ${name}`; }; // expression — not hoisted

const greet = (name) => `Hi ${name}`;            // arrow — implicit return, no own `this`
const greet = name => `Hi ${name}`;              // parens optional for 1 param
```

## Default Parameters
```js
function greet(name = "there") { return `Hi ${name}`; }
```

## Scope

global — visible everywhere
function — visible only inside a function (var, function-scoped)
block — visible only inside { } (let/const)


## Hoisting
```js
console.log(a); // undefined — var is hoisted, not its value
var a = 1;

console.log(b); // ReferenceError — TDZ
let b = 1;

sayHi(); // works — function declarations fully hoisted
function sayHi() {}
```

## Closures
```js
function makeCounter() {
  let count = 0;
  return () => ++count; // remembers `count` after makeCounter() finishes
}
```

## Higher-Order Functions
```js
function process(value, callback) {
  return callback(value);
}
```

## `this`
```js
obj.method();          // this = obj
fn();                  // this = undefined (strict mode)
() => {}               // this = inherited from surrounding scope

fn.call(obj, ...args);   // invoke now, this = obj
fn.apply(obj, [args]);   // invoke now, args as array
const bound = fn.bind(obj); // returns new function, this locked to obj
```

## IIFE
```js
(function () {
  // runs immediately, scope stays private
})();
```

## Object Literals
```js
const user = {
  name: "Ada",         // property
  greet() { return this.name; }, // method shorthand
};

user.name;        // dot notation
user["name"];     // bracket notation
delete user.name;  // remove property

const name = "Ada";
const obj = { name }; // property shorthand
```

## Prototypes
```js
function Person(name) { this.name = name; }
Person.prototype.greet = function () { return this.name; };

const p = new Person("Ada");
Object.getPrototypeOf(p) === Person.prototype; // true
```

## Object.create
```js
const proto = { eat() { return "eating"; } };
const dog = Object.create(proto);
Object.create(null); // no prototype at all
```

## Getters / Setters
```js
const circle = {
  radius: 5,
  get area() { return Math.PI * this.radius ** 2; },
  set radius(value) { this._radius = value; }
};
```
