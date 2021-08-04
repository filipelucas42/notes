# Tmux

*   move-window: `move-window -t <number>`

*   change default directory in a session:
    `attach-session -t . -c <dir>`

*   attach to last session: `tmux a`

*   attach to a specific session: `tmux a -t <session>`

*   kill session: `ctrl + A` then press `:` and type `kill-session`

*   kill window: `ctrl + A` - `&`

* copy:
    * copy mode: ctrl + b , [
    * start copying: ctrl + space
    * copy: ctrl + space or alt + space
    * paste: ctrl + b, ]
