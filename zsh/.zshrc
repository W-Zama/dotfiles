# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# NOTE: -t 1 ガードは VSCode 等の shell environment resolution（non-TTY の zsh -ilc）で
# gitstatus が初期化失敗して exit 1 になり、PATH が取り込まれなくなるのを防ぐため
if [[ -t 1 && -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
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

alias reload='source ~/.zshrc'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='claude --model "claude-opus-5[1m]"'
alias cfc='claude -c --fork-session --model "claude-opus-5[1m]"'
alias cfr='claude -r --fork-session --model "claude-opus-5[1m]"'
alias cc='claude -c --model "claude-opus-5[1m]"'
alias cr='claude -r --model "claude-opus-5[1m]"'
alias cn='claude --model "claude-opus-5[1m]" --name'

alias claude-mem='bun "$HOME/.claude/plugins/cache/thedotmack/claude-mem/10.5.5/scripts/worker-service.cjs"'

# --- Plugins & Tools ---
# 対話TTYのみロード（VSCode等の環境解決 zsh -ilc では gitstatus がエラーになるためスキップ）
if [[ -t 1 ]]; then
  # sheldon (plugin manager)
  eval "$(sheldon source)"

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# direnv
eval "$(direnv hook zsh)"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Claude Code
export ENABLE_PROMPT_CACHING_1H=1

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
