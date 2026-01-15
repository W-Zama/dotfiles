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
alias gp='git push'
alias gs='git status'
alias gss='git status -s'
alias gsw='git sw'
alias gd='git diff'
alias gdn='git diff --name-only'
alias gtr='git gtr'


alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme, as:theme


# プラグインがインストールされていなければインストールする
if ! zplug check --verbose; then
    printf "Install plugins? [y/N]: "
    if read -q; then
        echo
        zplug install
        source ~/.zshrc
    fi
fi

# インストールされたプラグインを読み込む
zplug load --verbose

# --- End of zplug setup ---

export PATH=$HOME/development/flutter/bin:$PATH
export PATH=/opt/homebrew/bin:~/development/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/protobuf@3.20/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Development environment settings
eval "$(direnv hook zsh)"
eval "$(anyenv init -)"
eval "$(pyenv init -)"

# goenv の GOPATH 管理を無効化してから初期化
export GOENV_DISABLE_GOPATH=1
eval "$(goenv init -)"

eval "$(nodenv init -)"

# cd /usr/src/btob-fbz-api
export EDITOR="vi"

# Go 環境設定（goenv init の後に設定）
export GOPATH="$HOME/go"
export GOMODCACHE="$GOPATH/pkg/mod"
export GO111MODULE=on
export GOPROXY="https://proxy.golang.org,direct"
export PATH="$GOPATH/bin:$PATH"
