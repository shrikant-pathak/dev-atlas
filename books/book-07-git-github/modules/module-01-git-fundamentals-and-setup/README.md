# Module 01 — Git Fundamentals & Setup

> **Book 07 — Git & GitHub** · 8 lessons · Estimated time: 5–7 hours

Welcome to the start of your Git journey. This module builds the mental model and the daily habits you will use for the rest of your career: how Git thinks, how to install and configure it, and how to record clean history.

---

## 🎯 Module Goals

By the end of this module you will be able to:

- Explain what version control is and why Git won
- Describe Git's snapshot model, the three states and the three areas
- Install and configure Git on Windows, macOS, Linux and WSL
- Create repositories and perform the core loop: `status → add → commit`
- Remove, move and clean files safely
- Write clear, atomic commit messages, optionally in Conventional Commits format
- Keep dependencies, build output and secrets out of your repository

---

## 📚 Lessons

| # | Lesson | What you'll learn |
|---|---|---|
| 01 | Version Control and Why Git | VCS generations, Git's origin, Git vs GitHub |
| 02 | Snapshots and the Three States | Snapshots, hashing, working tree / staging / repository |
| 03 | Installing Git on Windows, macOS, Linux and WSL | Installing, verifying, WSL pitfalls |
| 04 | First-Time Setup and Getting Help | `git config`, identity, defaults, `git help` |
| 05 | Init, Add, Commit and Status | The daily loop and your first repository |
| 06 | Removing, Moving and Cleaning Files | `rm`, `mv`, `clean`, `ls-files` |
| 07 | Commit Messages and Conventional Commits | Anatomy, 50/72, atomic commits, Conventional Commits |
| 08 | .gitignore and Global Ignore | Patterns, ignore layers, debugging |

---

## 🧰 Prerequisites

- Comfort with the terminal basics from earlier in the curriculum (navigating folders, creating and listing files)
- A code editor (VS Code recommended)
- A project folder from any previous book to practice on (optional)

---

## 📦 Support Files in This Module

| File | Purpose |
|---|---|
| `cheatsheet.md` | One-page command and concept reference |
| `exercises.md` | Hands-on practice with solutions |
| `interview.md` | Common interview questions with model answers |
| `quiz.md` | Multiple-choice self-check with an answer key |

---

## 🗺️ How to Work Through This Module

1. Read each lesson **with a terminal open** and run every command.
2. Do the **Practical Example** and the checkpoint tasks before moving on.
3. Answer the **Revision Questions** before opening the answers.
4. Finish with `exercises.md`, then `quiz.md`.
5. Use `interview.md` to rehearse explaining concepts out loud.

---

## 🔑 Commands You Will Master

```bash
git --version
git config --global user.name "Your Name"
git config --list --show-origin
git help <command>
git init -b main
git status -s
git add . / git add -A / git add -u
git commit -m "message"
git diff / git diff --staged
git log --oneline
git rm / git rm --cached
git mv
git clean -n
git ls-files
git check-ignore -v
```

---

## ✅ Self-Check Before Moving On

- [ ] I can explain the three states and the three areas without notes
- [ ] Git is installed and my name, email and defaults are configured
- [ ] I can create a repo and make several commits with good messages
- [ ] I know how to stop tracking a file I ignored too late
- [ ] I have a global ignore file and a sensible project `.gitignore`

➡️ **Next:** Module 02 — Inspecting & Undoing Changes
