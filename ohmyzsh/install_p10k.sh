#!/bin/bash

echo "plz download recommended font from https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

source ~/.zshrc
