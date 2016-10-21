#!/bin/bash
# Git Version Control System Cookbook
# Chapter 1 - Navigating Git
#
# Copyright 2014 Aske Olsson
#

# Show whats is happening
set -x

# Git VCS cookbook

# Chapter 1 - Git's Objects
# Getting ready
rm -rf data-model
git clone https://github.com/dvaske/data-model.git
cd data-model

# How to do it
# Change a file a bit
echo "Another line" >> another-file.txt
git status
git add another-file.txt
git status

# Change the file again
echo "Whoops almost forgot this" >> another-file.txt
git status
git add another-file.txt
git status
git commit -m "Another change to another file"

#
git cat-file -p HEAD
git cat-file -p HEAD^{tree}

git cat-file -p HEAD~1^{tree}

git fsck --dangling

sha=$(git fsck --dangling | cut -f 3 -d " ")

git cat-file -p $sha

# Exit subdir
cd ..

set +x
