#!/bin/sh

echo 'export PATH="/root/bin:$PATH"' >> /root/.bashrc
echo 'set -g default-shell /root/.nix-profile/bin/bash' >> /root/.tmux.conf
