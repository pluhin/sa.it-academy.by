## Homework Assignment 1: Initializing a Local Repository
```bash
mkdir -p Roman_Gulyako/02.Git.Local
cd Roman_Gulyako/02.Git.Local
git init
echo "Homework Assignment 1" > README.md
git add --all
git commit -m "Complete homework assignment 1"
```

## Homework Assignment 2: Basic Version Control
```bash
git checkout -b feature-branch
echo "Some description of my project" >> README.md
git add --all
git commit -m "Add description of project"
git checkout main
git merge feature-branch
```

## Homework Assignment 3: Exploring Git History
```bash
git log
git log --oneline
git log --pretty=full
git log --pretty=format:"%h - %an, %ar : %s"
git log --oneline -5
git log --author="Roman Gulyako"
git show 9e23c33
```

## Homework Assignment 4: Creating and Applying Tags
```bash
git log --oneline
git tag v1.0 c28e8b4
git tag
echo "New changes for new tag" >> README.md
git add --all
git commit -m "Add additional changes"
git tag -a v2.0 -m "Annotated tag"
```

## Homework Assignment 5: Undoing Changes
```bash
git checkout -b bug-fix
echo "Some changes to README.md" >> README.md
git add --all
git commit -m "Add change to README.md"
echo "Another change to README.md" >> README.md
git add --all
git commit -m "Add new change to README.md"
git reset --soft HEAD~1
git commit -m "Add new change to README.md"
git reset --mixed HEAD~1
git add --all
git commit -m "Add new change to README.md"
git reset --hard HEAD~1
```