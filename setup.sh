#!/bin/zsh

DOT_FILES=(.tmux.conf .zshrc .vimrc)

for file in ${DOT_FILES[@]}
do 
    ln -s $HOME/dotfiles/$file $HOME/$file
done
