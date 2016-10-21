#!/bin/bash
# Git Version Control System Cookbook
# Chapter 1 - Navigating Git
#
# Copyright 2014 Aske Olsson
#

# Show whats is happening
set -x

# Git VCS cookbook

# Chapter 1 - Viewing history with gitk

# Check for a gitk installation
which gitk

#Change directory to data-model repository
cd data-model

# Open gitk with all branches
gitk --all &

# Exit subdir
cd ..
