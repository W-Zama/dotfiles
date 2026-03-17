# dotfiles

[GNU Stow](https://www.gnu.org/software/stow/) で管理する dotfiles。

## Setup

```bash
brew install stow
git clone git@github.com:W-Zama/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -t ~ <package ...>
```

## Usage

```bash
# インストール
stow -t ~ <package ...>

# アンインストール
stow -D -t ~ <package ...>
```
