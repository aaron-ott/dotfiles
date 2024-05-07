#!/bin/bash

if [ -d ~/.config/nvim ]; then
	cp -r ./configs/nvim ~/.config/
fi

if [ -d ~/.config/alacritty ]; then
	cp -r ./configs/alacritty ~/.config/
fi
