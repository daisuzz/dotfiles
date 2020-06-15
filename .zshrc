# color
autoload -Uz colors
colors

# prompt
PROMPT='%F{green}[%n@%m]%f %c $ '

# share history
setopt share_history

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# fix typo
setopt correct

# set vim keybind
bindkey -v

# no beep
setopt nobeep

# auto cd
setopt auto_cd

# cdpath
cdpath=(~/repository)

# zshcompletions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# docker completions
zstyle ':completion:*:*:docker:*' option-stacking yes

# select completion
zstyle ':completion:*' menu select

# alias
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias uuuu="cd ../../../../"

alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

# git alias
alias gsw="git switch"
alias gsc="git switch -c"
alias gsm="git switch master"
alias gb="git branch"
alias gba="git branch -a"
alias gst="git status"
alias gfa="git fetch --all --prune"
alias gm="git merge"
alias glo="git log --oneline -n 10"
alias ggpull="git pull"
alias ggpush="git push"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/daisuzz/.sdkman"
[[ -s "/Users/daisuzz/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/daisuzz/.sdkman/bin/sdkman-init.sh"


# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

