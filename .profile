# CLI Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add dotfiles to path
export PATH=$PATH:~/.dotfiles/bin
export PATH=$PATH:~/.local/bin

# Rbenv Setup
[ -f ~/.rbenv/bin/rbenv ] &&
  export PATH="$HOME/.rbenv/bin:$PATH" &&
  eval "$(rbenv init -)"

# Fzf
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# Check disk usage
alias checkdiskusage='du -h -d1 | sort -hr'

# print csv as table
printcsv() {
   sed 's/,,/, ,/g;s/,,/, ,/g' $1 | column -s, -t | less -S
}

# Use vim as editor for react
export REACT_EDITOR=nvim
export EDITOR=nvim

# Use neovim as default vim
alias vim='nvim'

# Common Projects
alias cdd='cd $HOME/.dotfiles'
alias cddotfiles='cd $HOME/.dotfiles'

# Rust
[ -f ~/.cargo/env ] && source ~/.cargo/env

# Exa
if hash exa 2>/dev/null; then
  alias ls='exa'
  alias l='exa'
  alias ll='exa -l'
  alias lll='exa -al'
fi

# LESS
export LESS='--RAW-CONTROL-CHARS'

# ZSH autosuggestions
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
  [ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
  eval "$("$BASE16_SHELL/profile_helper.sh")"

# Base 16 Theme
base16_material-darker

# Platform specific settings
[ -f ~/.dotfiles/.profile.extra ] && source ~/.dotfiles/.profile.extra

# GPG
export GPG_TTY=$(tty)

# Direnv
hash direnv 2>/dev/null && eval "$(direnv hook zsh)"

