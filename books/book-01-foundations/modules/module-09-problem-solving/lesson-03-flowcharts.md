cat > lesson-03-flowcharts.md << 'EOF'
# Lesson 03: Flowcharts

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a flowchart is and when it's useful.
- Identify standard flowchart symbols and their meanings.
- Draw a simple flowchart representing a basic algorithm.

---

# Introduction

Logic and algorithms are often easier to plan visually before writing them out in words or code. A **flowchart** is a diagram that represents an algorithm's logic using standardized shapes and arrows — a tool that's been used in computing (and general process design) for decades, and still shows up regularly in technical interviews and system design discussions.

---

# Standard Flowchart Symbols

| Symbol | Shape | Meaning |
|---|---|---|
| Oval | Rounded | Start / End |
| Rectangle | Rectangle | A process or action step |
| Diamond | Diamond | A decision point (yes/no, true/false) |
| Parallelogram | Parallelogram | Input or output |
| Arrow | Line with arrowhead | Flow direction between steps |

---

# A Simple Flowchart Example

**Problem:** "Determine if a number is even or odd."

┌───────┐
    │ Start │
    └───┬───┘
        ▼

┌─────────────────┐
│ Input: a number │
└────────┬─────────┘
▼
◇ Is number % 2 == 0? ◇
│ │
Yes│ │No
▼ ▼
┌───────────┐ ┌───────────┐
│ Print │ │ Print │
│ "Even" │ │ "Odd" │
└─────┬──────┘ └─────┬──────┘
└────────┬───────┘
▼
┌───────┐
│ End │
└───────┘


Notice the diamond shape represents the decision point — the exact moment the logic branches based on a condition, echoing the "selection" building block from Lesson 01.

---

# Why Flowcharts Are Useful

- **Planning before coding** — mapping out logic visually often reveals gaps or edge cases you'd miss writing code directly.
- **Communication** — a flowchart can explain a process to non-technical stakeholders far more clearly than code ever could.
- **Debugging complex logic** — visually tracing a flowchart can help identify exactly where flawed logic breaks down.

In practice, most working developers don't draw formal flowcharts for every piece of logic they write — but the *mental habit* of thinking in this structured, step-by-step visual way remains genuinely valuable, especially for more complex problems.

---

# Revision Questions

1. What shape represents a decision point in a flowchart?
2. What's the difference between a rectangle and a parallelogram in standard flowchart notation?
3. Name two practical benefits of using a flowchart before writing code.

<details><summary>Answers</summary>

1. A diamond.
2. A rectangle represents a process/action step; a parallelogram represents input or output.
3. Any two of: reveals gaps or edge cases before coding, communicates logic clearly to non-technical people, helps debug complex logic by visually tracing through it.

</details>
EOF