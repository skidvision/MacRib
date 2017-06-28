#!/bin/bash

# installpkg.sh
# RenderMan
#
# Created by flip phillips on 10/03/04.
# Copyright 2004 ebv. All rights reserved.
#
# $Id: installpkg.sh 20 2007-06-02 16:34:39Z flip $
#
#

set -x
PKG_NAME=RenderMan

MMAPKGS=~/Library/Mathematica/Applications
PKG_DIR=$MMAPKGS/$PKG_NAME
PLATFORM=MacOSX-x86-64

echo "Installing Mathematica Packages into $MMAPKGS"

if [ -d ${PKG_DIR} ] ; then
    /bin/rm -rf ${PKG_DIR}
fi

# move most recent package files into real directory 
#cp $SOURCE_ROOT/package/$PKG_NAME/Internal/Source/*.m $SOURCE_ROOT/package/$PKG_NAME
# we have none here

# install in mma package directory
cp -r $SOURCE_ROOT/package/$PKG_NAME $MMAPKGS


# copy executable
mkdir -p $MMAPKGS/$PKG_NAME/$EXECUTABLE_NAME/$PLATFORM/
cp $TARGET_BUILD_DIR/$EXECUTABLE_NAME $MMAPKGS/$PKG_NAME/$EXECUTABLE_NAME/$PLATFORM/

# kill source
rm -r $PKG_DIR/Internal

echo "done"
