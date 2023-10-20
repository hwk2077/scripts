#!/bin/bash

read -p "version of ubuntu（jammy/focal/bionic）: " ubuntu_version

sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# source from NJU
cat <<EOF | sudo tee /etc/apt/sources.list
deb https://mirrors.nju.edu.cn/ubuntu/ $ubuntu_version main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ $ubuntu_version-security main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ $ubuntu_version-updates main restricted universe multiverse
deb https://mirrors.nju.edu.cn/ubuntu/ $ubuntu_version-backports main restricted universe multiverse
EOF

sudo apt-get clean && sudo apt-get update && echo "software source has updated"