cat > lesson-05-debugging.md << 'EOF'
# Lesson 05: Debugging

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what debugging is and why it's a core, expected part of programming.
- Apply a systematic approach to finding and fixing bugs.
- Use basic debugging techniques, including print debugging and browser DevTools.

---

# Introduction

This final lesson of Book 01 covers **debugging** — the process of finding and fixing errors in code. No matter how skilled you become, you will write bugs constantly; debugging isn't a sign of failure, it's simply the other half of programming, and building a systematic approach to it now will save enormous frustration later.

---

# What Is a Bug?

A **bug** is an error in a program that causes it to behave incorrectly — producing wrong output, crashing, or simply not doing what was intended. Bugs generally fall into a few categories:

- **Syntax errors** — code that violates the language's grammar rules (a missing bracket, a typo in a keyword); these are usually caught immediately before the code even runs.
- **Runtime errors** — code that's syntactically valid but fails while actually executing (e.g., trying to divide by zero, calling a function on something that doesn't exist).
- **Logic errors** — code that runs without crashing but produces the wrong result, because the underlying logic itself was flawed. These are often the hardest to find, since there's no error message pointing you to the problem.

---

# A Systematic Debugging Approach

1. **Reproduce the bug reliably** — figure out the exact steps that trigger it consistently. An intermittent bug you can't reproduce is very hard to fix.
2. **Read any error messages carefully** — they often point directly to the file and line number where the problem occurred.
3. **Form a hypothesis** — based on the symptoms, guess what might be causing the issue.
4. **Isolate the problem** — narrow down exactly which part of the code is responsible, often by testing smaller pieces individually.
5. **Fix and verify** — make the change, then confirm the bug is actually resolved (and that you haven't introduced a new one).

---

# Practical Debugging Techniques

- **Print debugging** — inserting `console.log()` (or equivalent) statements at key points to inspect variable values as the program runs. Simple, but genuinely effective and widely used, even by experienced developers.
- **Using breakpoints** — as covered in Module 06's DevTools lesson, pausing code execution at a specific line to inspect the program's exact state at that moment, rather than guessing from printed output alone.
- **Rubber duck debugging** — explaining your code line by line, out loud, to another person (or literally a rubber duck) — the act of articulating your logic often reveals the flaw yourself, before anyone else even responds.
- **Reading the stack trace** — when an error occurs, the "stack trace" shows the chain of function calls that led to the error, often revealing exactly where things went wrong.

---

# A Worked Example

**Bug report:** "My function to calculate an average always returns 0."

```javascript
function average(numbers) {
  let sum = 0;
  for (let i = 0; i < numbers.length; i++) {
    sum = numbers[i]; // bug: should be sum += numbers[i]
  }
  return sum / numbers.length;
}
```

**Debugging process:**
1. Reproduce: call `average([2, 4, 6])`, confirm it returns an unexpected result.
2. Add a `console.log(sum)` inside the loop to watch its value at each iteration.
3. Notice `sum` is being *overwritten* each time instead of *accumulated*.
4. Fix: change `sum = numbers[i]` to `sum += numbers[i]`.
5. Verify: re-run and confirm the correct average is now returned.

---

# Revision Questions

1. What's the difference between a syntax error and a logic error?
2. Why is "reproduce the bug reliably" often the first step in systematic debugging?
3. What is "rubber duck debugging," and why does it actually work?

<details><summary>Answers</summary>

1. A syntax error violates the language's grammar rules and is usually caught before the code runs; a logic error runs without crashing but produces incorrect results due to flawed reasoning in the code itself.
2. Because if you can't reliably trigger the bug, you can't reliably confirm whether a proposed fix actually resolved it.
3. Explaining your code out loud, step by step, to another person or object — it works because articulating your logic often forces you to notice inconsistencies or flawed assumptions you'd otherwise skip over while reading silently.

</details>

---

# 🏁 Module 09 Checkpoint

Before considering Book 01 complete, you should be able to:
- [ ] Break a problem into sequence, selection, and iteration
- [ ] Explain what makes a good algorithm, and compare two approaches to the same problem
- [ ] Read and draw a basic flowchart
- [ ] Write pseudocode for a simple algorithm and translate it toward real code
- [ ] Apply a systematic approach to debugging, using at least two practical techniques

**🎉 This completes Book 01 — Foundations.**
**Next up:** Book 02 — HTML
EOF