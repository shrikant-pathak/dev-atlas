# Module 01 Cheatsheet — JavaScript Fundamentals

## Adding JS to a Page
```html
<script src="script.js" defer></script>
```

## Statements, Semicolons & Comments
```js
console.log("statement, always ending with a semicolon");

// single-line comment

/*
  multi-line
  comment
*/
```

## Variable Declarations
```js
const pi = 3.14;   // cannot be reassigned — default choice
let count = 0;      // can be reassigned
var old = "avoid";  // legacy — avoid in modern code
```
`const` blocks reassignment, not mutation:
```js
const arr = [1, 2];
arr.push(3);   // fine
arr = [9];     // TypeError
```

## Primitive Types

string "hello"
number 42, 3.14
boolean true, false
undefined (declared, not assigned)
null (intentionally empty)
symbol Symbol("id")
bigint 123n


## typeof
```js
typeof "hi";       // "string"
typeof 42;          // "number"
typeof true;        // "boolean"
typeof undefined;   // "undefined"
typeof null;        // "object"  (known quirk)
```

## Type Coercion
```js
"5" + 3;     // "53" (string concatenation)
"5" - 3;     // 2 (numeric subtraction)
Number("5"); // 5 (explicit)
String(5);   // "5" (explicit)
```

## Falsy Values (memorize this list)

false 0 -0 "" null undefined NaN

Everything else — including `"0"`, `[]`, `{}` — is truthy.

## Arithmetic Operators
```js
+  -  *  /  %  **
++ (increment)   -- (decrement)
```

## Assignment Operators
```js
=  +=  -=  *=  /=
```

## Comparison Operators
```js
>  <  >=  <=
==   !=   (loose — avoid)
===  !==  (strict — prefer)
```

## Logical Operators
```js
&&  (AND)
||  (OR)
!   (NOT)
```

## Ternary Operator
```js
condition ? valueIfTrue : valueIfFalse
```

## Conditionals
```js
if (condition) {
  // ...
} else if (otherCondition) {
  // ...
} else {
  // ...
}

switch (value) {
  case "a":
    // ...
    break;
  default:
  // ...
}
```

## Loops
```js
for (let i = 0; i < n; i++) { }
while (condition) { }
do { } while (condition);

break;     // exit loop
continue;  // skip to next iteration
```
