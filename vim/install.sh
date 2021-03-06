#!/bin/sh
set -e

cd ~/.vim

echo 'set runtimepath+=~/.vim

source ~/.vim/vimrcs/main.vim
source ~/.vim/vimrcs/plugins.vim

set runtimepath+=~/.vim/after
' > ~/.vimrc
ln -sf ~/.vimrc ~/.config/nvim/init.vim

# Link coc settings
ln -sf ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
