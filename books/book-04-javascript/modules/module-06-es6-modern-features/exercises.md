# Module 06 Exercises: ES6+ Modern Features

## Exercise 1: Modules
Create two files: `shapes.js` and `main.js`.
1. In `shapes.js`, add named exports `area(w, h)` and `perimeter(w, h)` for a rectangle, plus a default export `class Rectangle` that uses those functions internally.
2. In `main.js`, import all three and log the area and perimeter of a `Rectangle` with width 6 and height 4.

## Exercise 2: Class Inheritance
Build a class hierarchy:
1. `Vehicle` base class with a constructor storing `make` and `model`, and a method `describe()`.
2. `Car extends Vehicle`, adding a `numDoors` property and overriding `describe()` to include it while still calling the parent's version via `super.describe()`.
3. Add a `static` factory method `Car.fourDoor(make, model)` that returns a `Car` with `numDoors = 4`.
4. Add a private field `#mileage` to `Car` with a getter `mileage` and a method `drive(miles)` that increases it.

## Exercise 3: Optional Chaining & Nullish Coalescing
Given this data:
```javascript
const orders = [
  { id: 1, customer: { name: 'Alex', address: { city: 'Pune' } } },
  { id: 2, customer: { name: 'Sam' } },
  { id: 3, customer: null },
];
```
Write a function `getCity(order)` that safely returns the city, or `'Unknown'` if any part of the chain is missing — using only `?.` and `??`.

## Exercise 4: RegExp
Write three small validator functions using regex:
1. `isValidHexColor(str)` — matches strings like `#fff` or `#a1b2c3`.
2. `extractNumbers(str)` — returns an array of all numbers (as strings) found anywhere in a string.
3. `slugify(str)` — lowercases a string and replaces any run of non-alphanumeric characters with a single hyphen (e.g., `"Hello, World!"` → `"hello-world"`).

## Exercise 5: ES Version History
Without looking back at the lesson, list which ES version introduced each of the following, then check your answers against Lesson 5:
1. `async`/`await`
2. Optional chaining (`?.`)
3. Private class fields (`#field`)
4. `let` and `const`
5. Logical assignment operators (`??=`, `&&=`, `||=`)

## Challenge: Put it all together
Build a small "note manager" module (`notes.js`) that:
- Exports a default `class NoteManager` with private field `#notes = []`
- Has methods `add(text)`, `remove(id)`, and `search(pattern)` where `search` accepts a regex and returns matching notes
- Uses optional chaining/nullish coalescing when reading a note's optional `tags` field, defaulting to an empty array
- Import it into a second file and demonstrate all three methods
