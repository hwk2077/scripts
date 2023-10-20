#!/bin/bash

# 检查 $uEmuTESTDIR 变量是否设置
if [ -z "$uEmuTESTDIR" ]; then
    echo "\$uEmuTESTDIR variable is not set"
    exit 1
fi

# 检查 $uEmuTESTDIR 是否是一个目录
if [ ! -d "$uEmuTESTDIR" ]; then
    echo "\"$uEmuTESTDIR\" is not a directory"
    exit 1
fi

cd $uEmuTESTDIR
sudo rm -rf s2e-*
rm -f launch-SymEmu.sh
rm -f SymEmu-config.lua
