
# Start-up

**This repository is personalized.**

After running `Main.sh`

---
### Table of contents

- [Neovim](#How-to-setup-neovim)
- [zsh & Oh My Zsh](#How-to-setup-Zsh)

---

# How to setup neovim

## Requirements

- **Neovim >= v0.7.2**
- **Nodejs >= v12.12**

## Settings

Into **`nvim`**

```vim
:PlugInstall
```

Check out the LSP below and add new languages in exactly the same way.

[LSP](https://github.com/neoclide/coc.nvim/wiki/Language-servers#example-language-server-configuration)

```vim
:CocInstall coc-clangd
:CocInstall coc-pyright

:CocCommand clangd.install
```


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

Change from **.zrhrc** to **ZSH_THEME="power level10k/power level10k"**.

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
