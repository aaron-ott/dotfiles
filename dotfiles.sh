#!/bin/bash

# Print warning if passed with the wrong number of args
if [ $# -ne 1 ]; then
    echo "Usage: bash dotfiles.sh [push|pull]"
    exit 1
fi

if [ $1 == "push" ]; then

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

elif [ $1 == "pull" ]; then

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

    if [ -d $TARGET_PATH ]; then
        cp -r ./configs/nvim $TARGET_PATH
    fi

    if [ -d $TARGET_PATH ]; then
        cp -r ./configs/alacritty $TARGET_PATH
    fi

else
    echo "Usage: bash dotfiles.sh [push|pull]"
    exit 1
fi
