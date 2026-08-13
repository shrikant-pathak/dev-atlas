cat > lesson-02-files.md << 'EOF'
# Lesson 02: Files

## Learning Objectives
By the end of this lesson, you will be able to:
- Create, view, copy, move, rename, and delete files from the command line.
- Understand the risks of command-line file deletion compared to using a GUI trash/recycle bin.
- Chain basic file commands together confidently.

---

# Introduction

Nearly everything you do as a developer eventually comes down to manipulating files — creating them, reading them, moving them around. This lesson builds real fluency with file-level command-line operations.

---

# Creating and Viewing Files

```bash
touch notes.txt              # create an empty file
cat notes.txt                 # print the entire file's contents
head notes.txt                 # print the first 10 lines
tail notes.txt                  # print the last 10 lines
echo "Hello" > notes.txt          # write text to a file (overwrites existing content)
echo "World" >> notes.txt          # append text to a file (doesn't overwrite)
```

---

# Copying, Moving, and Renaming

```bash
cp notes.txt backup.txt          # copy a file
mv notes.txt archive/notes.txt    # move a file into a folder
mv old-name.txt new-name.txt       # rename a file (mv is used for renaming too!)
```

A common point of confusion: there's no dedicated "rename" command — `mv` handles both moving and renaming, since renaming is really just "moving" a file to a new name in the same location.

---

# Deleting Files

```bash
rm notes.txt          # delete a file
rm -i notes.txt        # delete with a confirmation prompt (safer)
```

**Important warning:** unlike deleting a file in Finder or File Explorer, `rm` does **not** send the file to a trash/recycle bin — it's typically gone immediately and permanently. This is one of the most common ways beginners lose important work; always double-check the filename before running `rm`, especially with wildcards (covered in the next lesson).

---

# Practical Example

```bash
touch draft.txt                  # create a file
echo "First version" > draft.txt   # write to it
cp draft.txt draft-backup.txt        # make a backup copy
echo "Second version" >> draft.txt    # append more content
cat draft.txt                          # view final contents
mv draft.txt final.txt                  # rename it
rm draft-backup.txt                      # delete the backup
```

---

# Revision Questions

1. What command is used for both moving AND renaming a file? Why does that make sense?
2. What's the difference between `>` and `>>` when writing to a file?
3. Why is `rm` considered riskier than deleting a file through a graphical file browser?

<details><summary>Answers</summary>

1. `mv` — renaming is conceptually just moving a file to a new name within the same directory.
2. `>` overwrites the file's existing content; `>>` appends new content without erasing what's already there.
3. Because `rm` typically deletes files permanently and immediately, without moving them to a recoverable trash/recycle bin first.

</details>
EOF