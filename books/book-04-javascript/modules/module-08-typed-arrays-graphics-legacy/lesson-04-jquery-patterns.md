# Lesson 4: jQuery Patterns

## Learning Objectives
- Understand why jQuery existed and the cross-browser problems it solved
- Read and write basic jQuery syntax: selection, chaining, events, and AJAX
- Translate common jQuery patterns into modern vanilla JavaScript equivalents
- Recognize jQuery code confidently when you encounter it in legacy projects

## Introduction

jQuery is a JavaScript library released in 2006 that, for most of the 2010s, was used on a majority of websites on the internet. You will not be writing new jQuery — the entire point of this lesson is *recognition and translation*, not adoption. If you inherit a legacy codebase, work at a company with an older stack, or read old Stack Overflow answers (and you will), you need to be able to read jQuery fluently and know exactly what its modern equivalent looks like using everything you've already learned in Modules 04–07.

## Why jQuery Existed

Before standardization efforts caught up, browsers disagreed wildly on how to do basic things: selecting elements, attaching events, making AJAX requests, even basic array-like operations. jQuery's core pitch was: *write once, run correctly everywhere*, papering over those inconsistencies with one consistent API.

By the time you're reading this, the DOM APIs from Module 04 (`querySelector`, `addEventListener`, `classList`) and the `fetch()` API from Module 05 have taken care of the exact problems jQuery was built to solve, natively, in every modern browser. That's *why* jQuery has faded — not because the ideas were bad, but because the platform absorbed them.

## The `$` Function and Selection

Everything in jQuery starts with `$` (a shorthand for `jQuery`), which selects elements and wraps them in a jQuery object with its own set of methods.

```js
// jQuery
$('.button').addClass('active');

// Vanilla JS equivalent (Module 04)
document.querySelectorAll('.button').forEach(el => el.classList.add('active'));
```

Notice something important: jQuery methods like `.addClass()` automatically apply to *every* matched element, looping internally. `querySelectorAll` gives you a `NodeList`, and you must loop over it yourself — jQuery hides that loop for you.

## Chaining

jQuery methods return the jQuery object itself, enabling **method chaining** — calling multiple methods in sequence on the same selection:

```js
$('#alert-box')
  .addClass('visible')
  .css('color', 'red')
  .fadeIn(300)
  .delay(2000)
  .fadeOut(300);
```

Modern vanilla JS doesn't chain quite as fluidly by default, since DOM methods like `classList.add()` return `undefined`, not the element. You'd write the equivalent as separate statements:

```js
const box = document.getElementById('alert-box');
box.classList.add('visible');
box.style.color = 'red';
// fadeIn/fadeOut have no native equivalent — you'd use CSS transitions instead
```

That last line is a clue to a bigger point: some jQuery features (like `.fadeIn()`/`.fadeOut()` animation helpers) don't have a direct one-line vanilla replacement at all — modern code handles that entirely differently, using CSS transitions or the Web Animations API rather than JavaScript-driven animation.

## Events

```js
// jQuery
$('#submit-btn').on('click', function (event) {
  event.preventDefault();
  console.log('Clicked!');
});

// Vanilla JS (Module 04)
document.getElementById('submit-btn').addEventListener('click', (event) => {
  event.preventDefault();
  console.log('Clicked!');
});
```

jQuery's `.on()` also has a built-in shortcut for **event delegation** (Module 04) that's worth recognizing, since it looks different from the vanilla pattern you learned:

```js
// jQuery: delegate clicks on any .item, even ones added later
$('#list').on('click', '.item', function () {
  console.log('Item clicked:', $(this).text());
});

// Vanilla JS equivalent
document.getElementById('list').addEventListener('click', (event) => {
  if (event.target.matches('.item')) {
    console.log('Item clicked:', event.target.textContent);
  }
});
```

## AJAX with jQuery

jQuery's `$.ajax()` (and its shortcuts `$.get()` / `$.post()`) is a wrapper around `XMLHttpRequest` from Lesson 3 — this is a good moment to connect the two lessons directly.

