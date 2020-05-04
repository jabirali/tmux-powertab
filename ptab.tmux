#!/bin/sh
# Tmux tab coloring
    
    for option in foreground background statusline unfocustab_bg unfocustab_fg focustab_fg statuslineright_bg statuslineright_bg statuslineright_fg paneborder activepaneborder 
    do
        export "$option"="$(tmux show-option -gv @ptab-$option 2>&1)"
    done
    if [ -z "$foreground" ]
    then
        foreground='#eeeeec'
    fi
    if [ -z "$background" ]
    then
        background='#300a24'
    fi
    if [ -z "$statusline" ]
    then
        statusline='#300a24'
    fi
    if [ -z "$unfocustab_bg" ]
    then
        unfocustab_bg='#eeeeec'
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
        activepaneborder="$foreground"
    fi

    # Ubuntu
    # COLOR1='#300a24' # background color
    # COLOR2='#eeeeec' # bg of unselected tabs
    # COLOR3='#300a24' # top statusline bg
    # COLOR4='default' # terminal bg color?
    # COLOR5='#eeeeec' # text color (fg)

    # Solarized light
    # COLOR1='#fdf6e3' # background color
    # COLOR2='#363636' # top right statusline bg
    # COLOR3='#1d1d1d' # top statusline bg
    # COLOR4='default' # terminal bg color?
    # COLOR5='#657b83' # text color (fg)
    
	# Powerline tabs.
tmux set -g @tab_0l "#[fg=$statuslineright_fg,bg=$statuslineright_bg]"
tmux set -g @tab_0r "#[bg=$COLOR4,fg=$COLOR2]" #purpose unclear
tmux set -g @tab_1l "#[bg=$statusline,fg=$unfocustab_bg]#[bg=$unfocustab_bg,fg=$unfocustab_fg]"
tmux set -g @tab_1r "#[bg=$statusline,fg=$unfocustab_bg]"
tmux set -g @tab_2l "#[bg=$statusline,fg=$background]#[bg=$background,fg=$focustab_fg]"
tmux set -g @tab_2r "#[bg=$statusline,fg=$background]"

	# # Statusline (general).
tmux set -g status-position top
tmux set -g status-justify left
tmux set-option -g status-style "bg=$statusline"

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
tmux set -g pane-border-style "fg=$paneborder,bg=$background" 
tmux set -g pane-active-border-style "fg=$activepaneborder,bg=$background"

	# Pane contents.
tmux set -g window-style "fg=$foreground,bg=$background"
tmux set -g window-active-style "fg=$foreground,bg=$background"
