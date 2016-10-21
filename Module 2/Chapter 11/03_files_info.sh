#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

rm -rf data-model
git clone https://github.com/dvaske/data-model.git

cd data-model

# Show staging area
git ls-files
echo "Just testing..." > test.txt
git ls-files
git add test.txt
git ls-files

# Show modified files
echo "Another fine line" >> another-file.txt
git ls-files -m

# Show untracked - "others"
git reset HEAD test.txt
git ls-files --others

# Show ignored
echo "*.txt" > .gitignore
git ls-files -i --exclude-standard
git ls-files -o -i --exclude-standard

# cleanup
git reset --hard origin/master
git clean -xfd

# Try to merge
git merge origin/feature/2
# Show the conflicts
git status
# with ls-files
git ls-files --unmerged

# Quick list of unmerged files _only_
git ls-files --unmerged | cut -f 2 | sort -u

git merge --abort



# Exit subdir
cd ..

set +x
