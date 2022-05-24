# Tmux

*   move-window: `move-window -t <number>`

*   change default directory in a session:
    `attach-session -t . -c <dir>`

*   attach to last session: `tmux a`

*   attach to a specific session: `tmux a -t <session>`

*   kill session: `ctrl + B` then press `:` and type `kill-session`

*   kill window: `ctrl + B` - `&`

* resize:
```
:resize-pane -D (Resizes the current pane down) 

:resize-pane -U (Resizes the current pane upward) 

:resize-pane -L (Resizes the current pane left) 

:resize-pane -R (Resizes the current pane right) 

:resize-pane -D 10 (Resizes the current pane down by 10 cells) 

:resize-pane -U 10 (Resizes the current pane upward by 10 cells) 

:resize-pane -L 10 (Resizes the current pane left by 10 cells) 

:resize-pane -R 10 (Resizes the current pane right by 10 cells) 
```

* copy:
    * copy mode: ctrl + b , [
    * start copying: ctrl + space
    * copy: ctrl + w
    * paste: ctrl + b, ]

* change default directory: `ctrl + B` `:` and `attach -c desired/directory/path`

* kill detached sessions:
```
<~> $ tmux ls
0: 1 windows (created Sat Aug 17 00:03:56 2013) [80x23]
2: 1 windows (created Sat Aug 24 16:47:58 2013) [120x34]

<~> $ tmux kill-session -t 2
```
