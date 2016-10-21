#!/bin/bash
set -x

# Git VCS cookbook

# Chapter 9 - Repo maintenance
# Getting ready
# Reclone the repository if it exists
if [ -d hello_world_flow_model ]; then
	rm -rf hello_world_flow_model
fi
git clone https://github.com/dvaske/hello_world_flow_model.git

cd hello_world_flow_model
git checkout develop
git reset --hard origin/develop

# How to do it
# Check the effective configuration
git config gc.auto

# Set the gc.auto to 0 to turn off automatic invokation of gc on some commands
git config gc.auto 0

# List the effective config
git config gc.auto

# git gc can still be invoked manually
# won't run with the --auto switch
git gc --auto

# Runs with no arguments
git gc

# Exit subdir
cd ..

set +x
