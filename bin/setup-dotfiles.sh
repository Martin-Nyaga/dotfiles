#! /usr/bin/env bash

setup_vim () {
  echo "Setting up vim..."
  rm -rf ~/.vim 2> /dev/null
  ln -sf ~/.dotfiles/vim ~/.vim

  # Install vim plug
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  bash ~/.vim/install.sh
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
