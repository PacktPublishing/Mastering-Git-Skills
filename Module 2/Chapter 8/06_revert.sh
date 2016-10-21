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

# Check the history
git log --oneline

# revert the second commit
git revert 9c7532f --no-edit

# Check the history again
git log --oneline

# Exit subdir
cd ..

set +x


