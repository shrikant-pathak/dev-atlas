# Lesson 07 — Commit Messages and Conventional Commits

> **Module 01 — Git Fundamentals & Setup** · Book 07 — Git & GitHub

## 🎯 Learning Objectives

By the end of this lesson you will be able to:

- Write a clear commit message using subject, body and footer
- Apply the 50/72 convention and the imperative mood
- Create **atomic** commits that each do one thing
- Use common trailers such as `Co-authored-by` and `Signed-off-by`
- Write messages in the **Conventional Commits** format and explain how it drives versioning and changelogs

---

## 📖 Introduction

A commit's code tells you **what** changed. Only its message can tell you **why**. Six months from now, `git log` is the only documentation many changes will ever have. Compare:

```
fix stuff
```

Fix cart total ignoring discount on empty-quantity items


The second one lets a teammate (or future you) understand the change without opening the diff. Good messages also power tooling: automatic changelogs, version bumps and release notes.

---

## 1. Anatomy of a Commit Message
Subject line: short summary of the change ← 1 line, ≤ 50 characters

Body: explain WHAT changed and WHY, not how. ← optional, wrap at 72 characters
The code already shows how. Mention side
effects, trade-offs or the problem solved.

Footer: Fixes #123 ← optional trailers
Co-authored-by: Name name@example.com


The **blank line** between subject and body is required. Git tools treat the first line as the title.

### The 50/72 convention

| Part | Guideline |
|---|---|
| Subject | About **50 characters** (hard cap ~72) so it fits in `git log --oneline` and GitHub lists |
| Body | Wrap at **72 characters** |
| Subject ending | No trailing period |

---

## 2. Write in the Imperative Mood

Write the subject as a **command**, as if completing the sentence *"If applied, this commit will ___."*

| ❌ Avoid | ✅ Prefer |
|---|---|
| Added login page | Add login page |
| Fixes bug in cart | Fix cart total calculation |
| Updating dependencies | Update dependencies |

It matches Git's own messages (`Merge branch ...`, `Revert "..."`) and keeps history consistent.

---

## 3. Explain Why, Not Just What
Retry failed uploads up to three times

Mobile users on flaky connections lost uploads after a single
timeout. Retrying with a short delay recovers most of these
failures. The limit of three prevents hammering the server.


Good bodies answer: *What was the problem? Why this solution? Anything surprising?*

---

## 4. Atomic Commits

An **atomic commit** contains **one logical change**, the smallest piece that makes sense on its own and keeps the project working.

| ❌ Not atomic | ✅ Atomic |
|---|---|
| "Fix bug, reformat all files, update README" | Three separate commits |
| One giant "Work in progress" at the end of the day | One commit per finished idea |

Why it matters:

- **Review** is easier: each commit tells one story.
- **Reverting** one change does not disturb others (`git revert`, Module 02).
- **Debugging** with `git bisect` (Module 06) lands on a precise culprit.

This is where the **staging area** (Lesson 02) earns its keep. Stage related changes together, commit, then stage the next group.

---

## 5. Trailers (Footer Metadata)

Trailers are `Key: value` lines at the very end of a message.

| Trailer | Purpose |
|---|---|
| `Fixes #123` / `Closes #123` | GitHub closes issue 123 when the work lands (Module 05) |
| `Co-authored-by: Name <email>` | Credits another author; GitHub shows both people |
| `Signed-off-by: Name <email>` | A "Developer Certificate of Origin" sign-off, added with `git commit -s` |
| `Reviewed-by:` / `Reported-by:` | Common in open-source projects |

---

## 6. Message Templates

You can pre-fill the editor with reminders:

```bash
# ~/.gitmessage
# Subject (≤ 50 chars, imperative)
#
# Why is this change needed?
#
# Fixes #

git config --global commit.template ~/.gitmessage
```

---

## 7. Conventional Commits

**Conventional Commits** is a lightweight convention that gives messages a predictable structure, which both humans and tools can read.

<type>[optional scope][!]: <description>

[optional body]

[optional footer(s)]


