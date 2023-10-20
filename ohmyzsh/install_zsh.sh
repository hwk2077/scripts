#!/bin/bash

echo "This script may require reboot. Do you want to continue? (y/n)"
read user_input

if [ "$user_input" == "y" ] || [ "$user_input" == "Y" ]; then
  sudo apt-get update && sudo apt-get install -y terminator zsh curl wget vim git
  chsh -s $(which zsh)
  reboot
else
    echo "Script execution aborted."
fi
