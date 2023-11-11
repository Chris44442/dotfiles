
https://github.com/jrmoulton/tmux-sessionizer

in .tmux.config add:
```
bind C-o display-popup -E "tms"
unbind C-e
bind C-e display-popup -E "tms switch"
```

create new session, attach to old session, kill

```bash
tmux new-session -sSession1
tmux attach-session -t Session1
tmux kill
```

New window, Switch between windows, Session overview, Horizontal pane add, Vertical pane add

```bash
Ctrl + b, c
Ctrl + b, n
Ctrl + b, s
Ctrl + b, %
Ctrl + b, "
```

