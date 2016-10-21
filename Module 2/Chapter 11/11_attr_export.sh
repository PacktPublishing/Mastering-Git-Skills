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

echo "europe_needles.jpg export-ignore" > .gitattributes
git add .gitattributes
git commit -m "Add .gitattributes"

git archive -o attr.zip exif

unzip -l attr.zip

echo "README.md export-subst" >> .gitattributes
echo "Last commit: \$Format:%H$" >> README.md
echo "Last commit date: \$Format:%cd$" >> README.md
git add .gitattributes README.md
git commit -m "Commit info for git archive"

git archive -o attr.zip exif

unzip -p attr.zip README.md
echo ""
echo ""
git log -1 --format="Commit: %H%nDate: %cd"

# Exit subdir
cd ..

set +x
