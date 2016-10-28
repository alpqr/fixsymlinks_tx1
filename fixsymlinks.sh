#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "usage ./cmd rootfs_path"
    exit -1
fi
ROOTFS=$(readlink -f $1)
cd $ROOTFS/usr/lib/aarch64-linux-gnu
find . -maxdepth 1 -type l | while read i;
do qualifies=$(readlink $i | grep '^\(/usr\)\?/lib')
   if [ -n "$qualifies" ]; then
       newPath=$(readlink $i | grep '^\(/usr\)\?/lib' | xargs echo $ROOTFS | sed -e s/\\s//g)
       echo $i
       echo $newPath;
       rm $i;
       ln -s $newPath $i;
   fi
done
