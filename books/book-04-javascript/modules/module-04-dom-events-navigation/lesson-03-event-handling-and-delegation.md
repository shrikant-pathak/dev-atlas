# Lesson 03: Event Handling and Delegation

## Learning Objectives
By the end of this lesson, you will be able to:
- Attach event listeners using `addEventListener`
- Use the event object, including `target` and `currentTarget`
- Explain event bubbling and use `stopPropagation()` and `preventDefault()`
- Implement event delegation and explain why it's often preferable to attaching many individual listeners

## Introduction

Selecting (Lesson 01) and traversing (Lesson 02) elements lets you read and navigate the page. **Events** are how you make it interactive — responding to clicks, key presses, form submissions, and more. You saw a first glimpse of `addEventListener` back in Module 01, Lesson 01; this lesson gives it a complete treatment.

## Attaching an Event Listener

```js
const button = document.querySelector("#submit-btn");

button.addEventListener("click", function () {
  console.log("Button was clicked!");
});
```

An arrow function (Module 02, Lesson 01) works too, and is the more common modern style:

```js
button.addEventListener("click", () => {
  console.log("Button was clicked!");
});
```

Common event types you'll use constantly: `click`, `submit`, `input`, `change`, `keydown`, `mouseover`, `mouseout`.

### Removing an Event Listener

```js
function handleClick() {
  console.log("Clicked!");
}

button.addEventListener("click", handleClick);
button.removeEventListener("click", handleClick); // must pass the SAME function reference
```

`removeEventListener` only works if you pass the exact same function reference used in `addEventListener` — an anonymous inline arrow function can never be removed this way, since there's no reference to it afterward.

## The Event Object

Every event listener automatically receives an **event object** describing what happened.

```js
button.addEventListener("click", event => {
  console.log(event.type);        // "click"
  console.log(event.target);       // the exact element that was actually clicked
  console.log(event.currentTarget); // the element the listener is attached to
});
```

### `target` vs. `currentTarget`

This distinction matters enormously once you reach event delegation below:

```html
<button id="submit-btn"><span>Submit</span></button>
```

```js
button.addEventListener("click", event => {
  console.log(event.target);        // could be the <span>, if that's exactly what was clicked
  console.log(event.currentTarget);  // always the <button> — where the listener was attached
});
```

`target` is *what* was actually clicked (which could be a nested child element); `currentTarget` is *where the listener lives*.

## `preventDefault()`

Stops the browser's default behavior for an event — most commonly used to stop a link from navigating, or a form from submitting immediately (covered fully in Lesson 04).

```js
const link = document.querySelector("a");

link.addEventListener("click", event => {
  event.preventDefault(); // the browser will NOT navigate to the link's href
  console.log("Link click intercepted");
});
```

## Event Bubbling and `stopPropagation()`

When an event fires on an element, it doesn't just run listeners on that element — it then **bubbles** upward, firing the same event type on each ancestor in turn, all the way up to `document`.

```html
<div id="outer">
  <div id="inner">
    <button id="btn">Click</button>
  </div>
</div>
```

```js
document.getElementById("outer").addEventListener("click", () => console.log("outer"));
document.getElementById("inner").addEventListener("click", () => console.log("inner"));
document.getElementById("btn").addEventListener("click", () => console.log("button"));

// Clicking the button logs, in order:
// "button"
// "inner"
// "outer"
```

`event.stopPropagation()` stops this bubbling from continuing further up:

```js
document.getElementById("btn").addEventListener("click", event => {
  event.stopPropagation();
  console.log("button — bubbling stops here");
});
// Clicking the button now only logs "button — bubbling stops here"
```

## Event Delegation

Instead of attaching a separate listener to every individual item (which is wasteful, and doesn't work for items added later), **event delegation** attaches a single listener to a shared parent, and uses bubbling plus `event.target` to figure out what was actually clicked.

```html
<ul id="task-list">
  <li data-id="1">Buy milk</li>
  <li data-id="2">Walk dog</li>
  <li data-id="3">Write code</li>
</ul>
```

```js
const list = document.getElementById("task-list");

list.addEventListener("click", event => {
  const clickedItem = event.target.closest("li"); // Lesson 02's closest()

  if (!clickedItem) return; // clicked somewhere on the list but not on an <li>

  console.log(`Clicked task: ${clickedItem.dataset.id}`);
});
```

This single listener correctly handles clicks on any `<li>` — including ones added to the list **after** this code runs, since the listener lives on the stable parent `#task-list`, not on the individual items.

## Practical Example

```js
// todo-delegation.js

const list = document.getElementById("task-list");

list.addEventListener("click", event => {
  const item = event.target.closest("li");
  if (!item) return;

  item.classList.toggle("completed"); // toggle a "done" style on click
});

function addTask(text) {
  const li = document.createElement("li"); // DOM creation covered fully in Module 05
  li.textContent = text;
  list.appendChild(li);
}

addTask("Read Module 04"); // works immediately with the delegated listener, no extra code needed
```

## Revision Questions

<details>
<summary>1. What's the difference between `event.target` and `event.currentTarget`?</summary>

`event.target` is the exact element that triggered the event (which could be a nested child). `event.currentTarget` is always the element the listener itself is attached to.
</details>

<details>
<summary>2. What does `event.preventDefault()` do?</summary>

It stops the browser's default behavior for that event — for example, preventing a link from navigating or a form from submitting immediately.
</details>

<details>
<summary>3. What is event bubbling?</summary>

After an event fires on an element, it propagates upward, triggering the same event type on each ancestor element in turn, all the way up to `document`, unless something stops it.
</details>

<details>
<summary>4. What does `event.stopPropagation()` do?</summary>

It prevents an event from continuing to bubble up to ancestor elements after the current listener runs.
</details>

<details>
<summary>5. Why is event delegation often preferable to attaching a listener to every individual item?</summary>

It requires only one listener on a stable parent element instead of many, and it automatically works for items added to the page later — since the listener relies on bubbling and `event.target`, not on being individually attached to each item.
</details>
