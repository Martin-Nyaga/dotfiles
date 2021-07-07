#!/bin/sh
set -e

cd ~/.vim

# Set up neovim runtime env
VIMRUNTIME=$USERPROFILE/.vim

WIN_USERPROFILE=`wslpath -w $USERPROFILE`
WIN_VIMRUNTIME=`wslpath -w $VIMRUNTIME`

# Copy entire vim runtime folder
mkdir -p $VIMRUNTIME
rsync -av --progress . $VIMRUNTIME --exclude 'plugins/**/*' --exclude 'temp_dirs/**/*'
mkdir -p $VIMRUNTIME/plugins

# Copy init.vim file
mkdir -p $USERPROFILE/AppData/Local/nvim
echo "set runtimepath+=$WIN_VIMRUNTIME

source $WIN_VIMRUNTIME\\\vimrcs\\\main.vim
source $WIN_VIMRUNTIME\\\vimrcs\\\plugins.vim

set runtimepath+=$WIN_VIMRUNTIME\\\after
" > $USERPROFILE/AppData/Local/nvim/init.vim
