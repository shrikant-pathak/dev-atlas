cat > lesson-04-commit.md << 'EOF'
# Lesson 04: Commit

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a commit actually represents.
- Understand the staging area and why it exists as a separate step.
- Write clear, conventional commit messages.

---

# Introduction

You've made dozens of commits throughout this roadmap already. This lesson slows down to explain precisely what a commit is doing under the hood, and how to write commits that are actually useful to your future self and collaborators.

---

# What Is a Commit?

A **commit** is a saved snapshot of your project's files at a specific point in time, along with metadata: who made it, when, and a message describing what changed. Commits form a chronological chain, each one pointing back to its parent commit — this chain is your project's entire history.

```bash
git log --oneline     # view the chain of commits
```

---

# The Staging Area: Why It Exists

Git's commit process has three distinct areas:

Working Directory → Staging Area → Repository (committed)
(your files) (git add) (git commit)

- **Working directory** — your actual files, as they currently exist on disk.
- **Staging area** (also called the "index") — a preparation zone where you choose exactly which changes will go into the *next* commit.
- **Repository** — the permanent, committed history.

The staging area exists so you can build a commit deliberately — even if you've changed 5 files, you can choose to commit only 2 of them together as one logical change, leaving the other 3 for a separate commit.

```bash
git add file1.js file2.js     # stage only specific files
git add .                       # stage everything changed
git status                        # see what's staged vs. not
git commit -m "message"             # commit whatever is currently staged
```

---

# Writing Good Commit Messages

A well-written commit message is short, clear, and describes *what* changed and often *why*:

**Good:**

Add user authentication middleware
Fix off-by-one error in pagination logic
Update README with deployment instructionsAdd user authentication middleware
Fix off-by-one error in pagination logic
Update README with deployment instructions

**Poor:**

fix stuff
updates
asdf

A common convention (used widely across the industry) is starting with an imperative verb: "Add," "Fix," "Update," "Remove" — as if completing the sentence "This commit will ___."

---

# Viewing and Amending Commits

```bash
git log                     # full commit history with details
git log --oneline            # condensed, one line per commit
git show <commit-hash>        # view exactly what changed in a specific commit
git commit --amend             # edit the most recent commit's message or content
```

---

# Revision Questions

1. What is a commit, at its core?
2. Why does Git separate "staging" from "committing" instead of just committing all changes directly?
3. What makes a commit message "good" versus "poor"?

<details><summary>Answers</summary>

1. A saved snapshot of the project's files at a point in time, with metadata (author, date, message), linked to its parent commit to form a history chain.
2. It lets you deliberately choose exactly which changes belong together in a single logical commit, even when multiple unrelated files have been modified at once.
3. A good commit message is short, clear, and describes what changed (often starting with an imperative verb like "Add" or "Fix"); a poor one is vague and uninformative (e.g., "fix stuff").

</details>
EOF