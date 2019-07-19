#! /usr/bin/env bash

setup_vim () {
  echo "Setting up vim..."
  rm -rf ~/.vim_runtime 2> /dev/null
  ln -sf ~/.dotfiles/vim_runtime ~/.vim_runtime
  # Install vundle
  rm -rf ~/.vim_runtime/plugins/Vundle.vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim_runtime/plugins/Vundle.vim
  bash ~/.vim_runtime/install.sh
}

setup_bash_profile () {
  echo "Setting up bash_profile..."
  ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
}

setup_tmux () {
  echo 'Setting up tmux...'
  ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
}

# Setup dotfiles
cd
setup_vim
setup_bash_profile
setup_tmux

echo "Done"
