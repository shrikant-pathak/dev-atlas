# Module 02 — Inspecting & Undoing Changes

> **Book 07 — Git & GitHub** · 9 lessons · Estimated time: 7–9 hours

You can now make commits. This module teaches you to **look at** your history with precision, **stage** exactly what you mean, and **undo** almost anything, from a single bad edit to a lost branch.

---

## 🎯 Module Goals

By the end of this module you will be able to:

- Read, filter and format history with `git log`, revision syntax and ranges
- Compare any two states with `git diff` and `git show`, and use external diff tools
- Search code and history with `git grep`, the pickaxe (`-S`/`-G`), `git log -L` and `git blame`
- Stage partial changes with `git add -p` to build atomic commits
- Discard and unstage changes safely with `git restore`
- Fix the last commit with `--amend`
- Choose confidently between `reset`, `revert` and `restore`
- Recover lost commits, branches and stashes with the reflog
- Name commits with `describe`, summarize work with `shortlog` and annotate history with `notes`

---

## 📚 Lessons

| # | Lesson | What you'll learn |
|---|---|---|
| 01 | Log Formatting, Filtering and Revision Ranges | `git log` options, `--pretty`, `HEAD~2`, `A..B`, `A...B` |
| 02 | Diff, Show and External Diff Tools | What each diff compares, hunks, `git show`, `difftool` |
| 03 | Searching History: Grep, Pickaxe and Blame | `git grep`, `-S`, `-G`, `-L`, `git blame` |
| 04 | Interactive Staging | `git add -p`, splitting and editing hunks |
| 05 | Restore and Unstaging | `git restore`, `--staged`, `--source` |
| 06 | Amending Commits | `--amend`, the golden rule of history |
| 07 | Reset Demystified and Revert | Three reset modes, `git revert`, reverting merges |
| 08 | Reflog and Recovery | Recovering lost work, the recovery playbook |
| 09 | Describe, Shortlog and Notes | Version names, contributor stats, commit notes |

---

## 🧰 Prerequisites

- Module 01 complete: Git installed and configured, comfortable with `status`, `add`, `commit`
- A terminal and an editor
- Willingness to experiment: this module deliberately breaks things in practice repositories so you can fix them

> 💡 All practice happens in throwaway repositories under `~/git-practice`. Never experiment with destructive commands in a real project.

---

## 📦 Support Files in This Module

| File | Purpose |
|---|---|
| `cheatsheet.md` | One-page reference for inspecting, searching and undoing |
| `exercises.md` | Hands-on practice with solutions |
| `interview.md` | Common interview questions, including recovery scenarios |
| `quiz.md` | Multiple-choice self-check with an answer key |

---

## 🗺️ How to Work Through This Module

1. Build the practice repositories exactly as shown and run every command.
2. Predict the output **before** you press Enter. It is the fastest way to learn.
3. Do the checkpoint tasks and revision questions before reading the answers.
4. Finish with `exercises.md`, then `quiz.md`.
5. Rehearse `interview.md` out loud, especially the recovery scenarios.

---

## 🔑 Commands You Will Master

```bash
git log --oneline --graph --decorate --all
git log --author= --since= --grep= -S -G -L -- <path>
git diff / --staged / HEAD / A..B / A...B
git show <rev>:<path>
git difftool
git grep -n <text> [<rev>]
git blame -L -w -M -C
git add -p
git restore [--staged] [--source=<c>] <file>
git commit --amend [--no-edit]
git reset --soft | --mixed | --hard
git revert [-m 1] [-n] <commit>
git reflog
git describe --tags --always --dirty
git shortlog -sn
git notes add / show
```

---

## ✅ Self-Check Before Moving On

- [ ] I can explain `A..B` versus `A...B` and `HEAD~2` versus `HEAD^2`
- [ ] I can say exactly what `git diff`, `git diff --staged` and `git diff HEAD` compare
- [ ] I can find the commit that removed a function and who last changed a line
- [ ] I can split one messy file into several clean commits
- [ ] I can state when to use `restore`, `reset` and `revert`
- [ ] I can recover a commit after `reset --hard`

➡️ **Next:** Module 03 — Branching & Merging
