#!/bin/bash
set -x

# Git VCS cookbook

# Chapter 8 - Recovering trom mistakes

# Getting ready
if [ ! -d hello_world_cookbook ]; then
	git clone https://github.com/dvaske/hello_world_cookbook.git
fi

cd hello_world_cookbook	

# Checkout the master branch
git checkout master

# reset to known state
git reset --hard origin/master

# How to do it
# Lets see the latest commit
git log -1

# Make sure we have a clean working directory and index
git status

# Redo the latest commit with a new commit message
echo -e "Adds Java version of 'hello world'\n\nAlso includes a makefile\n\nFixes: RD-31415" | git commit --amend -F - 

# Check the latest commit again
git log -1

# Check the commit object of the previous commit:
git cat-file -p 3061dc6

# Check the commit object of the current HEAD/commit:
git cat-file -p HEAD

### There is more !!!

echo "This is the readme file" > README.md

# Add the file
git add README.md

# Check status
git status

git commit --amend --no-edit

# Exit subdir
cd ..

set +x