```js
// jQuery
$.ajax({
  url: 'https://api.example.com/users',
  method: 'GET',
  success: function (data) {
    console.log(data);
  },
  error: function (xhr, status, error) {
    console.error(error);
  }
});

// Shortcut version
$.get('https://api.example.com/users', function (data) {
  console.log(data);
});
```

The modern equivalent is the `fetch()` code you already know from Module 05:

```js
fetch('https://api.example.com/users')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

`$.ajax()` predates Promises in JavaScript entirely — it used **callback options** (`success`, `error`) because that was the only pattern available at the time. Later versions of jQuery added `.done()`/`.fail()`/`.then()` chaining on top of the same underlying XHR calls, as Promises became a language feature developers expected.

## DOM Manipulation and Traversal

```js
// jQuery
$('#container').append('<p>New paragraph</p>');
$('.item').first().text('Updated');
$('.item').eq(2).remove();

// Vanilla JS
document.getElementById('container').insertAdjacentHTML('beforeend', '<p>New paragraph</p>');
document.querySelector('.item').textContent = 'Updated';
document.querySelectorAll('.item')[2].remove();
```

## A Translation Reference

| jQuery | Vanilla JS equivalent |
|---|---|
| `$('.sel')` | `document.querySelectorAll('.sel')` |
| `$('#id')` | `document.getElementById('id')` |
| `$el.addClass('x')` | `el.classList.add('x')` |
| `$el.hide()` | `el.style.display = 'none'` |
| `$el.html(str)` | `el.innerHTML = str` |
| `$el.text(str)` | `el.textContent = str` |
| `$el.on('click', fn)` | `el.addEventListener('click', fn)` |
| `$el.attr('href')` | `el.getAttribute('href')` |
| `$.ajax(...)` | `fetch(...)` |
| `$(document).ready(fn)` | `document.addEventListener('DOMContentLoaded', fn)` |

## Practical Example

A common legacy pattern you'll encounter is a jQuery plugin call — code where jQuery is extended with custom behavior via `$.fn`. You don't need to write these, but you need to recognize the shape:

```js
// jQuery plugin definition (you'll see this pattern in old codebases)
$.fn.highlightOnHover = function () {
  return this.each(function () {
    $(this).hover(
      function () { $(this).css('background', 'yellow'); },
      function () { $(this).css('background', ''); }
    );
  });
};

// Usage
$('.card').highlightOnHover();
```

The vanilla translation, using `addEventListener` and `forEach` from Module 04:

```js
document.querySelectorAll('.card').forEach(card => {
  card.addEventListener('mouseenter', () => {
    card.style.background = 'yellow';
  });
  card.addEventListener('mouseleave', () => {
    card.style.background = '';
  });
});
```

## Revision Questions

<details>
<summary>1. What core problem was jQuery originally created to solve, and why has that problem largely disappeared?</summary>

jQuery solved cross-browser inconsistency — different browsers implemented DOM selection, events, and AJAX differently, and jQuery provided one consistent API on top. The problem has largely disappeared because modern browsers now implement standardized native APIs (`querySelectorAll`, `addEventListener`, `fetch`) consistently, absorbing what jQuery used to paper over.
</details>

<details>
<summary>2. Why does $('.button').addClass('active') work on every matched element without an explicit loop, while the vanilla equivalent needs .forEach()?</summary>

jQuery methods are designed to implicitly loop over every element in the current selection internally. Native `querySelectorAll` returns a `NodeList` of elements without any implicit iteration, so you must explicitly call `.forEach()` (or another loop) to apply an action to each one.
</details>

<details>
<summary>3. What is $.ajax() built on top of, and why did it originally use success/error callback options instead of Promises?</summary>

`$.ajax()` is built on top of `XMLHttpRequest`. It used callback options because it predates native Promises in JavaScript — callbacks were the only asynchronous pattern widely available at the time jQuery's AJAX module was designed.
</details>

<details>
<summary>4. Why can't every jQuery method be mapped to a single-line vanilla JS equivalent?</summary>

Some jQuery features, like `.fadeIn()`/`.fadeOut()` animations, aren't just convenience wrappers around an existing native API — they implement behavior (JavaScript-driven animation) that the modern platform handles through an entirely different mechanism (CSS transitions or the Web Animations API), so there's no direct one-line native substitute.
</details>
