#!/bin/sh
adduser -DHS nixbld1 && adduser -DHS nixbld2 && adduser -DHS nixbld3 && adduser -DHS nixbld4 && adduser -DHS nixbld5 && adduser -DHS nixbld6 && adduser -DHS nixbld7 && adduser -DHS nixbld8
echo "nixbld:x:30000:nixbld1,nixbld2,nixbld3,nixbld4,nixbld5,nixbld6,nixbld7,nixbld8" >> /etc/group
dir=`mktemp -d` && trap 'rm -rf "$dir"' EXIT && \
    wget -O- http://nixos.org/releases/nix/nix-1.8/nix-1.8-x86_64-linux.tar.bz2  | bzcat | tar x -C $dir && \
    mkdir -m 0755 /nix && USER=root sh $dir/*/install && \
    echo ". /root/.nix-profile/etc/profile.d/nix.sh" >> /etc/profile
