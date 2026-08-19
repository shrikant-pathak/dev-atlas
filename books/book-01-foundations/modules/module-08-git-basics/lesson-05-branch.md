# Lesson 05: Branch

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what a branch is and why it's one of Git's most powerful features.
- Create, switch between, and delete branches.
- Understand common branching conventions used in real projects.

---

# Introduction

So far, every commit you've made throughout this roadmap has gone onto a single line of history — the `main` branch. **Branching** is what lets Git support real collaborative and experimental workflows, allowing multiple parallel lines of development to exist simultaneously.

---

# What Is a Branch?

A **branch** is simply a movable pointer to a specific commit, representing an independent line of development. When you create a new branch, you're essentially saying "I want to try something here, without affecting the main line of work."

Every Git repository starts with a default branch (traditionally called `master`, though `main` is now the common convention, including on GitHub).

---

# Why Branching Matters

Without branches, everyone would need to work directly on the same single line of history — meaning half-finished, experimental, or broken work would constantly sit alongside stable, working code. Branches let you:
- Work on a new feature without affecting the stable `main` branch
- Experiment freely, and simply delete the branch if the experiment doesn't work out
- Let multiple people work on different features simultaneously without interfering with each other

---

# Core Branch Commands

```bash
git branch                      # list all local branches
git branch feature/navbar        # create a new branch (doesn't switch to it)
git checkout feature/navbar       # switch to a branch
git checkout -b feature/navbar     # create AND switch to a new branch in one step
git branch -d feature/navbar        # delete a branch (only if already merged)
git branch -D feature/navbar         # force-delete a branch, even if unmerged
```

Newer Git versions also support `git switch` as a clearer alternative to `checkout` specifically for changing branches:
```bash
git switch feature/navbar
git switch -c feature/navbar     # create and switch, equivalent to checkout -b
```

---

# Common Branch Naming Conventions

While not enforced by Git itself, most teams follow conventions like:

feature/user-authentication
fix/navbar-alignment-bug
chore/update-dependencies
docs/api-documentation

This makes it immediately clear what kind of work a branch represents, especially useful once a repository has many branches in progress at once.

---

# Practical Example

```bash
git checkout -b feature/dark-mode     # create and switch to a new branch
# ...make changes, commit them...
git checkout main                       # switch back to main
git branch                                # confirm you're back on main, feature branch still exists
```

---

# Revision Questions

1. What is a branch, technically speaking?
2. Why does branching matter for collaboration and experimentation?
3. What's the difference between `git checkout -b` and `git checkout` (without `-b`)?

<details><summary>Answers</summary>

1. A movable pointer to a specific commit, representing an independent line of development.
2. It lets developers work on new features or experiments without affecting the stable main line of code, and lets multiple people work in parallel without interfering with each other.
3. `git checkout -b` creates a brand-new branch and switches to it in one step; `git checkout` (without `-b`) switches to an already-existing branch.

</details>
