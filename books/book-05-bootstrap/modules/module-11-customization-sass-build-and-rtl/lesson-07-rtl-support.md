# Lesson 07: RTL Support

## Learning Objectives
- Understand why Bootstrap's logical property naming (from Modules 04, 07) exists
- Enable RTL output via Sass configuration
- Know what RTL conversion handles automatically vs. what still needs manual attention
- Test an RTL layout using the `dir="rtl"` HTML attribute

## Introduction
This closes out both Module 11 and the book's customization coverage by cashing in a design decision flagged repeatedly since Module 04: every "start"/"end" class name (`.border-start`, `.ms-auto`, `.rounded-start`, `.offcanvas-start`) instead of "left"/"right" was chosen specifically to make what this lesson covers possible with minimal extra work.

## Why Logical Properties, Recapped
Recall from Module 04, Lesson 03: physical properties (`margin-left`, `border-right`) always refer to a fixed screen side regardless of reading direction. Logical properties (`margin-inline-start`, `border-inline-end`) refer to a side RELATIVE to the current text direction — "start" means "left" in a left-to-right (LTR) language like English, but automatically means "right" in a right-to-left (RTL) language like Arabic or Hebrew, with zero class name changes required.

## Enabling RTL Output
Bootstrap's Sass build can generate an RTL-flipped version of the compiled CSS using a dedicated Sass variable:

```scss
// scss/custom-rtl.scss
$primary: #6f42c1;

$rtl: true;

@import "../node_modules/bootstrap/scss/bootstrap";
```

Compile it to a separate output file, distinct from your standard LTR build:

```bash
npx sass scss/custom-rtl.scss css/custom.rtl.css
```

You'd typically ship BOTH compiled files, and load whichever one matches the current page's language — a common pattern uses the HTML document's `lang`/`dir` attributes to decide which stylesheet `<link>` to include server-side, or swaps them via a small amount of JavaScript for a language-switcher feature.

## Applying `dir="rtl"` for Testing
Regardless of which compiled CSS is loaded, the HTML document itself needs `dir="rtl"` for the browser to correctly apply right-to-left text flow and reading order:

```html
<html dir="rtl" lang="ar">
<head>
  <link rel="stylesheet" href="css/custom.rtl.css">
</head>
<body>
  <div class="card">
    <div class="card-body">
      <h5 class="card-title">بطاقة تجريبية</h5>
      <button class="btn btn-primary ms-2">إجراء</button>
    </div>
  </div>
</body>
</html>
```

With the RTL-compiled CSS and `dir="rtl"` both in place, every logical-property class you've used throughout this book — spacing (Module 04), borders (Module 04), offcanvas positioning (Module 07), rounded corners (Module 04) — automatically flips to the correct visual side, with the exact same class names as your LTR markup.

## What Doesn't Flip Automatically
It's important to be direct about the limits here, echoing this module's earlier honesty about customization boundaries: RTL conversion correctly handles anything expressed through Bootstrap's logical CSS properties and utility classes. It does NOT automatically:
- **Reverse icon direction** — an arrow icon pointing right (meaning "next" or "forward" in LTR) doesn't automatically flip to point left in RTL; icons need their own explicit RTL-aware handling, often via a CSS transform or a separate icon asset
- **Fix hardcoded physical properties in custom CSS** — if your own custom styles (outside Bootstrap's own classes) use `margin-left` instead of a logical equivalent, RTL conversion has no way to know to flip it, since it never touches your custom CSS at all
- **Reorder content that isn't CSS-driven** — if markup order itself assumes a specific reading direction in a way not expressible through CSS alone (rare, but possible in complex custom components), that requires manual markup changes

## Practical Example
A bilingual page structure demonstrating both compiled outputs, switched via a lang selector (server logic or JS would determine which link loads — shown here as two static examples):

```html
<!-- English version -->
<html dir="ltr" lang="en">
<head><link rel="stylesheet" href="css/custom.css"></head>
<body>
  <div class="card"><div class="card-body">
    <h5 class="card-title">Sample Card</h5>
    <button class="btn btn-primary ms-2">Action</button>
  </div></div>
</body>
</html>

<!-- Arabic version — same markup, different compiled CSS, different dir -->
<html dir="rtl" lang="ar">
<head><link rel="stylesheet" href="css/custom.rtl.css"></head>
<body>
  <div class="card"><div class="card-body">
    <h5 class="card-title">بطاقة تجريبية</h5>
    <button class="btn btn-primary ms-2">إجراء</button>
  </div></div>
</body>
</html>
```

Note the markup and classes are IDENTICAL between both versions — only the compiled CSS file and the `dir`/`lang` attributes differ, which is the entire point of the logical-property system this lesson closes out.

## Revision Questions

<details>
<summary>1. What's the fundamental difference between a physical CSS property and a logical one, in the context of RTL support?</summary>
A physical property (`margin-left`) always refers to a fixed screen side regardless of text direction; a logical property (`margin-inline-start`) refers to a side relative to the current reading direction, automatically meaning left in LTR and right in RTL with no class changes needed.
</details>

<details>
<summary>2. What Sass variable enables generating an RTL-flipped compiled CSS output?</summary>
`$rtl: true;`, set before Bootstrap's `@import`, in a separate Sass entry file typically compiled to a distinct output CSS file from the standard LTR build.
</details>

<details>
<summary>3. Besides loading the correct RTL-compiled CSS, what HTML attribute must also be set for a page to render correctly right-to-left?</summary>
`dir="rtl"` on the `<html>` element (typically alongside an appropriate `lang` attribute).
</details>

<details>
<summary>4. Name two things RTL conversion does NOT automatically handle.</summary>
Reversing icon direction (e.g. a "next" arrow pointing the wrong way) and fixing hardcoded physical properties in custom CSS outside Bootstrap's own classes (a third valid answer: reordering markup that isn't CSS-driven, in rare complex cases).
</details>
