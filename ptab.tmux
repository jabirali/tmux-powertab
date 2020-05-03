#!/bin/sh
# Tmux tab coloring
    COLOR1='#fdf6e3' #'default'
    COLOR2='#363636' #'default'
    COLOR3='#1d1d1d' #'default'
    COLOR4='default' #'default'
    COLOR5='#657b83' #'default'
    
	# Powerline tabs.
tmux set -g @tab_0l "#[fg=$COLOR1,bg=$COLOR2]"
tmux set -g @tab_0r "#[bg=$COLOR4,fg=$COLOR2]"
tmux set -g @tab_1l "#[bg=$COLOR4,fg=$COLOR2]#[bg=$COLOR2,fg=$COLOR1]"
tmux set -g @tab_1r "#[bg=$COLOR4,fg=$COLOR2]"
tmux set -g @tab_2l "#[bg=$COLOR4,fg=$COLOR1]#[bg=$COLOR1,fg=$COLOR3]"
tmux set -g @tab_2r "#[bg=$COLOR4,fg=$COLOR1]"

	# # Statusline (general).
tmux set -g status-position top
tmux set -g status-justify left
tmux set-option -g status-style "bg=$COLOR3"

	# # Statusline (left).
tmux set -g status-left " "

	# # Statusline (right).
tmux set -g status-right-length 24
tmux set -g status-right "#{@tab_0l} #H#{?#{==:#S,0},,: #S} #{@tab_0r}"

	# # Statusline (center).
tmux setw -g window-status-separator ""
tmux set -g window-status-format "#{@tab_1l} #I #{?#{==:#{pane_current_path},$HOME},#W,#{b:pane_current_path}} #{@tab_1r}"
tmux set -g window-status-current-format "#{@tab_2l} #I #{?#{==:#{pane_current_path},$HOME},#W,#{b:pane_current_path}} #{@tab_2r}"

	# Pane borders.
tmux set -g pane-border-style "fg=$COLOR3,bg=$COLOR1" 
tmux set -g pane-active-border-style "fg=$COLOR3,bg=$COLOR1"

	# Pane contents.
tmux set -g window-style "fg=$COLOR5,bg=$COLOR1"
tmux set -g window-active-style "fg=$COLOR5,bg=$COLOR1"