Examples:
feat(auth): add Google sign-in
fix(cart): prevent negative quantities
docs: explain local setup in README
refactor(api): extract request retry helper
feat!: drop support for Node 18

BREAKING CHANGE: the minimum supported Node version is now 20.


### Common types

| Type | Use for |
|---|---|
| `feat` | A new feature |
| `fix` | A bug fix |
| `docs` | Documentation only |
| `style` | Formatting (no logic change) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf` | Performance improvement |
| `test` | Adding or fixing tests |
| `build` | Build system or dependencies |
| `ci` | CI configuration |
| `chore` | Maintenance that does not touch src/tests |
| `revert` | Reverting an earlier commit |

### Link to Semantic Versioning

Conventional Commits maps directly onto **SemVer** (`MAJOR.MINOR.PATCH`, Module 03):

| Commit | Version bump |
|---|---|
| `fix:` | **PATCH** (1.4.2 → 1.4.3) |
| `feat:` | **MINOR** (1.4.2 → 1.5.0) |
| `!` or `BREAKING CHANGE:` | **MAJOR** (1.4.2 → 2.0.0) |

Because the message is machine-readable, tools can **automatically choose the next version and generate a changelog**. Later you will meet **commitlint** and **Husky** (Module 08) to enforce the format, and **semantic-release** and **Changesets** (Module 15) to automate releases. These are the same tools used across the JavaScript ecosystem you already work in.

### Is it mandatory?

No. Many teams use it, many do not. What *is* universal is the underlying habit: **a clear, consistent, meaningful message.** Follow your team's convention.

---

## 8. A Quick Readability Test

Run:

```bash
git log --oneline
```

If you can understand the project's story from that list alone, your messages are doing their job.

---

## 🛠️ Practical Example — Fix These Messages

Rewrite each message so it is clear and imperative. Then write the Conventional Commits version.

| # | Bad message |
|---|---|
| 1 | `stuff` |
| 2 | `Fixed the bug` |
| 3 | `Updated css, also changed the navbar and fixed login and renamed files` |
| 4 | `Adding new dark mode toggle button.` |
| 5 | `WIP` |

<details>
<summary>Show a sample solution</summary>

1. Needs a real subject, e.g. `Add footer links to homepage` → `feat(home): add footer links`
2. `Fix crash when cart is empty` → `fix(cart): prevent crash on empty cart`
3. Not atomic. Split into separate commits: `Restyle buttons` (`style:`), `Add mobile navbar toggle` (`feat(nav):`), `Fix login redirect loop` (`fix(auth):`), `Rename components folder` (`refactor:`)
4. `Add dark mode toggle button` (no period, imperative) → `feat(ui): add dark mode toggle`
5. Describe the actual state, or squash it before sharing (Module 06)
</details>

Now do it for real in `my-site`:

```bash
echo "footer { padding: 1rem; }" >> styles.css
git add styles.css
git commit
```

In the editor write a subject, a blank line and a body explaining why. Then check:

```bash
git log
```

---

## 📝 Revision Questions

**1. What are the parts of a commit message?**

<details>
<summary>Show answer</summary>

A subject line, a blank line, an optional body explaining what and why, and optional footer trailers.
</details>

**2. What is the 50/72 rule?**

<details>
<summary>Show answer</summary>

Keep the subject to about 50 characters and wrap body lines at 72 characters so messages read well in terminals and Git tools.
</details>

**3. What is an atomic commit, and why does it help?**

<details>
<summary>Show answer</summary>

A commit containing a single logical change. It makes review, reverting and bisecting precise and keeps history readable.
</details>

**4. In Conventional Commits, which message types trigger MINOR and MAJOR version bumps?**

<details>
<summary>Show answer</summary>

`feat` triggers a MINOR bump. A `!` after the type, or a `BREAKING CHANGE:` footer, triggers a MAJOR bump. `fix` triggers a PATCH bump.
</details>

**5. What does `Co-authored-by` do?**

<details>
<summary>Show answer</summary>

It's a trailer that credits another person for the commit. GitHub then shows both people as authors.
</details>

---

➡️ **Next:** Lesson 08 — `.gitignore` and Global Ignore
