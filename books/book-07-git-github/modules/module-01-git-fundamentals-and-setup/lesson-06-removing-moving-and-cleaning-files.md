# Lesson 06 — Removing, Moving and Cleaning Files

> **Module 01 — Git Fundamentals & Setup** · Book 07 — Git & GitHub

## 🎯 Learning Objectives

By the end of this lesson you will be able to:

- Remove tracked files with `git rm`, and stop tracking a file while keeping it (`--cached`)
- Rename or move files with `git mv`
- Explain how Git detects renames even though it stores snapshots
- Delete untracked files safely with `git clean` (and know its dangers)
- Inspect what Git tracks with `git ls-files`

---

## 📖 Introduction

Projects do not only grow. Files get deleted, renamed, reorganized, and temporary files pile up. Git has to be told about these changes just like edits. In earlier books you used `rm` and `mv` in the terminal; here you will learn the Git-aware versions and when each is the right tool.

---

## 1. Removing Files: `git rm`

If you delete a **tracked** file with plain `rm`, Git sees the deletion as an unstaged change. `git rm` does both steps at once: **delete the file and stage the deletion**.

```bash
git rm old-page.html
git commit -m "Remove unused page"
```

Equivalent to:

```bash
rm old-page.html
git add old-page.html     # (or git add -A / git add -u)
```

### Useful options

| Command | Effect |
|---|---|
| `git rm file` | Delete from working tree **and** stage the removal |
| `git rm -r folder/` | Remove a directory recursively |
| `git rm -n file` | **Dry run**: show what would happen |
| `git rm -f file` | Force removal even if the file has staged or unstaged changes |
| `git rm --cached file` | Stop tracking but **keep the file on disk** |

Git refuses to remove a file with uncommitted changes unless you use `-f`, a safety net against losing work.

---

## 2. Stop Tracking Without Deleting: `--cached`

A classic mistake: you commit a file that should have been ignored, such as `.env` or a `node_modules` folder, and then add it to `.gitignore`. It is **still tracked**, because `.gitignore` only affects untracked files (Lesson 08).

Fix it by removing it from Git's index only:

```bash
git rm --cached .env
git rm -r --cached node_modules/
git commit -m "Stop tracking environment file and dependencies"
```

The files stay on your disk but leave future commits.

> ⚠️ This does **not** erase the file from past commits. If it contained a secret, the secret is still in history. See Module 06 (`filter-repo`) and always rotate leaked credentials.

---

## 3. Moving and Renaming: `git mv`

```bash
git mv about.html pages/about.html     # move
git mv app.js main.js                  # rename
```

This is exactly the same as:

```bash
mv app.js main.js
git add -A       # stage the deletion of app.js and the new main.js
```

### But Git stores snapshots. How does it know about renames?

Git does **not** record "this file was renamed." It stores snapshots and later **detects** renames by comparing content similarity (by default when roughly half or more of the file matches). That is why:

```bash
git status                    # shows "renamed: app.js -> main.js"
git log --follow main.js      # follow a file's history across renames
git diff -M                   # rename detection in diffs
```

**Tip:** Rename in one commit and make big content edits in another. Heavy edits at the same time can make Git unable to recognize the rename, which makes history harder to follow.

### Case-only renames

On Windows and default macOS filesystems, `Readme.md` and `README.md` are the same name, which confuses Git. Rename in two steps:

```bash
git mv Readme.md tmp-readme
git mv tmp-readme README.md
```

---

## 4. Cleaning Untracked Files: `git clean`

Builds, logs and experiments leave **untracked** files behind. `git clean` deletes them.

> 🚨 **Danger:** Untracked files are not stored in Git. Once `git clean` deletes them, **they cannot be recovered through Git**. Always preview first.

```bash
git clean -n        # DRY RUN: list what would be deleted (do this first!)
git clean -f        # actually delete untracked files
git clean -fd       # also delete untracked directories
git clean -fx       # also delete files listed in .gitignore
git clean -fX       # delete ONLY ignored files (e.g. build output)
git clean -i        # interactive mode: choose what to delete
```

| Flag | Meaning |
|---|---|
| `-n` | Dry run |
| `-f` | Force (required by default for safety) |
| `-d` | Include directories |
| `-x` | Include ignored files too |
| `-X` | **Only** ignored files |
| `-i` | Interactive |

A safe routine: `git clean -nd` → read the list → `git clean -fd`.

---

## 5. Seeing What Git Tracks: `git ls-files`

```bash
git ls-files                 # every tracked file
git ls-files "*.js"          # filter by pattern
git ls-files --others        # untracked files
git ls-files --deleted       # tracked files missing from disk
```

Handy when you wonder, "Is this file actually in the repository?"

---

## 6. Quick Decision Guide

| Goal | Command |
|---|---|
| Delete a tracked file and record it | `git rm file` |
| Keep the file, stop tracking it | `git rm --cached file` |
| Rename / move a tracked file | `git mv old new` |
| Remove junk untracked files | `git clean -n` then `git clean -f` |
| Discard edits to a tracked file | `git restore file` (Module 02) |

---

## 🛠️ Practical Example — Reorganize a Project

Continue in your `my-site` repository from Lesson 05.

```bash
# Setup: add some files to play with
echo "<h1>About</h1>" > about.html
echo "temp notes" > scratch.txt
git add about.html
git commit -m "Add about page"

# 1. Move into a folder
mkdir pages
git mv about.html pages/about.html
git status                      # shows "renamed"
git commit -m "Move about page into pages folder"

# 2. Stop tracking a file but keep it
echo "SECRET=123" > .env
git add .env
git commit -m "Oops: add env file"
git rm --cached .env
git commit -m "Stop tracking .env"
ls -a                           # .env is still on disk

# 3. Clean junk safely
git clean -n                    # preview: scratch.txt (and .env)
```

Do **not** run `git clean -f` yet. Think first: would it delete `.env`, and would you be able to get it back?

**Checkpoint:** run `git log --follow --oneline pages/about.html` and confirm the history continues across the move.

<details>
<summary>Show hint</summary>

`.env` is untracked after `--cached`, so `git clean -f` **would** delete it permanently. This is why dry runs matter, and why Lesson 08 teaches `.gitignore`: ignored files are protected from a plain `git clean -f`.
</details>

---

## 📝 Revision Questions

**1. What is the difference between `git rm file` and `git rm --cached file`?**

<details>
<summary>Show answer</summary>

`git rm file` deletes the file from disk and stages the removal. `--cached` removes it only from Git's tracking (the index), leaving the file on disk.
</details>

**2. Does Git store file renames?**

<details>
<summary>Show answer</summary>

No. Git stores snapshots and detects renames afterwards by content similarity. Tools like `git log --follow` and `git diff -M` use that detection.
</details>

**3. Why should you always run `git clean -n` first?**

<details>
<summary>Show answer</summary>

`git clean` permanently deletes untracked files, and Git cannot recover files it never tracked. The dry run lists what would be removed before you commit to it.
</details>

**4. You added `node_modules/` to `.gitignore` but Git still tracks it. How do you fix it?**

<details>
<summary>Show answer</summary>

`.gitignore` only affects untracked files. Run `git rm -r --cached node_modules/` and commit. The folder stays on disk but is no longer tracked.
</details>

**5. How do you rename a file's case (Readme.md → README.md) on a case-insensitive filesystem?**

<details>
<summary>Show answer</summary>

Use a two-step rename through a temporary name: `git mv Readme.md tmp` then `git mv tmp README.md`.
</details>

---

➡️ **Next:** Lesson 07 — Commit Messages and Conventional Commits
