# kinson's AstroNvim Configs

Based on a user configuration template for [AstroNvim](https://github.com/AstroNvim/AstroNvim).

## Required Tools

* [fd](https://github.com/sharkdp/fd)
* [ripgrep](https://github.com/BurntSushi/ripgrep)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```

## Install Notes

### To Get Command + W to Close Buffer

1. Open iterm settings (command + ,)
2. Go to "keys" section
3. Add new key binding for "command + w"
4. Set it to "Send Text with vim Special Characters"
5. Set value to " w" (or whatever <leader>w is)
