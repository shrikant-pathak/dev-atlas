# Lesson 05: Lists and the Typography Plugin

## Learning Objectives
- Style ordered and unordered lists with `list-*` utilities
- Explain why Preflight strips default list styling, and when that becomes a problem
- Install and apply the official `@tailwindcss/typography` plugin for rendering raw HTML content

## Introduction
Module 01 noted that Preflight removes default list bullets and numbering as part of its base reset. This is fine for UI lists you build and style yourself with utilities — but it becomes a real problem for one specific, common case: rendering raw HTML you don't control, like Markdown-rendered blog content or a CMS field. This lesson covers both sides of that story.

## List Style Utilities

```html
<ul class="list-disc list-inside">
  <li>First item</li>
  <li>Second item</li>
</ul>

<ol class="list-decimal list-inside">
  <li>Step one</li>
  <li>Step two</li>
</ol>
```

| Class | Effect |
|---|---|
| `list-disc` | bullet points |
| `list-decimal` | numbers |
| `list-none` | no marker (Preflight's default) |
| `list-inside` | marker sits inside the content box, indenting with wrapped lines |
| `list-outside` | marker sits outside the content box (browser default position) |

## The Problem Preflight Creates for Raw HTML Content

Recall from Module 01 that Preflight strips list markers, heading sizes, and default spacing from every element. This is exactly what you want for custom UI — you style everything explicitly with utilities. But consider a blog post rendered from Markdown or a CMS's rich-text field: the output is raw `<h2>`, `<p>`, `<ul>`, `<blockquote>` tags you don't individually control, and you can't add a `text-2xl font-bold` class to every heading a content editor happens to create.

Without any styling, that content renders as an undifferentiated wall of same-sized, unstyled text — headings don't look like headings, lists have no bullets, blockquotes have no visual distinction.

## The `@tailwindcss/typography` Plugin

This official plugin solves exactly that problem. It adds a single `prose` class that applies a complete, polished typographic treatment to all the raw HTML elements nested inside it — headings, paragraphs, lists, blockquotes, code blocks, tables — without you touching the individual tags at all.

Install it:

```bash
npm install -D @tailwindcss/typography
```

```css
/* your CSS entry point */
@import "tailwindcss";
@plugin "@tailwindcss/typography";
```

```html
<article class="prose">
  <h1>Article Title</h1>
  <p>This paragraph is automatically styled with good line-height and spacing.</p>
  <ul>
    <li>List items get real bullets and spacing again</li>
    <li>Without you adding any classes to the &lt;li&gt; elements</li>
  </ul>
</article>
```

The plugin also ships size modifiers (`prose-sm`, `prose-lg`, `prose-xl`) and a dark-mode variant (`prose-invert`, used alongside Module 06's dark mode techniques), plus element-specific overrides (`prose-headings:text-gray-900`) for fine-tuning without abandoning the plugin's defaults entirely.

## Practical Example

A blog post page rendering Markdown-derived HTML with the typography plugin, responsive sizing, and dark mode support:

```html
<article class="prose prose-lg dark:prose-invert mx-auto">
  <!-- raw HTML from a Markdown renderer or CMS goes here, completely unstyled by you -->
</article>
```

## Summary
List utilities (`list-disc`, `list-decimal`, `list-inside`/`outside`) style lists you build yourself. For raw, uncontrolled HTML content (Markdown output, CMS fields), Preflight's reset becomes a liability rather than a feature — the official `@tailwindcss/typography` plugin solves this with a single `prose` class that styles every nested element automatically.

## Revision Questions

<details>
<summary>1. Why does Preflight's list-style reset become a problem specifically for Markdown-rendered or CMS content?</summary>

That content is raw HTML you don't individually control — you can't add utility classes to each heading or list item a content editor creates — so Preflight's stripped-down defaults leave it completely unstyled, with no way to style it element-by-element.
</details>

<details>
<summary>2. What does the `prose` class do, and what CSS mechanism makes it work on content you don't directly control?</summary>

It applies a complete typographic treatment (sizing, spacing, color) to every nested HTML element inside it, using descendant CSS selectors that target raw tags like `h1`, `p`, and `ul` — so it styles the content without needing individual utility classes on each element.
</details>

<details>
<summary>3. How would you make a `prose`-styled article look correct in dark mode?</summary>

Add the `prose-invert` modifier alongside a dark mode variant, e.g. `dark:prose-invert`, which flips the plugin's text and background colors appropriately for a dark theme.
</details>
