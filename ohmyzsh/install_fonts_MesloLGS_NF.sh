#!/bin/bash

# 指定下载目录
download_dir="/tmp/meslo_fonts"

# 创建下载目录
mkdir -p "$download_dir" || { echo "无法创建下载目录"; exit 1; }
cd "$download_dir" || { echo "无法进入下载目录"; exit 1; }

# 下载 MesloLGS NF 字体文件
fonts_to_download=(
    "MesloLGS%20NF%20Regular.ttf"
    "MesloLGS%20NF%20Bold.ttf"
    "MesloLGS%20NF%20Italic.ttf"
    "MesloLGS%20NF%20Bold%20Italic.ttf"
)

base_url="https://github.com/romkatv/powerlevel10k-media/raw/master/"

for font in "${fonts_to_download[@]}"; do
    wget "$base_url$font" || { echo "无法下载字体文件: $font"; exit 1; }
done

font_dir="$HOME/.local/share/fonts/"
mkdir -p "$font_dir" || { echo "无法创建字体目录"; exit 1; }
mv *.ttf "$font_dir" || { echo "无法移动字体文件"; exit 1; }

# 更新字体缓存
fc-cache -f -v || { echo "无法更新字体缓存"; exit 1; }

# 清理下载目录
cd ..
rm -r "$download_dir" || { echo "无法清理下载目录"; exit 1; }

echo "Done"
