# Status bar styling
# Status update interval
set -g status-interval 1

# Basic status bar colors
set -g status-style bg=default,fg=cyan

# Left side of the status bar
set -g status-left-style bg=default,fg=white
set -g status-left-length 40
set -g status-left "[#S] "

# Right side of status bar
set -g status-right-style fg=cyan
set -g status-right-length 40
set -g status-right "#H #[fg=white]« #[fg=yellow]%H:%M:%S #[fg=white]« #[fg=green]%d-%b-%y"

# Window status
set -g window-status-format " #I:#W#F "
set -g window-status-current-format " #I:#W#F "

# Current window status
set -g window-status-current-style bg=cyan,fg=black

# Window with activity status
set -g window-status-activity-style fg=yellow

# Clock mode
set -g clock-mode-colour red
set -g clock-mode-style 24

# Command message
set -g message-command-style bg=default,fg=default

# Mode
set -g mode-style bg=red,fg=default
