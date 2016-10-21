#!/bin/bash
# Git Version Control System Cookbook
# Chapter 11 - Git plumbing and other features
#
# Author Aske Olsson
#

# Show whats is happening
set -x

# Getting ready

# Change dir
cd myplumbing

commit1=$(echo 'Initial commit - Good contents' | git commit-tree 4c4493f8029d491d280695e263e24772ab6962ce)
echo $commit1
commit2=$(echo 'Second commit - Better contents' | git commit-tree -p $commit1 2b9697438318f3a62a5e85d14a3b52d69b962907)
echo $commit2
commit3=$(echo 'Adds a subdirectory' | git commit-tree -p $commit2 5c23c103aeaa360342f36fe13a673fa473f665b8)
echo $commit3

# Closer look at the commits
git cat-file -p $commit1
git cat-file -t $commit1
git cat-file -p $commit2
git cat-file -t $commit2
git cat-file -p $commit3
git cat-file -t $commit3


# View history
git log $commit3

# Exit subdir
cd ..

set +x
