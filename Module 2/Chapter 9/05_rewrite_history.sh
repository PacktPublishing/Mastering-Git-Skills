#!/bin/bash

# Git VCS cookbook
set -x
# Chapter 9 - Repo maintenance
# Getting ready
# Clone the jgit repository:
cwd=$(pwd)
if [ -d remove-credentials ]; then
  rm -rf remove-credentials
fi
git clone https://github.com/dvaske/remove-credentials.git
cd remove-credentials
git checkout master

# How to do it
# Check the contents of .credentials
cat .credentials

# Run the filter-branch
git filter-branch --prune-empty  --tree-filter "test -f .credentials && sed -i '' 's/^\(.*=\).*$/\1/' .credentials || true " -- --all

# Check the contents of .credentials
cat .credentials

# Delete original refs and remove old objects
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

git reflog expire --expire=now --all
git gc --prune=now

set +x
# Exit subdir
cd ..

set +x
