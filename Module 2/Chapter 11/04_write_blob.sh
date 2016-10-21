#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

# Getting ready
# Delete repo if it exists
rm -rf myplumbing

# Initialize and change dir
git init myplumbing
cd myplumbing
# Current status
git status

# How to do it
# Check the objects folder
find .git/objects
find .git/objects -type f

# Lets create some objects:
sha=$(echo "This it the content of my file" | git hash-object -w --stdin)
echo $sha
# Lets see file in the .git/objects folder
find .git/objects -type f

# Use git to view the object
git cat-file -p $sha

# We can also use hash-object on a file:
echo "This content is good" > mytest.txt
# Write it to the db
sha2=$(git hash-object -w mytest.txt)
echo sha2

# Update the content
echo "This content is better" > mytest.txt
git hash-object -w mytest.txt

find .git/objects -type f

# Check the type of object by sha1
git cat-file -t $sha2

# Revert file to original content
git cat-file -p $sha2 > mytest.txt

cat mytest.txt

# Exit subdir
cd ..

set +x
