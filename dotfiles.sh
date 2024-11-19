#!/bin/bash

# Print warning if passed with the wrong number of args
if [ $# -ne 1 ]; then
    echo "Usage: bash dotfiles.sh [push|pull]"
    exit 1
fi

if [ $1 == "pull" ]; then

    TARGET_PATH=""

    if [ "$(uname)" == "Darwin" ]; then
        TARGET_PATH="$HOME/.config"
        echo "Pulling for MacOS to path ${TARGET_PATH}"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        TARGET_PATH="$HOME/.config"
        echo "Pulling for Linux to path ${TARGET_PATH}"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        TARGET_PATH="$HOME/AppData/Local"
        echo "Pulling for Windows to path ${TARGET_PATH}"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        TARGET_PATH="$HOME/AppData/Local"
        echo "Pulling for Windows to path ${TARGET_PATH}"
    fi

    if [ -d "${TARGET_PATH}/nvim" ]; then
        cp -r -v ./configs/nvim $TARGET_PATH/
    fi

    if [ -d "${TARGET_PATH}/alacritty" ]; then
        cp -r -v ./configs/alacritty $TARGET_PATH/
    fi

elif [ $1 == "push" ]; then

    SOURCE_PATH=""

    if [ "$(uname)" == "Darwin" ]; then
        SOURCE_PATH="$HOME/.config"
        echo "Pushing from MacOS path ${SOURCE_PATH}"
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        SOURCE_PATH="$HOME/.config"
        echo "Pushing from Linux path ${SOURCE_PATH}"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
        SOURCE_PATH="$HOME/AppData/Local"
        echo "Pushing from Windows path ${SOURCE_PATH}"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        SOURCE_PATH="$HOME/AppData/Local"
        echo "Pushing from Windows path ${SOURCE_PATH}"
    fi

    if [ -d $SOURCE_PATH/nvim ]; then
        cp -r -v $SOURCE_PATH/nvim ./configs/
    fi

    if [ -d $SOURCE_PATH/alacritty ]; then
        cp -r -v $SOURCE_PATH/alacritty ./configs/
    fi

else
    echo "Usage: bash dotfiles.sh [push|pull]"
    exit 1
fi
