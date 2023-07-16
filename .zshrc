if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/nirlvy/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch histignoredups 
# bindkey -e

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

alias ll='ls -alF --color=auto'
alias c='clear'

export PNPM_HOME="/home/nirlvy/.local/share/pnpm"
export PATH=/home/nirlvy/.local/bin/:$PNPM_HOME:$PATH
#. "$HOME/.cargo/env"
source /opt/miniconda/etc/profile.d/conda.sh

