# Module 02 Interview Questions — Inspecting & Undoing Changes

Practice out loud. Difficulty: 🟢 Junior · 🟡 Mid · 🔴 Senior.

---

## 🟢 Junior

**1. How do you see the history of a single file?**

<details>
<summary>Show answer</summary>

`git log -- <path>` (add `--follow` to track renames, `-p` to see the changes).
</details>

**2. What is the difference between `git diff` and `git diff --staged`?**

<details>
<summary>Show answer</summary>

`git diff` compares the working tree to the index (unstaged changes). `git diff --staged` compares the index to HEAD (what the next commit contains).
</details>

**3. How do you discard changes to a file you have not staged?**

<details>
<summary>Show answer</summary>

`git restore <file>` (legacy: `git checkout -- <file>`). It cannot be undone for edits that were never staged or committed.
</details>

**4. How do you unstage a file?**

<details>
<summary>Show answer</summary>

`git restore --staged <file>` (legacy: `git reset HEAD <file>`).
</details>

**5. How do you fix the message of your last commit?**

<details>
<summary>Show answer</summary>

`git commit --amend -m "new message"`, as long as the commit has not been shared.
</details>

**6. What does `git blame` do?**

<details>
<summary>Show answer</summary>

It shows, for each line of a file, the last commit and author that changed it, so you can read that commit's message to understand why.
</details>

**7. What is the difference between `git reset` and `git revert`?**

<details>
<summary>Show answer</summary>

`reset` moves the branch pointer backwards (rewriting history). `revert` adds a new commit that undoes a previous one (history is preserved), which makes it safe for shared branches.
</details>

---

## 🟡 Mid-Level

**8. Explain `git reset --soft`, `--mixed` and `--hard`.**

<details>
<summary>Show answer</summary>

All three move the branch to the target commit. `--soft` leaves the index and working tree alone (changes stay staged). `--mixed` (default) also resets the index (changes stay in the working tree, unstaged). `--hard` resets the index and the working tree too, discarding uncommitted changes.
</details>

**9. What is the difference between `A..B` and `A...B`?**

<details>
<summary>Show answer</summary>

In `git log`: `A..B` is commits in B not in A. `A...B` is commits in either but not both. In `git diff`: `A..B` compares the two tips, while `A...B` compares the merge base with B (what B added).
</details>

**10. What is the difference between `HEAD~2` and `HEAD^2`?**

<details>
<summary>Show answer</summary>

`HEAD~2` is two commits back along first parents. `HEAD^2` is the second parent of a merge commit.
</details>

**11. How would you find the commit that deleted a function?**

<details>
<summary>Show answer</summary>

`git log -S"functionName" --oneline` lists commits where the number of occurrences changed (added or removed). Add `-p` to see the diff. `git log -L :functionName:file` also shows its history.
</details>

**12. How do you commit only part of the changes in a file?**

<details>
<summary>Show answer</summary>

`git add -p <file>` and answer per hunk (`y`, `n`, `s` to split, `e` to edit). Review with `git diff --staged`, then commit.
</details>

**13. How do you get one file from an older commit without changing branches?**

<details>
<summary>Show answer</summary>

`git restore --source=<commit> <file>` (legacy: `git checkout <commit> -- <file>`).
</details>

**14. Why is amending a pushed commit a bad idea?**

<details>
<summary>Show answer</summary>

It creates a new commit with a different hash, so local and remote history diverge. Pushing requires a force, which can overwrite or conflict with teammates' work. Use a new commit or `git revert` instead.
</details>

---

## 🔴 Senior

**15. You ran `git reset --hard` and lost commits. What do you do?**

<details>
<summary>Show answer</summary>

Stay calm, because committed work is almost never lost. Run `git reflog`, find the commit from before the reset, create a safety branch with `git branch rescue <hash>`, then `git reset --hard <hash>` (or `HEAD@{1}` / `ORIG_HEAD`). Uncommitted, never-staged changes cannot be recovered.
</details>

**16. How do you revert a merge commit, and what is the pitfall?**

<details>
<summary>Show answer</summary>

`git revert -m 1 <merge>`. The `-m` flag picks which parent to keep. The pitfall: Git now treats the branch's changes as merged and undone, so re-merging the branch will not bring them back. You must first revert the revert commit.
</details>

**17. How would you recover a deleted branch? A dropped stash?**

<details>
<summary>Show answer</summary>

Branch: find its last commit hash (printed at deletion or in `git reflog`) and run `git branch <name> <hash>`. Stash: the drop prints the stash commit's hash, so `git stash apply <hash>`; otherwise use `git fsck --no-reflog --unreachable | grep commit` to find it.
</details>

**18. A teammate says "I reformatted the whole repo and now `git blame` is useless". What do you do?**

<details>
<summary>Show answer</summary>

Add the formatting commit hash to `.git-blame-ignore-revs` and set `git config blame.ignoreRevsFile .git-blame-ignore-revs`. GitHub's blame view honours that file by name. `-w`, `-M` and `-C` also help blame look through whitespace and moved code.
</details>

**19. What is the difference between `git log -S` and `-G`?**

<details>
<summary>Show answer</summary>

`-S"text"` finds commits that changed the **count** of occurrences of a string. `-G"regex"` finds commits whose changed lines **match** a regular expression, even when the count is unchanged.
</details>

**20. How does the reflog differ from `git log`, and what are its limits?**

<details>
<summary>Show answer</summary>

`git log` walks commit ancestry. The reflog records where HEAD and branch tips pointed over time, including commits no longer on any branch. It is local only and expires (90 days for reachable and 30 days for unreachable entries by default), and it cannot restore uncommitted changes.
</details>

**21. How can a script check whether the working tree has uncommitted changes?**

<details>
<summary>Show answer</summary>

`git diff --quiet` and `git diff --cached --quiet` (exit status 1 when there are differences), or check `git status --porcelain` for empty output.
</details>

---

## 🎤 Quick-Fire Round

| Question | Answer |
|---|---|
| Show unstaged changes? | `git diff` |
| Show staged changes? | `git diff --staged` |
| Undo last commit, keep changes staged? | `git reset --soft HEAD~1` |
| Undo last commit, keep changes unstaged? | `git reset HEAD~1` |
| Discard last commit and changes? | `git reset --hard HEAD~1` |
| Safe undo of a pushed commit? | `git revert` |
| Find lost commits? | `git reflog` |
| Search code in an old release? | `git grep text v1.0` |
| Who changed this line? | `git blame` |
| Stage part of a file? | `git add -p` |
| Name a commit from a tag? | `git describe` |
| Contributor counts? | `git shortlog -sn` |

---

## 🧭 Certification Link

This module supports **GitHub Foundations (GH-900)** topics on commits, history and undoing changes. Module 15 maps every exam domain to lessons and includes a dedicated interview-preparation lesson.
