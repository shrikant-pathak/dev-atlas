cat > lesson-01-git.md << 'EOF'
# Lesson 01: Git

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what Git is and the problem version control solves.
- Understand the basic concept of a Git repository and its history.
- Explain the difference between Git and GitHub.

---

# Introduction

You've been using Git commands throughout this entire roadmap already — `git add`, `git commit`, `git push`. This module finally slows down to build a genuine conceptual understanding of what's actually happening underneath those commands, rather than following them by memorized habit.

---

# What Is Git?

**Git** is a **distributed version control system** — software that tracks changes to files over time, letting you save snapshots of your work, revert to previous versions, and collaborate with others without overwriting each other's changes.

Created by Linus Torvalds (the same person behind the Linux kernel) in 2005, Git has become the standard version control tool across nearly the entire software industry.

---

# Why "Distributed"?

Unlike older centralized version control systems (where a single central server holds the only complete history), Git is **distributed** — every developer's local copy of a repository contains the *entire* project history, not just the current files. This means:
- You can view history, create branches, and make commits entirely offline.
- There's no single point of failure — if a central server goes down, any developer's local copy can restore the full history.

---

# What Problem Does Version Control Solve?

Without version control, collaborating on code (or even just working solo across time) creates real problems:
- "final_v2_ACTUALLY_final.js" style file naming chaos
- No way to see what changed, when, or why
- No way to safely experiment without risking breaking working code
- No way to merge multiple people's changes without manually comparing files

Git solves all of these with a structured system of **commits** (snapshots), **branches** (parallel lines of work), and **merges** (combining work back together) — each covered in depth later in this module.

---

# Git vs. GitHub — A Critical Distinction

This is one of the most common points of confusion for beginners:

- **Git** is the version control *software* itself — it runs entirely on your own computer and works with zero internet connection.
- **GitHub** is a *website/service* that hosts Git repositories remotely, adding collaboration features like pull requests, issues, and project management on top of Git.

You could use Git your entire career without ever touching GitHub. GitHub is simply the most popular *place* to host and share Git repositories — other alternatives exist too (GitLab, Bitbucket), all built on top of the same underlying Git software.

---

# Installing and Checking Git

```bash
git --version         # check if Git is installed and which version
git config --global user.name "Your Name"     # set your identity for commits
git config --global user.email "you@example.com"
```

---

# Revision Questions

1. What does it mean for Git to be a "distributed" version control system?
2. What's the fundamental difference between Git and GitHub?
3. Name two problems version control solves compared to manually managing file versions.

<details><summary>Answers</summary>

1. Every developer's local copy contains the entire project history, not just current files — there's no single central point holding the only complete record.
2. Git is the version control software itself, running locally; GitHub is a separate website/service that hosts Git repositories remotely and adds collaboration features.
3. Any two of: avoids messy manual file naming for versions, tracks exactly what changed and when, allows safe experimentation via branches, enables structured merging of multiple people's changes.

</details>
EOF