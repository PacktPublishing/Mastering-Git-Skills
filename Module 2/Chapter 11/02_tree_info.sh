#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

rm -rf data-model
rm -rf data-model.git
git clone https://github.com/dvaske/data-model.git
git clone --bare https://github.com/dvaske/data-model.git

cd data-model
# use --abbrev for all commands - we do not need the full 40 chars in the sha1
# Show the tree at HEAD
git ls-tree --abbrev HEAD
# Show sizes of objects
git ls-tree --abbrev -l HEAD
# Show trees recursive
git ls-tree --abbrev -r HEAD
# Also show the tree objects in recursive listing
git ls-tree --abbrev -r -t HEAD

# Find a file in a bare repo
cd ..
cd data-model.git
# Lets find the a_sub_directory/readme file
git ls-tree -r HEAD a_sub_directory/readme
sha=$(git ls-tree -r HEAD a_sub_directory/readme | cut -c 13-52)
git cat-file -p $sha > readme_contents
cat readme_contents
cd ..
cd data-model

# diffing trees
git diff-tree --abbrev HEAD origin/feature/2
# List files and status only
git diff-tree --name-status HEAD origin/feature/2
# List files only
git diff-tree --name-only HEAD origin/feature/2


#git ls-files --unmerged, cached, ignored etc.
#git check-attr filter

# Exit subdir
cd ..

set +x
