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
git checkout keyword

# Check the files
cat hello_world.c
cat HelloWorld.java

# Create attributes file for *.c and *.java
git config filter.date-keyword.clean 'perl -pe "s/\\\$Date[^\\\$]*\\\$/\\\$Date\\\$/"'
git config filter.date-keyword.smudge 'perl -pe "s/\\\$Date[^\\\$]*\\\$/\\\$Date: `git log -1 --all --format=%ad -- $1`\\\$/"'

echo "*.c filter=date-keyword" > .gitattributes
echo "*.java filter=date-keyword" >> .gitattributes

cat HelloWorld.java
rm HelloWorld.java
git checkout HelloWorld.java
cat HelloWorld.java

# Change the files to output hello again, world
sed -i '' 's/, w/ again, w/' HelloWorld.java

git add HelloWorld.java
git diff -U5 --cached

sed -i '' 's/, w/ again, w/' hello_world.c
git add hello_world.c
git add .gitattributes

git commit -m "Add date-keyword filter for *.c and *.java files"

cat hello_world.c

git checkout master
git checkout keyword

head -1 hello_world.c
head -1 HelloWorld.java

# Exit subdir
cd ..

set +x
