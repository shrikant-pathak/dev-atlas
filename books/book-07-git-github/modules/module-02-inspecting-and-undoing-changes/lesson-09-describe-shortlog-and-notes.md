# Lesson 09 — Describe, Shortlog and Notes

> **Module 02 — Inspecting & Undoing Changes** · Book 07 — Git & GitHub

## 🎯 Learning Objectives

By the end of this lesson you will be able to:

- Turn any commit into a human-readable version name with `git describe`
- Summarize contributions with `git shortlog`
- Attach extra information to a commit **without changing its hash** using `git notes`
- Share notes with a remote and keep them through rewrites
- Count commits and fetch the current hash with `git rev-list` and `git rev-parse`

---

## 📖 Introduction

The commands in this lesson are small, specialized and surprisingly useful. `describe` gives your builds meaningful version strings. `shortlog` writes the "contributors" section of your release notes. `notes` lets you annotate history after the fact, which is normally impossible because commits are immutable.

---

## 1. Naming a Commit: `git describe`

A hash like `3f2a9c1` tells a human nothing. `git describe` finds the **nearest tag** behind a commit and builds a readable name from it.

```bash
git describe
```

```
v2.1.0-14-g3f2a9c1
```

| Part | Meaning |
|---|---|
| `v2.1.0` | The most recent tag reachable from this commit |
| `14` | Commits made since that tag |
| `g3f2a9c1` | The letter `g` ("git") plus the abbreviated hash |

On a commit that **is** the tag, you just get `v2.1.0`.

### Options

```bash
git describe --tags              # also use lightweight tags (default: annotated only)
git describe --always            # fall back to a short hash if there are no tags
git describe --dirty             # append "-dirty" if your working tree has changes
git describe --long              # always show the full form, even exactly on a tag
git describe --abbrev=10         # longer hash
git describe --match "v*"        # only consider tags matching a pattern
git describe --exact-match       # fail unless HEAD is exactly on a tag
git describe --contains <commit> # the first tag that contains this commit
```

### A build version string

```bash
VERSION=$(git describe --tags --always --dirty)
echo "Building $VERSION"
```

Many build scripts and release pipelines embed this value in the app. It identifies exactly which code produced a build.

> ⚠️ **CI gotcha:** continuous-integration systems often make **shallow clones** without tags, so `describe` returns only a hash. In GitHub Actions you fix this by fetching full history and tags (`fetch-depth: 0`), covered in Module 09.

Tags themselves are covered in Module 03.

---

## 2. Summarizing Contributors: `git shortlog`

`git log` lists commits. `git shortlog` **groups them by author**.

```bash
git shortlog                    # commit subjects grouped by author
git shortlog -s                 # -s: just counts
git shortlog -sn                # -n: sorted by number of commits
git shortlog -sne               # -e: include email addresses
git shortlog -sn --no-merges
git shortlog v1.0..v2.0         # everything between two releases
git shortlog --since="1 year ago" -sn
```

Example:

```
     3  Asha Rao
     2  Ben Ortiz
     1  Chen Wei
```

### Other groupings

```bash
git shortlog -sn -c                                  # group by committer instead
git shortlog -sn --group=trailer:co-authored-by      # credit co-authors (Module 01, Lesson 07)
```

### A scripting gotcha

When `shortlog` runs somewhere that is **not a terminal** (a script, a CI step, a pipe) and you give it no revision, it waits to read from standard input and appears to hang. Always pass one explicitly:

```bash
git shortlog -sn HEAD
```

---

## 3. Counting and Identifying Commits (Handy Plumbing)

```bash
git rev-list --count HEAD            # total number of commits
git rev-list --count main..feature   # commits on feature not on main
git rev-parse HEAD                   # full hash of the current commit
git rev-parse --short HEAD           # abbreviated hash
git rev-parse --abbrev-ref HEAD      # current branch name
```

These "plumbing" commands (Module 07) print one clean value, which makes them ideal for scripts.

---

## 4. Annotating Commits: `git notes`

A commit cannot be edited without changing its hash. But sometimes you want to add information **afterwards**: a code-review result, a CI link, a ticket number, a "released in 2.4" label. **Notes** are stored **separately**, attached to a commit by its hash, so the commit itself never changes.

```bash
git notes add -m "Reviewed by Sam, approved for release" HEAD
git notes show HEAD
git log -1                       # the note is displayed under the commit
```

### Managing notes

