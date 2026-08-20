# Lesson 02: CSS Syntax

## Learning Objectives
By the end of this lesson, you will be able to:
- Correctly read and write CSS rule syntax.
- Identify selectors, declarations, properties, and values.
- Avoid the most common beginner syntax mistakes.

---

# Introduction

Lesson 01 showed CSS syntax without naming its parts precisely. This lesson does exactly that — the same precision exercise Book 02, Module 01 did for HTML's tags/elements/attributes vocabulary.

---

# Anatomy of a CSS Rule

```css
p {
  color: blue;
  font-size: 16px;
}
```

- **Selector** (`p`) — targets which element(s) this rule applies to.
- **Declaration block** (`{ ... }`) — everything between the curly braces.
- **Declaration** (`color: blue;`) — one single style rule, made of a property and a value.
- **Property** (`color`) — *what aspect* you're styling.
- **Value** (`blue`) — *how* you're styling it.

A declaration block can (and usually does) contain multiple declarations, each ending in a semicolon:

```css
p {
  color: blue;
  font-size: 16px;
  margin-top: 10px;
}
```

---

# Syntax Rules Worth Internalizing

- **Every declaration ends with a semicolon** (`;`) — technically the very last one in a block can be omitted, but always including it is safer and the universal convention (avoids bugs when you later add another declaration below it).
- **Property and value are separated by a colon** (`:`), never an equals sign — a common mistake for anyone coming from other languages.
- **Whitespace and line breaks are flexible** — CSS doesn't care about extra spaces or how you break lines, similar to HTML's whitespace collapsing (Book 02, Module 02). Formatting is for human readability, not required syntax.

```css
/* All of these are functionally identical */
p { color: blue; font-size: 16px; }

p {
  color: blue;
  font-size: 16px;
}

p
{
    color:    blue;
    font-size:16px;
}
```

The middle format (one declaration per line, consistent indentation) is the near-universal convention — you'll formalize this in Module 13's style guide lesson, but start building the habit now.

---

# Common Syntax Mistakes

```css
/* Wrong: missing semicolon breaks the NEXT declaration */
p {
  color: blue
  font-size: 16px;
}

/* Wrong: equals sign instead of colon */
p {
  color = blue;
}

/* Wrong: missing closing brace */
p {
  color: blue;
```

CSS, like HTML, is often forgiving of some errors — but a missing semicolon between two declarations will genuinely break the second one silently, since the browser can't tell where one declaration ends and the next begins. This is exactly the kind of "browser silently handles it wrong" scenario that made HTML validation important (Book 02, Module 08) — the same caution applies here.

---

# Multiple Selectors, One Rule

You can apply the same declarations to multiple selectors at once, comma-separated:

```css
h1, h2, h3 {
  font-family: Arial, sans-serif;
  color: darkblue;
}
```

This is genuinely useful for avoiding repetition — you'll use this pattern constantly once real projects have many related elements needing shared styling.

---

# Practical Example

```css
h1 {
  color: navy;
  font-size: 32px;
}

p, li {
  color: #333333;
  line-height: 1.5;
}

a {
  color: teal;
  text-decoration: none;
}
```

---

# Revision Questions

1. What are the four named parts of a CSS rule, from outermost to innermost?
2. What character separates a property from its value, and what's a common mistake beginners make here?
3. Why might a missing semicolon cause a bug that's hard to spot?

<details><summary>Answers</summary>

1. Selector, declaration block, declaration, and within a declaration: property and value.
2. A colon (`:`); a common mistake is using an equals sign (`=`) instead, likely from experience with other programming languages.
3. Because the browser can't tell where one declaration ends and the next begins, silently merging or breaking the following declaration without any obvious error message.

</details>
