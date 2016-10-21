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

# Find unreachable objects
git fsck --unreachable
objects=$(git fsck --unreachable) 2>/dev/null

# Show the objects
while read line; do
	git show ${line##* }
done <<< "$objects"

# Exit subdir
cd ..

set +x


