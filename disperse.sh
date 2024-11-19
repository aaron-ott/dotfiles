#!/bin/bash

TARGET_PATH=""

if [ "$(uname)" == "Darwin" ]; then
    TARGET_PATH="~/.config/"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    TARGET_PATH="~/.config/"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    TARGET_PATH="~/AppData/Local/"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    TARGET_PATH="~/AppData/Local/"
fi

if [ -d ~/.config/nvim ]; then
    cp -r ./configs/nvim $TARGET_PATH
fi

if [ -d ~/.config/alacritty ]; then
    cp -r ./configs/alacritty $TARGET_PATH
fi
