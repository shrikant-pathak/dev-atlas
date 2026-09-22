# Lesson 05: Cards

## Learning Objectives
- Structure a card using `.card`, `.card-body`, `.card-title`, `.card-text`
- Add headers, footers, and images to a card
- Build card groups, grids, and equal-height card rows
- Use list-based card content with `.list-group`

## Introduction
Cards are Bootstrap's most flexible container component — a bordered, padded box that can hold nearly anything: text, images, buttons, lists. If Lessons 01–04 gave you individual pieces (buttons, badges, alerts), cards are often where those pieces get assembled together into a real UI unit, which is why this lesson's practical example pulls in components from every earlier lesson in this module.

## Basic Card Structure
```html
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
```

Every one of these `.card-*` classes exists purely to apply the correct spacing and typography relationships between pieces — `.card-title` gets appropriate bottom margin, `.card-text` resets paragraph spacing to fit the card rhythm, and so on.

## Images in Cards
```html
<div class="card" style="width: 18rem;">
  <img src="photo.jpg" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">Card with image</h5>
    <p class="card-text">Some text describing the image above.</p>
  </div>
</div>
```

`.card-img-top` handles cropping the image to the card's rounded top corners — without it, a square image would visually clash with the card's own `.rounded` corners (Module 04, Lesson 03) sitting underneath it.

## Headers and Footers
```html
<div class="card">
  <div class="card-header">Featured</div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
  <div class="card-footer text-body-secondary">2 days ago</div>
</div>
```

## Cards with List Groups
`.list-group` (a related but separate component) slots cleanly inside a card body-less structure:

```html
<div class="card" style="width: 18rem;">
  <div class="card-header">Team members</div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Alice — Lead Designer</li>
    <li class="list-group-item">Bob — Backend Engineer</li>
    <li class="list-group-item">Carla — Product Manager</li>
  </ul>
</div>
```

`.list-group-flush` removes the list's own rounded corners and outer border so it sits flush inside the card's border instead of doubling it up.

## Card Groups and Grids
For multiple equal-width, equal-height cards in a row, combine cards with the grid system from Module 02:

```html
<div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Card 1</h5>
        <p class="card-text">Some text.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Card 2</h5>
        <p class="card-text">Shorter text.</p>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
      <div class="card-body">
        <h5 class="card-title">Card 3</h5>
        <p class="card-text">A bit more text than the others to show height matching.</p>
      </div>
    </div>
  </div>
</div>
```

`.h-100` (the height utility from Module 04, Lesson 05) is the key detail here — without it, each card would shrink to fit its own content height, leaving a ragged row where shorter-content cards look noticeably shorter than longer ones. With `.h-100`, every card stretches to fill its grid column's full height, since the `.row-cols-*` grid columns are already equal height by default (a flex-based behavior from Module 02).

## Practical Example
A pricing card combining a header, badge, list group, and button — pulling together Lessons 01–05:

```html
<div class="card text-center" style="width: 20rem;">
  <div class="card-header bg-primary text-white">
    Pro Plan
    <span class="badge bg-light text-primary rounded-pill float-end">Popular</span>
  </div>
  <div class="card-body">
    <h2 class="card-title">$29<small class="text-body-secondary">/mo</small></h2>
    <ul class="list-group list-group-flush mb-3">
      <li class="list-group-item">Unlimited projects</li>
      <li class="list-group-item">Priority support</li>
      <li class="list-group-item">Advanced analytics</li>
    </ul>
    <button class="btn btn-primary w-100">Choose Pro</button>
  </div>
</div>
```

## Revision Questions

<details>
<summary>1. What does `.card-img-top` handle that a plain `<img>` inside a card wouldn't?</summary>
It crops the image's corners to match the card's own rounded corners, preventing a visual clash between a square image and the card's rounded container.
</details>

<details>
<summary>2. Why is `.h-100` necessary when building a row of equal-height cards?</summary>
Without it, each card shrinks to fit only its own content, producing a ragged row where cards with less content look shorter; `.h-100` stretches every card to fill its already-equal-height grid column.
</details>

<details>
<summary>3. What does `.list-group-flush` change about a list group placed inside a card?</summary>
It removes the list's own rounded corners and outer border so it sits flush against the card's border instead of creating a visible double border/corner effect.
</details>

<details>
<summary>4. From how many earlier lessons in this module does the practical pricing card example pull components?</summary>
All five — card structure (Lesson 05), buttons (Lesson 01), badges (Lesson 03), plus the header/list-group patterns covered within this same lesson.
</details>
