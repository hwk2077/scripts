#!/bin/bash
RELEASE="27.3.1"
mkdir /tmp/iosevka-font/$RELEASE
cd /tmp/iosevka-font/$RELEASE
wget https://github.com/be5invis/Iosevka/releases/download/v$RELEASE/super-ttc-iosevka-$RELEASE.zip
unzip \*.zip
sudo cp *.ttc /usr/local/share/fonts/
cd /usr/local/share/fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache
cd -
fc-list
