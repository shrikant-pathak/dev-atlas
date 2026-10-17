# Module 01 Cheatsheet — Git Fundamentals & Setup

## 🧠 Mental Model

| Concept | Remember |
|---|---|
| Storage | **Snapshots**, not deltas; unchanged files are linked, not copied |
| Integrity | Everything is hashed (SHA-1 today, SHA-256 option) |
| States | **Modified → Staged → Committed** |
| Areas | **Working tree → Staging area (index) → Repository (.git)** |
| Git vs GitHub | Git = local tool · GitHub = hosting platform |

Working Tree --git add--> Staging Area --git commit--> Repository


---

## 🛠️ Install and Verify

| System | Command |
|---|---|
| Any | `git --version` |
| Windows | `winget install --id Git.Git -e --source winget` |
| macOS | `brew install git` (or `xcode-select --install`) |
| Debian/Ubuntu | `sudo apt install git` |
| Fedora | `sudo dnf install git` |
| Arch | `sudo pacman -S git` |

**WSL:** keep projects in `~/...` (not `/mnt/c`), configure Git inside WSL too.

---

## ⚙️ Configuration

```bash
git config --global user.name  "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global push.autoSetupRemote true
```

| Command | Purpose |
|---|---|
| `git config --list --show-origin` | All settings + source file |
| `git config user.name` | Read one value |
| `git config --global --edit` | Edit the global file |
| `git config set / get / list / unset` | Newer subcommand style (Git 2.46+) |

| Level | Flag | File |
|---|---|---|
| System | `--system` | `/etc/gitconfig` |
| Global | `--global` | `~/.gitconfig` |
| Local | (default in repo) | `.git/config` |

**Precedence:** local > global > system.

---

## 🆘 Getting Help

```bash
git help <command>       # full manual
git <command> -h         # quick usage
git help -a              # all commands
git help -g              # concept guides
git help glossary
git help -w <command>    # open in browser
```

Synopsis notation: `[ ]` optional · `< >` placeholder · `|` choose one · `...` repeatable

---

## 🔄 Core Loop

| Command | What it does |
|---|---|
| `git init -b main` | Create a repo on branch `main` |
| `git status` / `git status -sb` | Show state (long / short) |
| `git add <file>` | Stage a file |
| `git add .` | Stage everything below the current folder |
| `git add -A` | Stage everything in the repo |
| `git add -u` | Stage only tracked files |
| `git commit -m "msg"` | Commit staged changes |
| `git commit -v` | Commit with diff shown in the editor |
| `git commit -a -m "msg"` | Auto-stage tracked changes, then commit |
| `git diff` | Unstaged changes |
| `git diff --staged` | Staged changes |
| `git log --oneline` | Compact history |
| `git show` | Latest commit in detail |

### Short status codes

| Code | Meaning |
|---|---|
| `??` | Untracked |
| `A ` | Added (staged) |
| `M ` | Modified, staged |
| ` M` | Modified, **not** staged |
| `MM` | Staged **and** modified again |
| `D ` / ` D` | Deleted (staged / not staged) |
| `R ` | Renamed |

---

## 🗑️ Remove, Move, Clean

| Goal | Command |
|---|---|
| Delete + stage removal | `git rm file` |
| Dry run | `git rm -n file` |
| Stop tracking, keep file | `git rm --cached file` |
| Remove folder | `git rm -r folder/` |
| Rename / move | `git mv old new` |
| Follow history across renames | `git log --follow file` |
| List tracked files | `git ls-files` |
| **Preview** cleanup | `git clean -n` (add `d`, `x` or `X` as needed) |
| Delete untracked files | `git clean -f` / `-fd` |
| Delete only ignored files | `git clean -fX` |
| Interactive clean | `git clean -i` |

⚠️ `git clean` is **irreversible**. Always run `-n` first.

---

## ✍️ Commit Messages

Subject in imperative mood, ≤ 50 chars

Body wrapped at 72 chars explaining WHAT and WHY,
not how.

Fixes #123
Co-authored-by: Name <email>


| Rule | Detail |
|---|---|
| Subject | Imperative ("Add", not "Added"), no period |
| Blank line | Between subject and body |
| Atomic | One logical change per commit |
| Trailers | `Fixes #`, `Co-authored-by:`, `Signed-off-by:` (`git commit -s`) |

### Conventional Commits

<type>[scope][!]: <description>


| Type | Use | SemVer |
|---|---|---|
| `feat` | New feature | MINOR |
| `fix` | Bug fix | PATCH |
| `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert` | Other changes | none |
| `!` or `BREAKING CHANGE:` | Breaking change | MAJOR |

---

## 🙈 .gitignore

| Pattern | Meaning |
|---|---|
| `*.log` | Any `.log` file |
| `build/` | Directory only |
| `/todo.txt` | Repo root only |
| `**/temp` | Any depth |
| `!keep.log` | Re-include |
| `logs/*` + `!logs/keep.log` | Ignore contents, keep one file |

| Layer | Location |
|---|---|
| Project (shared) | `.gitignore` |
| Private, one repo | `.git/info/exclude` |
| All repos, your machine | `~/.config/git/ignore` or `core.excludesFile` |

```bash
git check-ignore -v <path>        # which rule matches?
git status --ignored              # show ignored files
git rm -r --cached <path>         # already tracked? stop tracking
git add -f <path>                 # force-add an ignored file
```

**Never commit:** `node_modules/`, build output, `.env`, keys, OS/editor junk.
Commit a `.env.example` instead.
