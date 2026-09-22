# Module 03 Quiz — Typography & Content

## Question 1
What does applying `.display-2` to an `<h1>` change?
- A) The semantic meaning of the element
- B) Only its visual size, keeping it semantically an h1
- C) Converts it into a `<div>`
- D) Makes it non-responsive

<details><summary>Answer</summary>B — display classes only change visual size; the element remains semantically an h1.</details>

## Question 2
Why does Bootstrap use `.text-start` instead of `.text-left`?
- A) It's shorter to type
- B) It adapts correctly for right-to-left layouts
- C) `.text-left` doesn't exist in CSS
- D) There is no difference

<details><summary>Answer</summary>B — "start"/"end" phrasing adapts correctly to RTL layouts, unlike literal "left"/"right".</details>

## Question 3
What problem does RFS solve?
- A) It fixes broken images
- B) It makes font sizes scale smoothly with viewport width instead of jumping at breakpoints
- C) It compiles Sass automatically
- D) It adds dark mode support

<details><summary>Answer</summary>B — RFS provides smooth, continuous font-size scaling instead of abrupt jumps at fixed breakpoints.</details>

## Question 4
Which classes get RFS applied automatically by default?
- A) All headings h1-h6
- B) .display-1 through .display-6
- C) .lead only
- D) All paragraph text

<details><summary>Answer</summary>B — RFS is applied automatically to the display heading classes.</details>

## Question 5
What does `.img-fluid` set on an image?
- A) width: 100% only
- B) max-width: 100% and height: auto
- C) object-fit: cover
- D) border-radius: 50%

<details><summary>Answer</summary>B — max-width: 100% and height: auto, so the image scales down but never up beyond its natural size.</details>

## Question 6
Why is `.d-block` needed alongside `.mx-auto` to center an image?
- A) Images can't have margins
- B) Images are inline by default, and mx-auto only centers block-level elements
- C) `.mx-auto` doesn't work on images at all
- D) It isn't actually needed

<details><summary>Answer</summary>B — images are inline elements by default, so d-block is required for mx-auto's centering to take effect.</details>

## Question 7
What does `.table-responsive` do?
- A) Adds striping to a table
- B) Wraps a table in a horizontally scrollable container
- C) Removes all table borders
- D) Converts a table into a grid

<details><summary>Answer</summary>B — it wraps the table so it becomes horizontally scrollable instead of breaking the page layout on small screens.</details>

## Question 8
Which element pairing correctly displays a multi-line code sample with preserved formatting?
- A) `<span>` inside `<code>`
- B) `<pre>` wrapping `<code>`
- C) `<kbd>` wrapping `<code>`
- D) `<mark>` wrapping `<pre>`

<details><summary>Answer</summary>B — wrapping `<code>` in `<pre>` preserves whitespace and line breaks for multi-line snippets.</details>

## Question 9
Why was the dedicated `.jumbotron` component removed in Bootstrap 5?
- A) It was replaced by a new `.hero` class
- B) It baked in defaults that most projects overrode anyway; Bootstrap 5 favors composing patterns from utilities instead
- C) It caused browser compatibility issues
- D) It was renamed to `.banner`

<details><summary>Answer</summary>B — Bootstrap 5 shifted toward utility-based composition rather than single fixed-default components.</details>

## Question 10
In a hero section built with `.container-fluid` wrapping an inner `.container`, what is the inner container's purpose?
- A) To make the background full width
- B) To keep the text content comfortably width-constrained while the background spans full width
- C) It has no functional purpose
- D) To add a border around the section

<details><summary>Answer</summary>B — the inner container keeps content readable and centered even though the outer element's background spans the entire viewport width.</details>
