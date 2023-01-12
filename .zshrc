# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch
setopt nonomatch
HISTCONTROL=ignoredups
# End of lines configured by zsh-newuser-install

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
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

alias vcam='sudo modprobe v4l2loopback devices=1 video_nr=2 exclusive_caps=1 card_label="VirtualWebCam"'
alias rvcam='sudo modprobe -r v4l2loopback'
alias p='proxychains'
alias c='clear'
alias v='systemctl start v2raya'

export PATH=/home/nirlvy/.local/bin/:$PATH
# export PATH=$PATH:~/.yarn/bin
. "$HOME/.cargo/env"
