# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -lhA'

alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
alias gc='git commit'
alias gcm='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias gss='git status -s'
alias gl='git log'
alias gsw='git sw'
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-only'
alias gtr='git gtr'
alias gtrn='git gtr new'
alias gtre='git gtr edit'
alias gr='git restore'
alias gr.='git restore .'
alias gps='git push -u origin HEAD'
alias gpl='git pull'
alias gb='git branch --sort=-committerdate'
alias gm-='git merge -'
alias gclr='git restore . && git clean -fd .'
alias gupdate='git add -A && git commit -m "update"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='claude'
alias cf='claude -c --fork-session'
alias cc='claude -c'
alias cr='claude -r'

# zplug installation check
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
fi

# --- zplug setup ---

# zplugを初期化（'zplug'コマンドを使えるようにする）
source ~/.zplug/init.zsh

# zplug自身とプラグインの宣言
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-autosuggestions", as:plugin
zplug "zsh-users/zsh-syntax-highlighting", as:plugin
zplug "romkatv/powerlevel10k", as:theme, depth:1


# プラグインがインストールされていなければインストールする
if ! zplug check; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo
        zplug install
        source ~/.zshrc
    fi
fi

# インストールされたプラグインを読み込む
zplug load

# --- End of zplug setup ---

export PATH=$HOME/development/flutter/bin:$PATH
export PATH=/opt/homebrew/bin:~/development/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/protobuf@3.20/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Development environment settings
eval "$(direnv hook zsh)"

# anyenv は pyenv/goenv/nodenv を内部で初期化するので、個別の init は不要
# eval "$(anyenv init -)"  # 重いので遅延ロードに置き換え

# pyenv (遅延ロード)
export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

# goenv (遅延ロード)
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.anyenv/envs/goenv"
export PATH="$GOENV_ROOT/bin:$GOENV_ROOT/shims:$PATH"

# nodenv (遅延ロード)
export NODENV_ROOT="$HOME/.anyenv/envs/nodenv"
export PATH="$NODENV_ROOT/bin:$NODENV_ROOT/shims:$PATH"

# cd /usr/src/btob-fbz-api
export EDITOR="vi"

# Go 環境設定（goenv init の後に設定）
export GOPATH="$HOME/go"
export GOMODCACHE="$GOPATH/pkg/mod"
export GO111MODULE=on
export GOPROXY="https://proxy.golang.org,direct"
export PATH="$GOPATH/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/wataru.zama/.bun/_bun" ] && source "/Users/wataru.zama/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='bun "/Users/wataru.zama/.claude/plugins/cache/thedotmack/claude-mem/10.5.5/scripts/worker-service.cjs"'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