```bash
git notes add -m "text" <commit>      # create (fails if one exists; use -f to overwrite)
git notes append -m "more" <commit>   # add to an existing note
git notes edit <commit>               # edit in your editor
git notes remove <commit>
git notes list                        # all notes: <note-object> <commit>
```

### Separate namespaces

Notes live under `refs/notes/<name>`. The default is `commits`. Use `--ref` to keep different kinds apart:

```bash
git notes --ref=ci add -m "Build 4521 passed" HEAD
git log --notes=ci -1
```

### Notes are not shared automatically

A normal `git push` or `git fetch` does **not** carry notes. Share them explicitly:

```bash
git push origin refs/notes/commits
git fetch origin refs/notes/commits:refs/notes/commits
```

Web interfaces generally do not display notes, so treat them as a command-line and tooling feature.

### Surviving rewrites

When you amend or rebase a commit, its hash changes and the note stays attached to the **old** hash. To make Git copy notes across rewrites:

```bash
git config notes.rewriteRef refs/notes/commits
```

### When to use notes

| Good use | Why |
|---|---|
| CI results, review sign-offs, release labels | Added **after** the commit exists |
| Metadata for tooling in a monorepo | Keeps commit messages clean |
| Annotating history you cannot rewrite | Public history stays untouched |

For day-to-day work, commit messages, tags and pull requests cover most needs. Notes are a specialist tool.

---

## 🛠️ Practical Example — Release Housekeeping

Use the `history-lab` repository from Lesson 01. If you no longer have it, recreate it with the setup script in that lesson.

```bash
cd ~/git-practice/history-lab
git tag -a v1.0.0 HEAD~3 -m "First release"
git tag -a v1.1.0 -m "Contact form release"
```

### `describe`

```bash
git describe                   # on v1.1.0 exactly
echo "x" >> index.html && git commit -qam "chore: tweak"
git describe                   # v1.1.0-1-g<hash>
git describe --tags --always --dirty
echo "y" >> index.html
git describe --dirty           # ...-dirty
git restore index.html
git describe --contains HEAD~1
```

### `shortlog`

```bash
git shortlog -sn
git shortlog -sne
git shortlog v1.0.0..v1.1.0
git shortlog -sn --since="2026-03-01" HEAD
```

### Counting

```bash
git rev-list --count HEAD
git rev-list --count v1.0.0..HEAD
```

### `notes`

```bash
git notes add -m "Approved by QA on 2026-04-01" v1.1.0
git log -1 v1.1.0
git notes --ref=ci add -m "Build 100 passed" HEAD
git log --notes=ci -1
git notes list
```

**Checkpoint tasks:**

1. In `v1.1.0-14-g3f2a9c1`, how many commits are there after the tag?
2. Which tool answers "who contributed the most between v1.0 and v2.0?"
3. Why does a note disappear from view after you amend the commit, and how do you prevent it?
4. Why can `git shortlog` hang in a CI script?

<details>
<summary>Show answers</summary>

1. 14.
2. `git shortlog -sn v1.0..v2.0`.
3. The amend produces a new hash, and the note remains attached to the old one. Set `notes.rewriteRef` so Git copies notes when commits are rewritten.
4. With no terminal and no revision argument it reads from standard input. Pass a revision such as `HEAD`.
</details>

---

## 📝 Revision Questions

**1. What does `git describe` output, and what is it useful for?**

<details>
<summary>Show answer</summary>

The nearest reachable tag, the number of commits since it and the abbreviated hash (e.g. `v2.1.0-14-g3f2a9c1`). It produces meaningful version strings for builds.
</details>

**2. How do you get the contribution count per author for the last year?**

<details>
<summary>Show answer</summary>

`git shortlog -sn --since="1 year ago" HEAD`.
</details>

**3. What problem do Git notes solve?**

<details>
<summary>Show answer</summary>

They attach information to a commit after the fact without changing the commit or its hash, which would be impossible with the commit message.
</details>

**4. Are notes pushed with a normal `git push`?**

<details>
<summary>Show answer</summary>

No. Push and fetch them explicitly using their ref, e.g. `git push origin refs/notes/commits`.
</details>

**5. How do you count the commits on `feature` that are not on `main`?**

<details>
<summary>Show answer</summary>

`git rev-list --count main..feature`.
</details>

---

🎉 **Module 02 complete!** You can now read history in any format, search it, stage precisely, undo changes at every level and recover almost anything.

➡️ **Next module:** Module 03 — Branching & Merging
