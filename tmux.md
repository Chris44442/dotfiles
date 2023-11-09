
https://github.com/jrmoulton/tmux-sessionizer

in .tmux.config add:
```
bind C-o display-popup -E "tms"
unbind C-e
bind C-e display-popup -E "tms switch"
```

create new session

```bash
tmux new-session -sSession1
```

attach to old session

```bash
tmux attach-session -t Session1
```

New window

```bash
Ctrl + b, c
```

Switch between windows

```bash
Ctrl + b, n
```

Kill options

```bash
tmux kill
```

Session overview

```bash
Ctrl + b, s
```

Horizontal pane add

```bash
Ctrl + b, %
```

Vertical pane add

```bash
Ctrl + b, "
```
