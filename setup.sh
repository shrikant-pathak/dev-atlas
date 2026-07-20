#!/bin/bash

echo "🚀 Setting up DevAtlas..."

# GitHub
mkdir -p .github/ISSUE_TEMPLATE
mkdir -p .github/workflows

# Assets
mkdir -p assets/{images,diagrams,icons}

# Top-level folders
mkdir -p exercises
mkdir -p projects
mkdir -p cheatsheets
mkdir -p quizzes
mkdir -p interview
mkdir -p templates
mkdir -p resources

# Books
mkdir -p books

books=(
"book-01-foundations"
"book-02-javascript"
"book-03-frontend"
"book-04-backend"
"book-05-devops"
"book-06-career"
)

for book in "${books[@]}"; do
    mkdir -p "books/$book"
    touch "books/$book/README.md"
done

# First module
mkdir -p books/book-01-foundations/module-01-computer-fundamentals/{images,assets}

touch books/book-01-foundations/module-01-computer-fundamentals/README.md
touch books/book-01-foundations/module-01-computer-fundamentals/exercises.md
touch books/book-01-foundations/module-01-computer-fundamentals/quiz.md
touch books/book-01-foundations/module-01-computer-fundamentals/cheatsheet.md
touch books/book-01-foundations/module-01-computer-fundamentals/interview.md

# Root files
touch ROADMAP.md CHANGELOG.md CONTRIBUTING.md .gitignore

echo "✅ DevAtlas ready!"