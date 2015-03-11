#!/bin/sh
set -e

test -n "$1" 


STOREPATHS=$(nix-store -qR $(realpath `which $1`))

for STOREPATH in $STOREPATHS; do
  ./re-build.sh $STOREPATH
done


#/root/bin/re-build.sh $(realpath `which $1`)
