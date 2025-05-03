#!/bin/bash

declare -a fonts=(
    CodeNewRoman
    FiraCode
    FiraMono
    Hack
    JetBrainsMono
    SourceCodePro
    SpaceMono
)

version='3.3.0'
fonts_dir="/home/chetvertanovskiy/.local/share/fonts/"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    zip_file="${font}.zip"
    download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
    echo "Downloading $download_url"
    wget "$download_url"
    unzip "$zip_file" -d "$fonts_dir"
    rm "$zip_file"
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv
