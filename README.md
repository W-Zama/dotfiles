# dotfiles

[GNU Stow](https://www.gnu.org/software/stow/) で管理する dotfiles。

## Installation

### 1. Install GNU Stow

```bash
brew install stow
```

### 2. Clone the repository

```bash
git clone git@github.com:W-Zama/dotfiles.git ~/dotfiles
```

### 3. Run the install script

```bash
.bin/install.sh
```

全パッケージのシンボリックリンクを `~` 配下に作成します。

## Usage

```bash
# 全パッケージをインストール
.bin/install.sh

# 特定のパッケージだけインストール
.bin/install.sh zsh git

# シンボリックリンクを削除
.bin/install.sh -D

# 特定のパッケージだけ削除
.bin/install.sh -D zsh
```

## Packages

| Package | Contents |
|---|---|
| `zsh` | `.zshrc` |
| `git` | `.gitconfig`, `.config/git/ignore` |
| `vim` | `.vimrc` |
| `karabiner` | `.config/karabiner/karabiner.json` |
| `claude` | `.claude/settings.json` |
| `gh` | `.config/gh/config.yml`, `.config/gh/hosts.yml` |
| `ghostty` | `.config/ghostty/config` |
| `ccstatusline` | `.config/ccstatusline/settings.json` |
| `anyenv` | `.config/anyenv/anyenv-install/` |
| `configstore` | `.config/configstore/update-notifier-takt.json` |
| `raycast` | `.config/raycast/` |
