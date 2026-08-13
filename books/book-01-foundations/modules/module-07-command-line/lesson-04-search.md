cat > lesson-04-search.md << 'EOF'
# Lesson 04: Search

## Learning Objectives
By the end of this lesson, you will be able to:
- Search for files by name using `find`.
- Search for text content within files using `grep`.
- Combine search commands with other tools for powerful workflows.

---

# Introduction

As projects grow to hundreds or thousands of files, manually browsing to find something becomes impractical. Command-line search tools let you locate files or specific text almost instantly — a skill you'll rely on constantly, especially when debugging unfamiliar codebases.

---

# Finding Files by Name: `find`

```bash
find . -name "*.js"              # find all .js files, starting from current directory
find . -name "README.md"          # find files with an exact name
find . -type d -name "components"  # find only directories named "components"
find . -mtime -1                    # find files modified in the last 1 day
```

The `.` means "start searching from the current directory" — `find` searches recursively through all subdirectories by default.

---

# Searching File Contents: `grep`

While `find` locates files by name, `grep` searches *inside* files for matching text.

```bash
grep "TODO" app.js                  # search for "TODO" within a single file
grep -r "TODO" .                     # search recursively through all files in current directory
grep -ri "todo" .                     # case-insensitive search
grep -rn "TODO" .                      # show line numbers alongside matches
grep -r --include="*.js" "TODO" .       # search only within .js files
```

`grep` is genuinely one of the most-used commands in a developer's daily workflow — searching an entire codebase for where a function is used, where a specific error message comes from, or where a TODO comment was left.

---

# Combining Commands

Command-line tools are designed to be combined using the pipe (`|`) operator, sending one command's output as input to another:

```bash
find . -name "*.js" | xargs grep -l "useState"    # find all JS files that contain "useState"
ls -la | grep ".md"                                 # list files, then filter to only show .md files
```

---

# Practical Example

```bash
# Find every markdown file in the project mentioning "TODO"
grep -rl "TODO" --include="*.md" .

# Find all files modified in the last 2 days
find . -mtime -2
```

---

# Revision Questions

1. What's the difference between `find` and `grep`?
2. What does the `-r` flag do when used with `grep`?
3. What does the pipe (`|`) operator do?

<details><summary>Answers</summary>

1. `find` locates files/directories based on criteria like name, type, or modification date; `grep` searches for specific text *within* the contents of files.
2. It makes `grep` search recursively through all files in the current directory and its subdirectories, rather than just a single specified file.
3. It sends the output of one command as the input to the next command, allowing multiple commands to be chained together into a single, more powerful operation.

</details>
EOF