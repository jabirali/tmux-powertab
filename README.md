# Tmux Powertab

This is a `tmux` theme that recreates the look and feel of GUI tabs via powerline 
symbols. By default, it uses the Solarized Light colors; but all colors can be
configured, and the powerline symbols are optional. This is what it looks like:

![screenshot](screenshot.png)

To install this plugin with [`tpm`][1], add this to your `tmux.conf`:

	set -g @plugin 'jabirali/tmux-powertab'

The statusline background color is by default set to `#1d1d1d` to fit well with a 
surrounding Ubuntu desktop when run in a borderless terminal, but should look fine
in other settings too. The theme itself sets the background color of each `tmux`
pane to, so I'd recommend setting your terminal background color to a matching 
`#1d1d1d` to avoid a bright white line around the tab bar. The top right 
corner of the setup shows the current hostname and session name.

# Powerline symbols

By default, the powerline symbols are disabled. This is because they require that you use 
a [patched font][2], and that they require Unicode support that may not work on old hosts.
However, when properly setup, the tab line arguably looks much better with these enabled.
To add the powerline tab edges as shown in the screenshot, add this to your `tmux.conf`:

	set -g @powertab-powerline 'on'

# Path names

In `tmux`, you can manually rename a tab using the keybinding <kbd>Ctrl</kbd>+<kbd>b</kbd> <kbd>,</kbd>.
However, not everyone likes to do this, in which case this plugin can help you automatically rename tabs.
The way it works, is that it lets `tmux` name a tab based on the running process if you're in your
home folder, as is likely to be the case for system monitors, music players, mail clients, etc.
However, once you `cd` to some other folder (e.g. a project you're working on), that is used as
the tab name instead, preventing you from having 10 tabs open that are all named `vim`.

To activate this feature, add the following setting to your `tmux.conf`:

	set -g @powertab-pathname on

# Colorscheme

If you don't like Solarized Light, the colors are also customizable. You can
customize the color of the foreground (text), background, statusline (tab
line), unfocused tab background, unfocused tab foreground, the inactive and
active pane borders, and the right statusline background and foreground.

The main theme colors you can configure are `powertab-foreground`, `powertab-background`,
`powertab-statusline`, and `powertab-unfocustab_bg`. The names should be self-explanatory.
If you set these 4 main colors, the rest of the UI elements are automatically recolored.
To set these, add something like this to your `tmux.conf`:

    set -g @powertab-foreground '#1d1d1d'

The argument should be a hexadecimal color value. Replace the word `foreground` in the 
example above with any of the other attributes you'd like to customize. 

If you want to customize further, you can also manually change the options
`unfocustab_fg`, `focustab_fg`, `statuslineright_bg`, `statuslineright_fg`, all
prefixed with `powertab-`. If left unset, these are automatically set to
sensible values based on the 4 main colors mentioned above.

# Pane borders

By default, the color of the pane borders are matched to the statusline colors. This means that
both active and inactive `tmux` panes are separated by a homogeneously colored grid, a setup that
works quite well if you track focus via the terminal cursor instead of the pane border colors.

This behaviour is however customizable. If you set `powertab-paneborder` to `fg` or `bg`, these
borders will be colored according to the foreground or background theme color, respectively.
Note that setting this to `bg` is effectively the same as disabling pane borders entirely.
If you set it to `auto`, it will use `fg` for active panes and `bg` for inactive panes.

Finally, if you set `powertab-paneborder` and `powertab-activepaneborder` to colors,
you can manually control exactly what colors these parts of the interface have.

[1]: https://github.com/tmux-plugins/tpm
[2]: https://github.com/powerline/fonts
