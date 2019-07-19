# CLI Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Add dotfiles to path
export PATH=$PATH:~/.dotfiles/bin

# Function to get git branch 
parse_git_branch () {
  BRANCH=$(git branch 2>/dev/null | grep \* | cut -d ' ' -f2)
  if [ ! -z "$BRANCH" ]
  then
    BRANCH="$BRANCH"
  fi
  echo $BRANCH
}

# Terminal Prompt
export PS1='\e[32m\e[1m\w\e[0m\e[93m ($(parse_git_branch))\e[0m \n→ '

# git completion
source ~/.dotfiles/bash/git-completion.sh

# Rbenv Setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Fzf
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# python3 as default python
alias python='python3'

# Use neovim as default vim
alias vim='nvim'
alias nvimdiff='nvim -d'

# Check disk usage
alias checkdiskusage='du -h -d1 | sort -hr'

# Use vim as editor for react
export REACT_EDITOR=nvim
export EDITOR=nvim

# TMU
export TERM=xterm-256color-italic
alias tmux='tmux -2'

# Common Projects
alias cdvpi='cd ~/Documents/VPI/Repositories/vpi'
alias tvpi='cdvpi && tmux attach-session -t vpi || tmux new -s vpi'

# Common git commands
alias ga='git add --all'
alias gcm='git commit -m'
alias gp='git push'
alias gpu='git push -u origin '
