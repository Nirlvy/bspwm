if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
setopt nonomatch
HISTCONTROL=ignoredups

autoload -U compinit
compinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "\e[3~" delete-char

alias ll='ls -alF'
alias vcam='sudo modprobe v4l2loopback exclusive_caps=1 card_label=OBS Virtual Camera'
alias rvcam='sudo modprobe -r v4l2loopback'
alias p='proxychains'
alias c='clear'
alias v='systemctl start v2raya'
alias n='nvim'

export HYPRSHOT_DIR=~/Pictures/screenshot
export PATH=/home/nirlvy/.local/bin/:$PATH
. "$HOME/.cargo/env"
source /opt/miniconda/etc/profile.d/conda.sh
export PNPM_HOME="/home/nirlvy/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
