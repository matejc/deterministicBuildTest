#!/bin/sh
set -e

#test -n "$1"

case $1 in
  "command")
    STOREPATHS=$(nix-store -qR $(realpath `which $2`))
    ;;
  "store")
    STOREPATHS=$(nix-store -qR $2)
    ;;
  *)
    echo "usage: $0 <command|store> <arg>"
    false
    ;;
esac


for STOREPATH in $STOREPATHS; do
  ./re-build.sh $STOREPATH
done


#/root/bin/re-build.sh $(realpath `which $1`)
