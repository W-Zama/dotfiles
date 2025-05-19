# Aliases
alias ll='ls -l'
alias la='ls -a'

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
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/opt/homebrew/bin:~/development/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/protobuf@3.20/bin:$PATH"

eval "$(anyenv init -)"
eval "$(direnv hook zsh)"
