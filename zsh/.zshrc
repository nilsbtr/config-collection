# Oh My Zsh

export ZSH="$HOME/.oh-my-zsh"

plugins=(
brew
copyfile
copypath
extract
eza
git
node
npm
nvm
pip
pyenv
python
sudo
vscode
zoxide
zsh-autosuggestions
zsh-syntax-highlighting
)

zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'icons' yes

# Starship

source $ZSH/oh-my-zsh.sh

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

# Java Home

export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$JAVA_HOME/bin:$PATH"

# Bun Home

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# GO Version Manager

[[ -s "/Users/nilsbtr/.gvm/scripts/gvm" ]] && source "/Users/nilsbtr/.gvm/scripts/gvm"

# fzf

source <(fzf --zsh)

# bat

export BAT_THEME="OneHalfDark"

# Aliases

fcd() {
  local dir
  dir=$(fd --type d --hidden --follow --exclude .git . | fzf \
    --prompt="Navigate into: " \
    --preview 'tree -C {} | head -50') || return 0

  cd "$dir"
}

fnv() {
  local file
  file=$(fd --type f --hidden --follow --exclude .git . | fzf \
    --prompt="Edit file: " \
    --preview 'bat --style=numbers --color=always --line-range :500 {}') || return 0

  nvim "$file"
}

alias nv=nvim

# Android Home

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Antigravity
export PATH="/Users/nilsbtr/.antigravity/antigravity/bin:$PATH"
export GPG_TTY=$(tty)

# Add local bin

. "$HOME/.local/bin/env"
