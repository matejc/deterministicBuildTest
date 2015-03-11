deterministicBuildTest
======================


Build
-----

On host:


    docker build -t deterministicBuildTest/nix .


To run the docker:


    docker run -v ~/workarea/nixpkgs:/root/nixpkgs -v $PWD/src:/root/bin -v /nix/store --privileged -t -i deterministicBuildTest/nix /root/.nix-profile/bin/tmux


Usage
-----

Inside Docker container:


Rebuild by command (command must be in PATH environment variable):

    re-wrap.sh command python


Rebuild by store path (this store path must be in current profile):

    re-wrap.sh store /nix/store/kmfhrzy1lg77q9ncy81p38b73ms41lhv-nano-2.3.6/
