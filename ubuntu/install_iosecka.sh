#!/bin/bash
RELEASE="27.3.1"
download_dir="/tmp/iosevka-font"
base_url="https://github.com/be5invis/Iosevka/releases/download/v$RELEASE"
font_dir="$HOME/.local/share/fonts/"

mkdir -p "$download_dir" || { echo "无法创建下载目录"; exit 1; }
cd "$download_dir" || { echo "无法进入下载目录"; exit 1; }
wget $base_url/super-ttc-iosevka-$RELEASE.zip || { echo "无法下载字体文件"; exit 1; }
unzip \*.zip

mkdir -p "$font_dir" || { echo "无法创建字体目录"; exit 1; }
mv *.ttc "$font_dir" || { echo "无法移动字体文件"; exit 1; }

fc-cache -f -v || { echo "无法更新字体缓存"; exit 1; }

cd -
rm -r "$download_dir" || { echo "无法清理下载目录"; exit 1; }

echo "Done"
