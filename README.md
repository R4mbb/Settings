
# Start-up

- `neovim(LazyVim)`, `tmux`, `zsh`

---
### Table of contents

- [zsh & Oh My Zsh](#How-to-setup-Zsh)
- [tmux](#tmux-setup-file)
- [Neovim](#How-to-setup-neovim)

---

# How to setup neovim(LazyVim)

## Requirements

- **Neovim >= v0.7.2** <- Manual Install

```bash
sudo apt-get install -y neovim
```

https://github.com/neovim/neovim

- **Nodejs >= v12.12**

https://deb.nodesource.com/

## Settings

Into **`nvim`**

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

```vim
:PlugInstall
```

```vim
:CocInstall coc-clangd
:CocInstall coc-pyright

# If tou get an Error.
:CocCommand clangd.install
```

https://github.com/neoclide/coc.nvim/wiki/Language-servers

###Also need to set the font so that the icons look normal, like in NerdTree.

https://github.com/ryanoasis/nerd-fonts/blob/master/readme_ko.md

#How to setup Zsh

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


# tmux-setup-file

