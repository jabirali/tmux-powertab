#!/bin/sh

# Tab colors.
tmux set -g @soltab0 '#[fg=#fdf6e3,bg=#363636]'
tmux set -g @soltab1 '#[bg=#363636,fg=#fdf6e3]'
tmux set -g @soltab2 '#[bg=#fdf6e3,fg=#1d1d1d]'

# Statusline (general).
tmux set -g status-position top
tmux set -g status-justify left
tmux set-option -g status-style "bg=#1d1d1d"

# Statusline (left).
tmux set -g status-left " "

# Statusline (right).
tmux set -g status-right-length 24
tmux set -g status-right "#{@soltab0} #H: #S "

# Statusline (center).
tmux setw -g window-status-separator ""
tmux set -g window-status-format "#{@soltab1}  #I #W  "
tmux set -g window-status-current-format "#{@soltab2}  #I #W  "

# Pane borders.
tmux set -g pane-border-style 'fg=#1d1d1d,bg=#fdf6e3' 
tmux set -g pane-active-border-style 'fg=#1d1d1d,bg=#fdf6e3'

# Pane contents.
tmux set -g window-style 'fg=#657b83,bg=#fdf6e3'
tmux set -g window-active-style 'fg=#657b83,bg=#fdf6e3'
