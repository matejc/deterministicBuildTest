#!/bin/sh
set -e
#set -x

test -e "$1"

STOREPATH=$(echo "$1" | awk -F/ '{print "/"$2"/"$3"/"$4}')

COMPARE1=$(nix-store -q --hash $STOREPATH)

DERIVER=$(nix-store -q --deriver $STOREPATH)

if [ -f $STOREPATH ]; then
  echo "intruder" >> $STOREPATH
else
  touch $STOREPATH/intruder
fi

#nix-store --ignore-liveness --delete $STOREPATH

#nix-store -r $DERIVER

#nix-store --verify-path $STOREPATH
nix-store --repair-path $STOREPATH


COMPARE2=$(nix-store -q --hash $STOREPATH)

if [ ! "$COMPARE1" = "$COMPARE2" ]; then
  echo "FAILED for $STOREPATH because of $COMPARE1 != $COMPARE2"
  false
fi

#nix-store -q --hash /nix/store/nykzjvhy6dvgmzlnmpf4nadfqvyv5bdy-bee
#nix-store -q --deriver /nix/store/nykzjvhy6dvgmzlnmpf4nadfqvyv5bdy-bee -> /nix/store/gb81sy3qj0gqpc7iiqyvbl44mqns5v3v-bee.drv
#sudo nix-store --ignore-liveness --delete /nix/store/nykzjvhy6dvgmzlnmpf4nadfqvyv5bdy-bee
#nix-store -r /nix/store/gb81sy3qj0gqpc7iiqyvbl44mqns5v3v-bee.drv
#nix-store -q --hash /nix/store/nykzjvhy6dvgmzlnmpf4nadfqvyv5bdy-bee
