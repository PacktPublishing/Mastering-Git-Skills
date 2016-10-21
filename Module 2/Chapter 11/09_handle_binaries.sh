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
git checkout no_binaries

# Create filters
echo '*.jpg filter=binstore' > .gitattributes

# Create configuration
git config filter.binstore.clean "./put-bin"
git config filter.binstore.smudge "./get-bin"

# Create the clean filter
cat << 'EOF' > put-bin
#!/bin/bash
dest=$(git rev-parse --show-toplevel)/../binstore
mkdir -p $dest
tmpfile=$(git rev-parse --show-toplevel)/tmp
cat > $tmpfile
sha=$(git hash-object --no-filters $tmpfile)
mv $tmpfile $dest/$sha
echo $sha

EOF

# Create the smudge filter
cat << 'EOF' > get-bin
#!/bin/bash
src=$(git rev-parse --show-toplevel)/../binstore
tmpfile=$(git rev-parse --show-toplevel)/tmp
cat > $tmpfile
sha=$(cat $tmpfile)
cat $src/$sha
rm $tmpfile
EOF

chmod +x put-bin
chmod +x get-bin

# Add a picture from exif branch
git cat-file -p 5aac2dff477eebb3da3cb68843b5cc39745d6447 > hello_world.jpg

# Add the file
git add hello_world.jpg

# Record the commit
git commit -m "Added binary"
git log -1 -p

ls -l ../binstore

# Switch branches
git checkout master

ls -l

# Switch back
git checkout no_binaries

ls -l


# Exit subdir
cd ..

set +x
