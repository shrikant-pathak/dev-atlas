# Module 04 Cheatsheet — DOM, Events & Navigation

## Selecting Elements
```js
document.getElementById("id")
document.querySelector(".class")           // first match, any CSS selector
document.querySelectorAll(".class")         // all matches — static NodeList
document.getElementsByClassName("class")     // live HTMLCollection
document.getElementsByTagName("li")           // live HTMLCollection

Array.from(htmlCollection)  // or [...htmlCollection] — convert to real array
```

## Traversal
```js
el.parentElement
el.children              // elements only (not text nodes)
el.childNodes             // includes text/whitespace nodes too
el.firstElementChild / el.lastElementChild
el.nextElementSibling / el.previousElementSibling

el.closest(".card")       // nearest matching ancestor (or self)
parent.contains(child)     // is child inside parent?
```

## Events
```js
el.addEventListener("click", event => { });
el.removeEventListener("click", handlerFn); // needs same function reference

event.target          // what was actually clicked/triggered
event.currentTarget     // where the listener is attached
event.preventDefault()   // stop default browser behavior
event.stopPropagation()  // stop bubbling to ancestors
```

### Event Delegation Pattern
```js
parentEl.addEventListener("click", event => {
  const item = event.target.closest(".item");
  if (!item) return;
  // handle click on `item`
});
```

## Forms
```js
input.value        // always a string
checkbox.checked     // boolean

form.addEventListener("submit", event => {
  event.preventDefault(); // stop full page reload
});

input.checkValidity()      // true/false against HTML constraints
input.validity.valid
input.validationMessage
input.setCustomValidity("msg") // "" to clear
```

## Script Loading
```html
<script src="a.js"></script>          <!-- blocks parsing, runs immediately -->
<script src="b.js" defer></script>     <!-- doesn't block, runs after parsing, in order -->
<script src="c.js" async></script>      <!-- doesn't block, runs ASAP, order not guaranteed -->
```
```js
document.addEventListener("DOMContentLoaded", () => { }); // DOM parsed, resources may still be loading
window.addEventListener("load", () => { });                // everything fully loaded
```
