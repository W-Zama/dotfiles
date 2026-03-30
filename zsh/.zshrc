# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- PATH ---
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/protobuf@3.20/bin:$PATH"

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

# Go
export GOPATH="$HOME/go"
export GOMODCACHE="$GOPATH/pkg/mod"
export GO111MODULE=on
export GOPROXY="https://proxy.golang.org,direct"
export PATH="$GOPATH/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"

# --- Environment ---
export EDITOR="vi"

# --- Aliases ---
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -lhA'

alias ga='git add'
alias gaa='git add -A'
alias gau='git add -u'
alias gc='git commit'
alias gcm='git commit -m'
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
alias gclr='echo "restore & clean する？ (y/N)" && read -q && echo && git restore . && git clean -fd .'
alias gupdate='git add -A && git commit -m "update"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='claude'
alias cfc='claude -c --fork-session'
alias cfr='claude -r --fork-session'
alias cc='claude -c'
alias cr='claude -r'

alias claude-mem='bun "$HOME/.claude/plugins/cache/thedotmack/claude-mem/10.5.5/scripts/worker-service.cjs"'

# --- Plugins & Tools ---
# sheldon (plugin manager)
eval "$(sheldon source)"

# direnv
eval "$(direnv hook zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
