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
# Create the master branch locally without checking out
git branch master origin/master
# Make sure we have develop checked out
git checkout develop

git log --oneline master..develop
# Create patches of all commits not on origin/master
git format-patch -o not-on-master master

ls -la not-on-master

# Exit subdir
cd ..

set +x
