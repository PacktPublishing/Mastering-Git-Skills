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
# Undo the last commit like it never happened

# Make sure we have a clean working directory and index
git status

# check the contents of current directory:
ls

# Lets see the history of the repository
git log --oneline

# Lets undo the latest commit
git reset --hard HEAD^

# Lets see the history of the repository
git log --oneline

# Check git status
git status

# check current directory
ls

# Exit subdir
cd ..

set +x


