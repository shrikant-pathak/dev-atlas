# Module 01 Interview Questions — Git Fundamentals & Setup

Practice answering these out loud. Difficulty: 🟢 Junior · 🟡 Mid · 🔴 Senior.

---

## 🟢 Junior

**1. What is version control and why use it?**

<details>
<summary>Show answer</summary>

Version control records changes to files over time so you can see history, revert mistakes, compare versions, work in parallel through branches, and collaborate safely. It replaces copying folders by hand.
</details>

**2. What is the difference between Git and GitHub?**

<details>
<summary>Show answer</summary>

Git is the open-source, distributed version control tool that runs locally. GitHub is a cloud platform that hosts Git repositories and adds collaboration features such as pull requests, issues and Actions. Other hosts (GitLab, Bitbucket) also host Git repositories.
</details>

**3. What does "distributed" mean?**

<details>
<summary>Show answer</summary>

Each developer has a full copy of the repository including its whole history. Most operations are local, any clone can act as a backup, and there is no single point of failure.
</details>

**4. What are the three areas in Git?**

<details>
<summary>Show answer</summary>

The working tree (your files), the staging area or index (what goes into the next commit) and the repository (`.git`, the stored history).
</details>

**5. What is the difference between `git add` and `git commit`?**

<details>
<summary>Show answer</summary>

`git add` stages changes into the index, selecting what the next commit will contain. `git commit` records the staged snapshot permanently in the repository with a message.
</details>

**6. How do you check what is staged versus unstaged?**

<details>
<summary>Show answer</summary>

`git status` (or `git status -s`) shows both. `git diff` shows unstaged changes and `git diff --staged` shows staged ones.
</details>

**7. What does `git init` do?**

<details>
<summary>Show answer</summary>

It creates the hidden `.git` directory in the current folder, making it a repository.
</details>

---

## 🟡 Mid-Level

**8. Does Git store snapshots or differences? Why does it matter?**

<details>
<summary>Show answer</summary>

Snapshots. Each commit references the full state of tracked files (unchanged files are linked, not duplicated). This makes branching, switching and comparing commits fast and conceptually simple.
</details>

**9. A file is in `.gitignore` but still shows up in `git status`. Why and how do you fix it?**

<details>
<summary>Show answer</summary>

It was tracked before it was ignored, and `.gitignore` only affects untracked files. Run `git rm --cached <file>` (or `-r` for folders) and commit. The file stays on disk but is no longer tracked.
</details>

**10. What is the difference between `git rm` and `git rm --cached`?**

<details>
<summary>Show answer</summary>

`git rm` deletes the file from disk and stages the deletion. `git rm --cached` only removes it from the index (stops tracking) and keeps the file on disk.
</details>

**11. How does Git handle renames if it only stores snapshots?**

<details>
<summary>Show answer</summary>

It does not record renames. It detects them later by comparing content similarity. `git log --follow` and `git diff -M` rely on that detection, so keep rename commits separate from large edits.
</details>

**12. What makes a good commit message?**

<details>
<summary>Show answer</summary>

A short imperative subject (about 50 characters), a blank line, and an optional body (wrapped at 72) explaining what and why. Each commit should be atomic, containing one logical change. Trailers such as `Fixes #123` link context.
</details>

**13. Explain the order of precedence for Git configuration.**

<details>
<summary>Show answer</summary>

System, then global, then local (and worktree). More specific levels override more general ones, so a repository's `.git/config` beats `~/.gitconfig`, which beats `/etc/gitconfig`.
</details>

---

## 🔴 Senior

**14. Why is `git clean` dangerous, and how do you use it safely?**

<details>
<summary>Show answer</summary>

It permanently deletes untracked files, which Git has never stored, so they cannot be recovered through Git. Safe use: always run `git clean -n` (dry run) first, review the list, prefer `-X` for only ignored build output, and use `-i` when unsure.
</details>

**15. You committed an API key and then added the file to `.gitignore` and removed it from tracking. Is the problem solved?**

<details>
<summary>Show answer</summary>

No. The key remains in earlier commits and in any clones or forks. Treat it as compromised: rotate the key immediately, then optionally remove it from history with `git filter-repo` and force-push. GitHub push protection and secret scanning can help prevent it.
</details>

**16. What is Conventional Commits and what are its benefits?**

<details>
<summary>Show answer</summary>

A message convention (`type(scope): description`, with `!` or `BREAKING CHANGE:` for breaking changes). Benefits: consistent readable history, automated changelogs, and automatic SemVer bumps (`fix` = patch, `feat` = minor, breaking = major) via tools such as semantic-release or Changesets.
</details>

**17. Why do WSL users keep repositories in the Linux filesystem?**

<details>
<summary>Show answer</summary>

Accessing Windows files under `/mnt/c` is much slower, and mixing filesystems causes permission and line-ending (CRLF vs LF) issues. Git inside WSL is configured separately from Git for Windows.
</details>

**18. Where would you put OS and editor ignore rules, and why not in the project `.gitignore`?**

<details>
<summary>Show answer</summary>

In the global ignore file (`core.excludesFile`, default `~/.config/git/ignore`). Those files come from an individual developer's environment, so putting them in the shared `.gitignore` clutters it with rules only some contributors need.
</details>

---

## 🎤 Quick-Fire Round

| Question | Answer |
|---|---|
| Hash length (SHA-1 / SHA-256)? | 40 / 64 hex characters |
| Command for a compact status? | `git status -sb` |
| Stage only tracked files? | `git add -u` |
| Show staged changes? | `git diff --staged` |
| Which command previews a clean? | `git clean -n` |
| Which file lists global ignores by default? | `~/.config/git/ignore` |
| Debug an ignore rule? | `git check-ignore -v <path>` |
| Commit type that causes a MINOR bump? | `feat` |

---

## 🧭 Certification Link

This module maps to the **GitHub Foundations (GH-900)** objectives on version control basics, repositories and commits. Module 15 includes a full exam-prep map and a dedicated interview-preparation lesson.
