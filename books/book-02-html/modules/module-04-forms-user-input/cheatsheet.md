# 📄 Cheat Sheet — Forms & User Input

## Form Structure

```html
<form action="/submit" method="POST" enctype="multipart/form-data">
```

| Method | Use For |
|---|---|
| GET | Search, filters, non-sensitive, shareable |
| POST | Login, signup, payments, anything sensitive |

## Input Types

```html
<input type="text">      <input type="email">
<input type="password">  <input type="number" min max>
<input type="tel">       <input type="url">
<input type="date">      <input type="time">
<input type="checkbox">  <input type="radio" name="group">
<input type="file" accept="..." multiple>
<input type="range">     <input type="color">
<input type="hidden">
```

## Labels

```html
<label for="id-match">Text</label>
<input id="id-match" ...>

<!-- OR wrap directly -->
<label>Text <input ...></label>
```
**Never** rely on `placeholder` alone as a label.

## Fieldset

```html
<fieldset>
  <legend>Group Title</legend>
  ...
</fieldset>
```

## Buttons

```html
<button type="submit">...</button>   <!-- default if type omitted! -->
<button type="reset">...</button>
<button type="button">...</button>   <!-- for JS-only actions -->
```

## Select / Textarea / Datalist

```html
<select name="x">
  <option value="a">A</option>
</select>

<textarea name="x" rows="4"></textarea>

<input list="opts">
<datalist id="opts">
  <option value="Suggestion 1">
</datalist>
```

## Validation Attributes

```html
required
minlength="3" maxlength="20"
min="0" max="120"
pattern="[0-9]{5}"
```

⚠️ Client-side validation is UX only — **always** validate again on the server.
