#!/bin/bash
# Git Version Control System Cookbook
# Chapter 2 - Configuration
#
# Copyright 2014 Aske Olsson
#

# Show whats is happening
set -x

# Git VCS cookbook
cwd=$(pwd)
# Chapter 2 - Configuration
# Getting ready
git clone https://github.com/dvaske/data-model.git
cd data-model

#setup pull to rebase
git config pull.rebase true

# setup pull to rebase for all tracked branches
git config branch.autosetuprebase always

#setup feature/2 for pull to rebase
git config branch.feature/2.rebase true

# Expiry
git config gc./refs/remote/*.reflogexpire never
git config gc./refs/remote/*.reflogexpireunreachable "2 months"

git config gc.pruneexpire 3.days.ago

# auto correct
git statis

# Set auto correct
git config help.autocorrect 5

#modify a file
echo "doing some modifications..." > another-file.txt
git statis

# Exit subdir
cd $cwd

set +x
