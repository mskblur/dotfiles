#!/bin/bash

DOT_FILES=(.gitconfig .bashrc .vimrc .viminfo .eslintrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
