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

# Create the different attributes:
echo '*.jpg filter=binstore' > .gitattributes
echo '*.jpg diff=exif-diff' >> .gitattributes
echo "*.c filter=date-keyword" >> .gitattributes
echo "*.java filter=date-keyword" >> .gitattributes

# Check files on keyword branch
git checkout keyword
git check-attr -a hello_world.c HelloWorld.java

git checkout exif
git check-attr -a hello_world.jpg europe_needles.jpg

# Check single attrubutes:
git check-attr diff hello_world.jpg
git check-attr filter hello_world.jpg

# Empty check
git check-attr -a README.md


# Exit subdir
cd ..

set +x
