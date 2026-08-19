# Lesson 01: Logic Building

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what "logic building" means in a programming context.
- Break a problem down into smaller, sequential steps.
- Recognize common logical building blocks used in nearly all programs.

---

# Introduction

This final module of Book 01 shifts focus away from tools and infrastructure, and toward something more fundamental: how to actually *think* like a programmer. Every language and framework you'll learn later builds on this same underlying skill — breaking a problem into precise, logical steps a computer can follow.

---

# What Is Logic Building?

**Logic building** is the process of breaking a real-world problem into a clear, ordered sequence of steps that a computer can execute unambiguously. Computers are extremely literal — they only do exactly what they're told, in exactly the order they're told it. Logic building is the skill of translating fuzzy human intent ("sort these names alphabetically") into that precise, step-by-step form.

---

# Core Logical Building Blocks

Nearly every program, regardless of language, is built from combinations of just a few fundamental patterns:

- **Sequence** — steps executed one after another, in order.
- **Selection (conditionals)** — choosing between different paths based on a condition ("if this, then that; otherwise, this other thing").
- **Iteration (loops)** — repeating a set of steps multiple times, until some condition is met.

Every program you'll ever write, no matter how complex, is ultimately built from these three patterns combined in different ways.

---

# A Worked Example (Language-Agnostic)

**Problem:** "Given a list of exam scores, determine how many students passed (score ≥ 60)."

Breaking this down using the three building blocks:

1. **Sequence:** Start with a counter set to 0.
2. **Iteration:** For each score in the list...
3. **Selection:** ...check if the score is 60 or higher.
   - If yes, increase the counter by 1.
   - If no, move to the next score.
4. **Sequence:** After checking every score, report the final counter value.

Notice this description contains zero actual code — it's pure logic. This is deliberate: logic building is a skill that exists *before* and *independent of* any specific programming language.

---

# Why This Matters Before Learning to Code

A common mistake beginners make is jumping straight into syntax without first being able to clearly articulate the *logic* of what they want to happen. If you can't explain the steps in plain English (or pseudocode, covered later in this module), you'll struggle to write correct code — not because of syntax, but because the underlying logic was never fully worked out.

---

# Revision Questions

1. What are the three fundamental logical building blocks used in nearly all programs?
2. Why is logic building considered independent of any specific programming language?
3. In the worked example, which building block is responsible for checking "is this score ≥ 60"?

<details><summary>Answers</summary>

1. Sequence, selection (conditionals), and iteration (loops).
2. Because it describes the *steps and structure* of solving a problem, which can then be translated into any programming language's specific syntax — the underlying logic doesn't change based on language.
3. Selection (a conditional check).

</details>
