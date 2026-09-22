# Module 02 Quiz — Layout & Grid System

## Question 1
Which container class is always 100% width at every screen size?
- A) .container
- B) .container-fluid
- C) .container-md
- D) .container-lg

<details><summary>Answer</summary>B — .container-fluid is always full width, regardless of breakpoint.</details>

## Question 2
At what minimum width does the "lg" breakpoint begin?
- A) 576px
- B) 768px
- C) 992px
- D) 1200px

<details><summary>Answer</summary>C — the lg breakpoint begins at a minimum width of 992px.</details>

## Question 3
How many units is Bootstrap's grid divided into?
- A) 10
- B) 12
- C) 16
- D) 24

<details><summary>Answer</summary>B — Bootstrap's grid uses a 12-unit column system.</details>

## Question 4
What happens to an unsized .col placed next to a col-3 sibling?
- A) It also takes exactly 3 units
- B) It takes up all remaining available space
- C) It collapses to zero width
- D) It causes a layout error

<details><summary>Answer</summary>B — an unsized .col automatically fills whatever space remains after sized siblings are accounted for.</details>

## Question 5
What does offset-md-4 do?
- A) Reduces the column's width by 4 units
- B) Pushes the column 4 units to the right, starting at md
- C) Hides the column below md
- D) Reorders the column visually

<details><summary>Answer</summary>B — it pushes the column 4 grid units to the right, taking effect at the md breakpoint and up.</details>

## Question 6
Why should .order-* be preferred over manually reordering HTML for responsive visual changes?
- A) It's faster to type
- B) It keeps document/source order intact for accessibility while changing visual order
- C) It reduces file size
- D) There's no real difference

<details><summary>Answer</summary>B — .order-* preserves logical HTML/accessibility order while only changing the visual rendering order.</details>

## Question 7
What two mechanisms combine to create Bootstrap's default column gutters?
- A) Flexbox gap and border
- B) Row negative margins and column padding
- C) Column margin and row border
- D) CSS Grid gap only

<details><summary>Answer</summary>B — a row's negative left/right margins combined with matching padding on each column.</details>

## Question 8
Which gutter utility controls only vertical spacing between wrapped rows?
- A) .gx-*
- B) .gy-*
- C) .g-*
- D) .gap-*

<details><summary>Answer</summary>B — .gy-* controls vertical gutter spacing specifically.</details>

## Question 9
Which of the following pairs represents the classic "stack on mobile, side by side on desktop" pattern?
- A) col-md-12 and col-12
- B) col-12 and col-md-6
- C) row and col-auto
- D) container and container-fluid

<details><summary>Answer</summary>B — col-12 (full width by default) paired with a breakpoint-sized class like col-md-6 is the core pattern.</details>

## Question 10
What is the practical warning sign that you're misusing z-index in a Bootstrap project?
- A) Using .z-1 on a badge
- B) Setting a custom z-index in the hundreds to try to beat a Bootstrap component
- C) Using position-relative on a parent element
- D) Applying .position-absolute to a badge

<details><summary>Answer</summary>B — Bootstrap's own components already use much higher z-index values internally; needing hundreds-range custom values usually means you're fighting the framework instead of using it correctly.</details>
