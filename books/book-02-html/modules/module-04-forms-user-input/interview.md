cat > interview.md << 'EOF'
# Interview Questions — Forms & User Input

## Beginner
- What's the difference between GET and POST form submission?
- Why is the `name` attribute required on form inputs?
- What's the difference between `<select>` and radio buttons?
- What does the `required` attribute do?

## Intermediate
- Why should `<button>` always have an explicit `type` attribute inside a form?
- What's the difference between using `for`/`id` and wrapping an input inside a `<label>`?
- What does `<fieldset>`/`<legend>` add that individual labels alone don't?
- What's the difference between `<select>` and `<input>` + `<datalist>`?

## Advanced
- Why is client-side (HTML) form validation not sufficient for security, and what must always accompany it?
- Explain why a login form should never use `method="GET"`.
- Walk through what happens, step by step, when a form with `enctype="multipart/form-data"` submits a file.
- Why does `placeholder` text not qualify as an accessible label?
EOF