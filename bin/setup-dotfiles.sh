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
  echo "Setting up bash profile..."
  ln -sf ~/.dotfiles/.bash_profile ~/.bash_profile
}

setup_oh_my_zsh() {
  echo "Setting up oh-my-zsh..."
  export ZSH="~/.dotfiles/oh-my-zsh"
  rm -rf $ZSH
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Remove oh-my-zsh generated zshrc so that I can instead use my custom one
  rm ~/.zshrc
  ln -sf ~/.dotfiles/.zshrc ~/.zshrc
  rm -rf $ZSH/custom
  ln -sf ~/.dotfiles/oh-my-zsh-custom $ZSH/custom
}

setup_base16() {
  git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

setup_tmux () {
  echo 'Setting up tmux...'
  ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
}

setup_alacritty () {
  echo 'Setting up alacritty config...'
  ln -sf ~/.dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
}

list_todos () {
  echo 'Make sure to run bin/install-deps-{platform}.sh!'
}

# Setup dotfiles
cd
setup_vim
setup_bash_profile
setup_oh_my_zsh
setup_tmux
setup_alacritty
setup_base16
list_todos

echo "Done"
