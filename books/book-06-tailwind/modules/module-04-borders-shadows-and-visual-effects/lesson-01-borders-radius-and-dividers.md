# Lesson 01: Borders, Radius, and Dividers

## Learning Objectives
- Apply border width, color, and style utilities, including per-side control
- Round corners with `rounded-*`, including per-corner and logical variants
- Use `divide-*` to add borders between sibling elements without individual edge styling

## Introduction
Borders and rounded corners are foundational visual-design tools, used constantly for cards, inputs, badges, and dividers. This lesson covers Tailwind's border system in full, plus a sibling-spacing technique (`divide-*`) that mirrors Module 02's `space-x-*`/`space-y-*` pattern, but for borders instead of margin.

## Border Width and Color

```html
<div class="border border-gray-200 p-4">Default 1px border</div>
<div class="border-2 border-indigo-500 p-4">Thicker, colored border</div>
<div class="border-t-4 border-t-red-500 p-4">Top border only</div>
```

Recall from Module 01 that Preflight sets `border-width: 0` by default on every element — so `border` alone (implying `border-width: 1px`) is what actually makes a border visible; without any `border-*` width utility, a `border-red-500` color class has nothing to render against.

| Class | Effect |
|---|---|
| `border` | 1px all sides |
| `border-0`, `border-2`, `border-4`, `border-8` | specific widths, all sides |
| `border-t`/`r`/`b`/`l` (+ width suffix) | one side only |
| `border-{color}-{shade}` | uses the shared palette (Module 03) |

## Border Style

```html
<div class="border-2 border-dashed border-gray-300 p-4">Dashed</div>
```

`border-solid` (default), `border-dashed`, `border-dotted`, `border-double`, `border-none`.

## Rounded Corners

```html
<div class="rounded-lg">All corners rounded</div>
<div class="rounded-t-lg">Top corners only</div>
<div class="rounded-tl-lg">Top-left only</div>
<div class="rounded-full">Fully circular/pill-shaped</div>
```

The `rounded-*` scale: `rounded-none`, `rounded-sm`, `rounded` (default), `rounded-md`, `rounded-lg`, `rounded-xl`, `rounded-2xl`, `rounded-3xl`, `rounded-full` (practically a circle on a square element, or a pill shape on a rectangular one). Per-corner variants (`rounded-tl-*`, `rounded-tr-*`, `rounded-br-*`, `rounded-bl-*`) let you round only specific corners — common for a card whose top connects flush to a header bar.

For RTL-aware layouts, logical corner variants `rounded-s-*` (start side, both corners) and `rounded-e-*` (end side, both corners) automatically flip with text direction, following the same logical-property pattern as Module 02's `start-*`/`end-*`.

## Dividers Between Siblings: `divide-*`

Just as `space-x-*`/`space-y-*` (Module 02) add margin between siblings, `divide-x-*`/`divide-y-*` add a border between siblings — useful for a vertically stacked list or a horizontal button group where you want a visible separator line, not just spacing:

```html
<div class="divide-y divide-gray-200">
  <div class="p-4">Item 1</div>
  <div class="p-4">Item 2</div>
  <div class="p-4">Item 3</div>
</div>
```

This applies a top border to every child except the first, exactly mirroring how `space-y-*` applies margin — giving clean dividing lines without adding a separate `<hr>` element or manual per-item border classes. `divide-color` and `divide-dashed`/`divide-dotted` style the divider itself.

## Practical Example

A settings list using dividers, and a badge using `rounded-full`:

```html
<div class="divide-y divide-gray-200 rounded-lg border border-gray-200">
  <div class="flex items-center justify-between p-4">
    <span>Email notifications</span>
    <span class="rounded-full bg-green-100 px-3 py-1 text-xs font-medium text-green-800">
      On
    </span>
  </div>
  <div class="flex items-center justify-between p-4">
    <span>SMS notifications</span>
    <span class="rounded-full bg-gray-100 px-3 py-1 text-xs font-medium text-gray-600">
      Off
    </span>
  </div>
</div>
```

## Summary
Border utilities control width, color, and style, with per-side variants; since Preflight zeroes out `border-width` by default, a width utility is required for a color to render. `rounded-*` controls corner radius, including per-corner and RTL-aware logical (`rounded-s-*`/`rounded-e-*`) variants. `divide-x-*`/`divide-y-*` add borders between siblings, mirroring `space-x-*`/`space-y-*`'s margin-based approach from Module 02.

## Revision Questions

<details>
<summary>1. Why does `border-red-500` alone have no visible effect without an accompanying width utility like `border` or `border-2`?</summary>

Preflight sets `border-width: 0` by default on every element, so a color utility has no width to actually render against until a width utility (`border`, `border-2`, etc.) is also applied.
</details>

<details>
<summary>2. What's the advantage of `divide-y` over manually adding `border-b` to every item except the last in a list?</summary>

`divide-y` automatically applies the border to every child but the first (mirroring `space-y-*`'s behavior), adapting correctly if items are added or removed — no need to manually track which item is "last" and exclude it.
</details>

<details>
<summary>3. When would `rounded-s-*` be preferable to `rounded-l-*`?</summary>

In an app that supports right-to-left languages — `rounded-s-*` is a logical property that automatically flips which physical side (left or right) it rounds based on text direction, while `rounded-l-*` always rounds the literal left side regardless of direction.
</details>
