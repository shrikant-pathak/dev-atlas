# 📄 Cheat Sheet — Selectors & Combinators

## Pseudo-classes

```css
:hover  :active  :focus  :disabled  :checked
:first-child  :last-child  :only-child
:nth-child(3)  :nth-child(odd)  :nth-child(even)  :nth-child(3n+1)
:not(.selector)
```

## Pseudo-elements

```css
::before { content: "text"; }
::after { content: ""; }
::first-line
::first-letter
::selection
```
`content` is required for `::before`/`::after` to render anything.

## Attribute Selectors

```css
[required]                /* has the attribute */
[type="email"]              /* exact value */
[href^="http"]                /* starts with */
[href$=".pdf"]                  /* ends with */
[href*="example"]                 /* contains */
[class~="badge"]                    /* contains word */
[href$=".PDF" i]                      /* case-insensitive */
```

## Combinators

| Symbol | Name | Selects |
|---|---|---|
| (space) | Descendant | Any nested depth |
| `>` | Child | Direct children only |
| `+` | Adjacent sibling | Immediately next sibling |
| `~` | General sibling | All following siblings |

## Specificity Weights (recap)

| Type | Weight |
|---|---|
| Inline | 1000 |
| ID | 100 |
| Class / attribute / pseudo-class | 10 |
| Element / pseudo-element | 1 |
| Combinators, `*` | 0 |

⚠️ `:not(.x)` itself = 0, but `.x` inside still counts (10).

## Link State Order ("LoVe HAte")

```css
a:link { }
a:visited { }
a:hover { }
a:active { }
```

## !important

```css
color: red !important; /* overrides ANY specificity — use sparingly */
```
