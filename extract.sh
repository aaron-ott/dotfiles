#!/bin/bash

if [ -d ~/.config/nvim ]; then
	cp -r ~/.config/nvim ./configs/
fi

if [ -d ~/.config/alacritty ]; then
	cp -r ~/.config/alacritty ./configs/
fi
