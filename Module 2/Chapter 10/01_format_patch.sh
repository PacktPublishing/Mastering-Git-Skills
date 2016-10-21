#!/bin/bash
# Git Version Control System Cookbook
# Chapter 10 - Patching and offline sharing
#
# Copyright 2014 Aske Olsson
#

# Show whats is happening
set -x

# Getting ready

# Remove dir if it exists
rm -rf offline-sharing

# Clone
git clone https://github.com/dvaske/offline-sharing.git

# How to do it
cd offline-sharing
git checkout master

# Lets see the commit on master not on develop
git log develop..master

# Lets create a patch for the latest commit
git format-patch -1 -o latest-commit

cat latest-commit/0001*

# Create patches for the latest 3 commits
git format-patch -3 -o latest-commits
ls -la latest-commits

# Exit subdir
cd ..

set +x
