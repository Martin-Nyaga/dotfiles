PROMPT=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
PROMPT+="%(?:%{$fg[cyan]%}$:%{$fg_bold[red]%}$)%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$FG[016]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[bright_yellow]%}~"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
