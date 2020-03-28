# dotfiles

My dotfiles controlled by GNU stow following [this way](https://farseerfc.me/using-gnu-stow-to-manage-your-dotfiles.html)

## Requirements(Linux)

```bash
sudo pacman -S diff-so-fancy exa ripgrep git-extras
```

```bash
cargo install git-brws
```

## 配置 iterm2

设置 Gernernal->Preferences 指定目录为： /Users/wiwen/dotfiles/iterm2
在 profile 中导入 wiwen-dev.json，在 profile 的配色方案中导入 wiwen.itermcolors

## 配置 zsh

stow zsh

## 配置 tmux

```
stow tmux
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
```

## 配置 vim

```
stow vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.py --go-completer  --clang-completer
```

## 配置 vscode