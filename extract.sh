#!/bin/bash

SOURCE_PATH=""

if [ "$(uname)" == "Darwin" ]; then
    SOURCE_PATH="~/.config"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    SOURCE_PATH="~/.config"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    SOURCE_PATH="~/AppData/Local"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    SOURCE_PATH="~/AppData/Local"
fi

if [ -d $SOURCE_PATH/nvim ]; then
    cp -r $SOURCE_PATH/nvim ./configs/
fi

if [ -d $SOURCE_PATH/alacritty ]; then
    cp -r $SOURCE_PATH/alacritty ./configs/
fi
