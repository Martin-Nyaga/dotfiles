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
    BRANCH="($BRANCH)"
  fi
  echo $BRANCH
}

# Terminal Prompt
export PS1='\e[1m\e[32m\w\e[0m \e[33m$(parse_git_branch) \e[0m\n→ '

# # git completion
# source ~/.dotfiles/bash/git-completion.sh

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

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
