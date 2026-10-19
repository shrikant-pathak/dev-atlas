# Module 02 Cheatsheet — Inspecting & Undoing Changes

## 📜 Log

| Goal | Command |
|---|---|
| Compact history | `git log --oneline` |
| Graph of all branches | `git log --oneline --graph --decorate --all` |
| With stats / diffs | `git log --stat` · `git log -p` |
| Last N commits | `git log -5` |
| By author / message | `git log --author="Asha"` · `--grep="fix" -i` |
| AND of two greps | `--grep=a --grep=b --all-match` |
| By date | `--since="2 weeks ago"` · `--until=2026-03-01` |
| By file | `git log -- path` · `--follow -- file` |
| Hide merges | `--no-merges` |
| Custom format | `--pretty=format:"%h %an %ad %s" --date=short` |

| Placeholder | Meaning |
|---|---|
| `%h` / `%H` | short / full hash |
| `%an` `%ae` | author name / email |
| `%ad` `%ar` | date / relative date |
| `%s` `%b` | subject / body |
| `%d` | refs (branches, tags) |

## 🧭 Revision Syntax

| Expression | Meaning |
|---|---|
| `HEAD`, `@` | Current commit |
| `HEAD~N` | N commits back (first parents) |
| `HEAD^`, `HEAD^2` | First / second parent (merges) |
| `@{-1}` | Previous branch |
| `@{u}` | Upstream branch |
| `main@{yesterday}` | Where main was yesterday |
| `:/text` | Newest commit whose message matches |
| `rev:path` | A file at that revision |

## ↔️ Ranges

| Range | `git log` meaning |
|---|---|
| `A..B` | In B, not in A |
| `A...B` | In either, not both |
| `--left-right A...B` | Mark which side (`<` / `>`) |
| `B ^A` / `B --not A` | Same as `A..B` |

For **`git diff`**: `A..B` = A vs B tips · `A...B` = merge-base vs B.

## 🔍 Diff and Show

| Command | Compares |
|---|---|
| `git diff` | working tree ↔ index (unstaged) |
| `git diff --staged` | index ↔ HEAD (next commit) |
| `git diff HEAD` | working tree ↔ HEAD |
| `git diff A B` / `A..B` | two commits |
| `git diff A...B` | merge-base ↔ B |

`--stat` · `--name-only` · `--name-status` · `-w` · `--word-diff` · `--color-moved` · `--check` · `--exit-code` · `--no-index`

```bash
git show <rev>              git show <rev>:<path>
git show -s --format="%h %s"
git config --global diff.algorithm histogram
git config --global diff.tool vscode
git difftool -d
```

## 🔎 Searching

| Question | Command |
|---|---|
| Where is X now? | `git grep -n X` |
| Where was X at v1? | `git grep X v1.0` |
| Who added/removed X? | `git log -S"X" -p` |
| Which changes touched lines like X? | `git log -G"regex"` |
| History of a function | `git log -L :func:file` |
| Who last changed each line? | `git blame file` · `-L 10,20` · `-w -M -C` |
| Ignore a mass-format commit | `.git-blame-ignore-revs` + `blame.ignoreRevsFile` |

## ✂️ Interactive Staging

| Key in `git add -p` | Action |
|---|---|
| `y` / `n` | stage / skip hunk |
| `s` | split hunk |
| `e` | edit hunk by hand |
| `a` / `d` | stage / skip rest of file |
| `q` | quit |
| `j J k K g /` | navigate |

`git add -N newfile` before patch mode on new files · same idea: `git restore -p`, `git reset -p`, `git stash -p`.

## ↩️ Undo Matrix

| Situation | Command |
|---|---|
| Discard working-tree edits | `git restore <file>` |
| Unstage a file | `git restore --staged <file>` |
| File from an old commit | `git restore --source=<c> <file>` |
| Fix last commit message | `git commit --amend -m "..."` |
| Add forgotten file to last commit | `git add f && git commit --amend --no-edit` |
| Undo local commit, keep staged | `git reset --soft HEAD~1` |
| Undo local commit, keep unstaged | `git reset HEAD~1` |
| Undo local commit, discard changes | `git reset --hard HEAD~1` |
| Undo a **pushed** commit | `git revert <c>` |
| Revert a merge | `git revert -m 1 <merge>` |
| Undo a reset/amend/rebase | `git reflog` → `git reset --hard HEAD@{n}` / `ORIG_HEAD` |

| Reset mode | branch | index | working tree |
|---|:---:|:---:|:---:|
| `--soft` | ✅ | | |
| `--mixed` (default) | ✅ | ✅ | |
| `--hard` | ✅ | ✅ | ✅ |

**Golden rule:** never rewrite (`amend`, `reset`, `rebase`) commits others already have.

## 🆘 Recovery

```bash
git reflog                      # find the hash
git branch rescue <hash>        # safe first step
git reset --hard HEAD@{1}       # undo last move
git branch name <hash>          # recreate deleted branch
git stash apply <hash>          # recover dropped stash
```

Cannot recover: never-staged edits, untracked files removed by `clean`, commits pruned after expiry (90 / 30 days default).

## 🏷️ Describe, Shortlog, Notes

```bash
git describe --tags --always --dirty    # v1.2.0-14-g3f2a9c1
git shortlog -sn --no-merges HEAD
git rev-list --count A..B
git rev-parse --short HEAD
git notes add -m "text" <commit>
git push origin refs/notes/commits
git config notes.rewriteRef refs/notes/commits
```
