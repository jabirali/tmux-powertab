#!/bin/sh
# Tmux tab coloring

    powerline_l=''
    powerline_r=''
    for option in foreground background statusline unfocustab_bg unfocustab_fg focustab_fg statuslineright_bg statuslineright_fg paneborder activepaneborder powerline activeborder
    do
        export "$option"="$(tmux show-option -gv @soltab-$option 2>&1)"
    done
    if [ -z "$foreground" ]
    then
        foreground='#657b83'
    fi
    if [ -z "$background" ]
    then
        background='#fdf6e3'
    fi
    if [ -z "$statusline" ]
    then
        statusline='#1d1d1d'
    fi
    if [ -z "$unfocustab_bg" ]
    then
        unfocustab_bg='#363636'
    fi
    if [ -z "$unfocustab_fg" ]
    then
        unfocustab_fg="$background"
    fi
    if [ -z "$focustab_fg" ]
    then
        focustab_fg="$unfocustab_bg"
    fi
    if [ -z "$statuslineright_bg" ]
    then
        statuslineright_bg="$unfocustab_bg"
    fi
    if [ -z "$statuslineright_fg" ]
    then
        statuslineright_fg="$unfocustab_fg"
    fi
    if [ -z "$paneborder" ]
    then
        paneborder="$background"
    fi
    if [ -z "$activepaneborder" ]
    then
        if [ "$activeborder" = 'on' ]
        then
            activepaneborder="$foreground"
        else
            activepaneborder="$paneborder"
        fi
    fi
    if [ "$powerline" = 'on' ]
    then
        powerline_l=""
        powerline_r=""
    fi

	# Powerline tabs.
tmux set -g @tab_0l "#[fg=$statuslineright_fg,bg=$statuslineright_bg]"
tmux set -g @tab_1l "#[bg=$statusline,fg=$unfocustab_bg]$powerline_l#[bg=$unfocustab_bg,fg=$unfocustab_fg]"
tmux set -g @tab_1r "#[bg=$statusline,fg=$unfocustab_bg]$powerline_r"
tmux set -g @tab_2l "#[bg=$statusline,fg=$background]$powerline_l#[bg=$background,fg=$focustab_fg]"
tmux set -g @tab_2r "#[bg=$statusline,fg=$background]$powerline_r"

	# Statusline (general).
tmux set -g status-position top
tmux set -g status-justify left
tmux set-option -g status-style "bg=$statusline"

	# Statusline (left).
tmux set -g status-left " "

	# Statusline (right).
tmux set -g status-right-length 24
tmux set -g status-right "#{@tab_0l} #H#{?#{==:#S,0},,: #S} "

	# Statusline (center).
tmux setw -g window-status-separator ""
tmux set -g window-status-format "#{@tab_1l} #I #{?#{==:#{pane_current_path},$HOME},#W,#{b:pane_current_path}} #{@tab_1r}"
tmux set -g window-status-current-format "#{@tab_2l} #I #{?#{==:#{pane_current_path},$HOME},#W,#{b:pane_current_path}} #{@tab_2r}"

	# Pane borders.
tmux set -g pane-border-style "fg=$paneborder,bg=$background" 
tmux set -g pane-active-border-style "fg=$activepaneborder,bg=$background"

	# Pane contents.
tmux set -g window-style "fg=$foreground,bg=$background"
tmux set -g window-active-style "fg=$foreground,bg=$background"
