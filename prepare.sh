#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou
#
# Generic preparation script.
#
# Usage: ./prepare.sh <package> <tag>
#
# Gets upstream of <package> (based on the folder name) and prepares it
# according to <package>/prepare.sh, then prepares it for building in build/.

set -e

PACKAGE=$1
GIT_TAG=$2

mkdir -p build

if [ ! -f $PACKAGE/.git ]; then
	# clone upstream if not a submodule
	UPSTREAM_URL=$(awk '/Homepage:/{print $2}' $PACKAGE/debian/control)
	git clone --depth 1 --branch $GIT_TAG $UPSTREAM_URL build/$PACKAGE

	# copy debian folder over
	cp -r $PACKAGE/debian build/$PACKAGE
else
	# otherwise, just copy entire submodule over
	git -C $PACKAGE checkout $GIT_TAG
	cp -r $PACKAGE build/$PACKAGE
fi
