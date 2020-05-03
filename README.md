# Tmux ptab

This is a `tmux` status line that looks like traditional GUI tabs using Powerline:

![screenshot](screenshot.png)

This plugin was taken from jabirali from github. They posted this on their github,
but chose to simplify it. I liked how it was before though, so this plugin readds
the powerline symbols.

The colors are set in the COLOR1-COLOR5 variables. Below applied to jabirali's 
original plugin, and could still be important:

The statusline background color is set to `#1d1d1d` to fit well with a surrounding
Ubuntu desktop when run in a borderless terminal, but should look fine in other
settings too. The theme itself sets the background color of each `tmux` pane to
Solarized Light, so I'd recommend setting your terminal background color to a
matching `#1d1d1d` to avoid a bright white line around the tab bar. The top
right corner of the setup shows the current hostname and session name.

To install this plugin with [`tpm`][1], add this to your `tmux.conf`:

	set -g @plugin 'ggadget6/tmux-ptab'

[1]: https://github.com/tmux-plugins/tpm

