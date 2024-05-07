#!/bin/bash

if [ -d ~/.config/nvim ]; then
	cp -r ./configs/ ~/.config/nvim
fi

if [ -d ~/.config/alacritty ]; then
	cp -r ./configs/ ~/.config/alacritty
fi
