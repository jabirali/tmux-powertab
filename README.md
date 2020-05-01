# Tmux Soltab

There isn't that much to say about this plugin. It's a Solarized Light theme
for `tmux`, which has a status line that looks more like traditional GUI tabs:

![screenshot](screenshot.png)

The statusline background color is set to `#1d1d1d` to fit well with a surrounding
Ubuntu desktop when run in a borderless terminal, but should look fine in other
settings too. The theme itself sets the background color of each `tmux` pane to
Solarized Light, so I'd recommend setting your terminal background color to a
matching `#1d1d1d` to avoid a bright white line around the tab bar. The top
right corner of the setup shows the current hostname and session name.

To install this plugin with [`tpm`][1], add this to your `tmux.conf`:

	set -g @plugin 'tmux-plugins/tpm'

[1]: https://github.com/tmux-plugins/tpm

