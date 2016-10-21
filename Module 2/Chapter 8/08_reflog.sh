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

# Check the reflog
git reflog -7

# Show the commit
git show HEAD@{4}

# show the tree:
git ls-tree --abbrev HEAD@{4}

# Exit subdir
cd ..

set +x


