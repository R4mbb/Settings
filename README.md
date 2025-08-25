
# Start-up

- `neovim(LazyVim)`, `tmux`, `zsh`

---
### Table of contents

- [zsh & Oh My Zsh](#How-to-setup-Zsh)
- [tmux](#tmux-setup-file)
- [Neovim(LazyVim)](#How-to-setup-LazyVim)

---

# How to setup Zsh

## Requirements

- **Zsh**
- **powerlevel10k**

## Settings

```bash
sudo apt install zsh
```

```bash
chsh -s $(which zsh)
```

Change from **.zrhrc** to **ZSH_THEME="powerlevel10k/powerlevel10k"**.

Install Oh-my-zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt install fonts-powerline
```

Install **zsh-syntax-highlighting** & **zsh-autosuggestions**

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Then, search for the plugin() section in the ~/.zshrc file and modify it as follows

```bash
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
```

***Font Setting***

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

And Change from **.zshrc** to **plugins=(git zsh-syntax-highlighting zsh-autosuggestions)**

```bash
source .zshrc
```

***Configure p10k***

```bash
p10k configure
```

# How to setup LazyVim

## Requirements

- **Neovim >= v0.7.2** <- Manual Install
- **Nodejs >= v12.12**

```bash
git clone https://github.com/neovim/neovim.git && cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

https://github.com/neovim/neovim

https://deb.nodesource.com/

## Settings

Into **`LazyVim`**

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```

https://github.com/neoclide/coc.nvim/wiki/Language-servers

### Also need to set the font so that the icons look normal, like in NerdTree.

https://github.com/ryanoasis/nerd-fonts/blob/master/readme_ko.md

# tmux setup file

```bash
set -g base-index 0

unbind C-b
set -g prefix C-a
bind-key C-a send-prefix

bind-key R source-file ~/.tmux.conf 
set -g mouse on
set-option -sg escape-time 10

set-option -g default-terminal screen-256color
set -g history-limit 10000
setw -g mode-keys vi

bind-key : command-prompt
bind-key r refresh-client
bind-key L clear-history
bind-key space next-window
bind-key bspace previous-window
bind-key enter next-layout

bind-key v split-window -h
bind-key s split-window -v
bind-key M-Left select-pane -L
bind-key M-Right select-pane -R
bind-key M-Up select-pane -U
bind-key M-Down select-pane -D
bind-key C-o rotate-window
bind-key + select-layout main-horizontal
bind-key = select-layout main-vertical
bind-key a last-pane
bind-key q display-panes
bind-key c new-window
bind-key t next-window
bind-key T previous-window
bind-key [ copy-mode
bind-key ] paste-buffer

# set-option -g status-interval 1
set -g status-position bottom
set -g status-justify left
set -g status-style 'fg=red'
set -g status-bg black
set -g status-fg white
set -g status-interval 60
set -g status-left-length 30
set -g status-left '#[fg=green] #[fg=red]'
set -g status-right '%a %l:%M:%S %p#[default] #[fg=skyblue]%Y-%m-%d'

set -g pane-border-style 'fg=skyblue'
set -g pane-active-border-style 'fg=green'

set -g window-status-current-style 'fg=white bg=skyblue'
setw -g window-status-current-format ' #I #W #F '
setw -g window-status-style 'fg=white bg=black'
setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '

set -g message-style 'fg=yellow bg=red bold'

#don't do anything when a 'bell' rings
set -g visual-activity off
set -g visual-bell off
set -g visual-silence off
setw -g monitor-activity off
set -g bell-action none

# clock mode
setw -g clock-mode-colour yellow

# copy mode
setw -g mode-style 'fg=black bg=red bold'
```
