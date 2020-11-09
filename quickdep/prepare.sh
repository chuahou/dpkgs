#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2020 Chua Hou

# build binaries
cd $1
make
make dist

# remove source
mv quickdep_*.tar.gz ..
cd ..
rm $(basename $1) -rf

# extract binary tarball as upstream source
tar xzf quickdep_*.tar.gz
rm quickdep_*.tar.gz
