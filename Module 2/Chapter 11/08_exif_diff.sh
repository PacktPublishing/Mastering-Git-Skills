#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

rm -rf attributes_example
git clone https://github.com/dvaske/attributes_example.git

cd attributes_example
git checkout exif

git diff HEAD^..HEAD

# Create attribute entries for jpg
echo '*.jpg diff=exif-diff' >> .gitattributes
# Add the exiftool as differ
git config diff.exif-diff.textconv exiftool

git log --name-status -2q

git diff HEAD^..HEAD

# Exit subdir
cd ..

set +x
