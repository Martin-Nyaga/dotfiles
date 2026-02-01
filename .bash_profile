source ~/.dotfiles/.profile

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

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

if [ -e /home/martin/.nix-profile/etc/profile.d/nix.sh ]; then . /home/martin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
