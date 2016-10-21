#!/bin/bash

set -x

# Git VCS cookbook

# Chapter 9 - Repo maintenance
# Getting ready
# Clone the jgit repository:
cwd=$(pwd)

if [ -d super ]; then
  rm -rf super
fi
git clone https://github.com/dvaske/super.git

cd super

# Add the lib_a as a submodule
git submodule add git://github.com/dvaske/lib_a.git lib_a

# Check git status
git status

# Check the contents of .gitmodules and the lib_a file
cat .gitmodules
# check the lib_a file as git sees it
git diff --cached lib_a

# Commit the added submodule
git commit -m "Adds lib_a as a submodule"

# Lets try to update the submodule to the develop branch
cd lib_a
git checkout develop
cd ..

git status

# Lets update the submodule
git submodule update

cd lib_a
# Check the submodule
git status

# We are on a detached head lets checkout the develop branch again
git checkout develop
cd ..

git status
git add lib_a

git commit -m "Updated lib_a to newest version"

# Update to follow the develop branch:
git config -f .gitmodules submodule.lib_a.branch stable
cat .gitmodules
git add .gitmodules

git commit -m "Make lib_a module track its stable branch"

git submodule update --remote
git status

cd ..

# Clone a repository containing submodules
rm -rf super_clone

git clone super super_clone
cd super_clone
git submodule init
git submodule update --remote


# Exit subdir
cd ..

set +x
