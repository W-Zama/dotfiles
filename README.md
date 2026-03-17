# dotfiles

[GNU Stow](https://www.gnu.org/software/stow/) で管理する dotfiles。

## Setup

```bash
brew install stow
git clone git@github.com:W-Zama/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -t ~ zsh git vim karabiner claude gh ghostty ccstatusline anyenv configstore raycast
```

## Usage

```bash
# 特定のパッケージだけインストール
stow -t ~ zsh git

# シンボリックリンクを削除
stow -D -t ~ zsh
```
