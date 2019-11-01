#!/bin/sh
set -e

cd ~/.vim

echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/main.vim
source ~/.vim/vimrcs/plugins.vim
' > ~/.vimrc
ln -sf ~/.vimrc ~/.config/nvim/init.vim
