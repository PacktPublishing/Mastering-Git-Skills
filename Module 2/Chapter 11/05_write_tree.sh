#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

# Getting ready

# Initialize and change dir
cd myplumbing

# Update the index with the first version of mytest.txt
git update-index --add --cacheinfo 100644 926e8ffd3258ed6edd1e254438f02fd24e417acc mytest.txt

# Write the tree to the database
tree1=$(git write-tree)
echo $tree1

# Add the second version of mytest.txt
git update-index --cacheinfo 100644 6b3da706d14c3820597ec7109f163bc144dcbb22 mytest.txt

# Write the tree to the database
tree2=$(git write-tree)
echo $tree2

# Add the first object we created in a subfolder
git update-index --add --cacheinfo 100644 6722adde028a6f29809f42c3c0e24ce6d1b2715a sub/other.txt

# Write the tree to the database
tree3=$(git write-tree)
echo $tree3

git cat-file -p $tree1
git cat-file -t $tree1


git cat-file -p $tree2
git cat-file -t $tree2

git cat-file -p $tree3
git cat-file -t $tree3



# Exit subdir
cd ..

set +x
