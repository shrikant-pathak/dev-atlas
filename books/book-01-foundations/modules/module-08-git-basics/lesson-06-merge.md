cat > lesson-06-merge.md << 'EOF'
# Lesson 06: Merge

## Learning Objectives
By the end of this lesson, you will be able to:
- Explain what merging does and how it combines branch histories.
- Identify the difference between a fast-forward merge and a three-way merge.
- Understand what a merge conflict is and how to resolve one.

---

# Introduction

Branches let you work independently, but eventually that work needs to come back together into the main line of development. **Merging** is the process of combining changes from one branch into another — and understanding it fully means understanding what happens when two branches have conflicting changes.

---

# What Is a Merge?

Merging takes the changes made on one branch and integrates them into another (typically merging a feature branch back into `main`).

```bash
git checkout main            # switch to the branch you want to merge INTO
git merge feature/navbar       # merge feature/navbar's changes into main
```

---

# Fast-Forward vs. Three-Way Merge

**Fast-forward merge** — happens when the target branch (`main`) hasn't changed at all since the feature branch was created. Git simply moves the `main` pointer forward to match the feature branch's latest commit — no new "merge commit" is created, since there's nothing to actually combine.

**Three-way merge** — happens when both branches have diverged (both have new commits since they split). Git looks at the common ancestor commit and both branches' latest commits, then creates a new **merge commit** combining both histories.

Fast-forward: Three-way merge:
main: A---B main: A---B-------M
\ \ /
feature: C---D feature: C---D

---

# Merge Conflicts

A **merge conflict** occurs when Git cannot automatically combine changes — typically because both branches modified the *same lines* of the *same file* in different ways. Git pauses the merge and marks the conflicting sections directly in the file:

<<<<<<< HEAD
This is the version from main

This is the version from feature/navbar

feature/navbar

**Resolving a conflict:**
1. Open the conflicting file(s) and manually decide what the final content should be.
2. Remove the conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) entirely.
3. Stage the resolved file(s): `git add <filename>`
4. Complete the merge: `git commit`

Merge conflicts can feel intimidating at first, but they're a completely normal, expected part of collaborative development — not a sign something went wrong.

---

# Practical Example

```bash
git checkout main
git merge feature/dark-mode
# If a conflict occurs:
#   1. Open the flagged file(s), resolve manually
#   2. git add <resolved-file>
#   3. git commit
```

---

# Revision Questions

1. What's the difference between a fast-forward merge and a three-way merge?
2. What causes a merge conflict?
3. What are the general steps to resolve a merge conflict?

<details><summary>Answers</summary>

1. A fast-forward merge simply moves the branch pointer forward with no new commit needed (target branch hasn't changed); a three-way merge creates a new merge commit combining two branches that have both diverged with new commits.
2. Both branches modifying the same lines of the same file in different, incompatible ways.
3. Open the conflicting file(s), manually resolve the conflicting sections, remove the conflict markers, stage the resolved file(s) with `git add`, then complete the merge with `git commit`.

</details>
EOF