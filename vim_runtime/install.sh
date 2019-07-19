#!/bin/sh
set -e

cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/main.vim
source ~/.vim_runtime/vimrcs/plugins.vim
' > ~/.vimrc
