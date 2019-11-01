# CLI Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add dotfiles to path
export PATH=$PATH:~/.dotfiles/bin

# Rbenv Setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Fzf
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# python3 as default python
alias python='python3'

# Check disk usage
alias checkdiskusage='du -h -d1 | sort -hr'

# Use vim as editor for react
export REACT_EDITOR=vim
export EDITOR=vim

# TMUX
alias tmux='tmux -2'

# Common Projects
alias cdvpi='cd ~/Documents/VPI/Repositories/vpi'
alias tvpi='cdvpi && tmux attach-session -t vpi || tmux new -s vpi'

# Common git commands
alias ga='git add --all'
alias gcm='git commit -m'
alias gp='git push'
alias gpu='git push -u origin '

# Rust
[ -f ~/.cargo/env ] && source ~/.cargo/env

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Exa
if hash exa 2>/dev/null; then
  alias ls='exa'
  alias l='exa'
  alias ll='exa -l'
  alias lll='exa -al'
fi

# Source tree
alias gitgui='open -a Sourcetree.app'
