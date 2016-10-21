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

# Show the ID of the commit at HEAD
git rev-parse HEAD
# Full ref name
git rev-parse --symbolic-full-name HEAD
# Normal ref name
git rev-parse --symbolic-full-name --abbrev-ref HEAD

git rev-parse origin/feature/2

# For scripting
cd a_sub_directory
# Root directory of repository
git rev-parse --show-toplevel
# cd .. to get to the toplevel
git rev-parse --show-cdup
# Current working directory path relative to root
git rev-parse --show-prefix
cd ..

# Show .git dir
git rev-parse --git-dir
# Check bare status
git rev-parse --is-bare-repository

# Exit subdir
cd ..

set +x
