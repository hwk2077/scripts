#!/bin/bash

firmware_dir="$HOME/hwk-test/d1_iot_mqtt_example"
firware_name="liteos"
firmware_path="$firmware_dir/$firware_name.elf"
config_path="$firmware_dir/$firware_name.cfg"
test_dir=$firmware_dir/uEmu-test

mkdir -p $test_dir
cp SymEmu-helper.py library.lua SymEmu-config-template.lua launch-SymEmu-template.sh $test_dir  
cd $test_dir
python3 SymEmu-helper.py ARMv7m $firmware_path $config_path -o $test_dir --debug
./launch-SymEmu.sh debug
cd -