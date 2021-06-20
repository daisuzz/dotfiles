# color
autoload -Uz colors
colors

# prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats "%F{yellow}%b%f"
zstyle ':vcs_info:git:*' actionformats "%F{yellow}%b %a%f"
PROMPT='%F{green}[%n@%m]%f %~ $vcs_info_msg_0_ '

# share history
setopt share_history

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# fix typo
setopt correct

# set vim keybind
# bindkey -v

# no beep
setopt nobeep

# auto cd
setopt auto_cd

# cdpath
cdpath=(~/repository)

# zshcompletions
fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit
compinit -u

# select completion
zstyle ':completion:*' menu select

# zsh-autosuggestions
if [ ! -e ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh  ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# alias
alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias uuuu='cd ../../../../'

alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# git alias
alias gsw='git switch'
alias gsc='git switch -c'
alias gsm='git switch master'
alias grs='git restore'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gst='git status'
alias gfa='git fetch --all --prune'
alias gm='git merge'
alias glo='git log --oneline -n 10'
alias ggpull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias ggpush='git push origin $(git rev-parse --abbrev-ref HEAD)'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR='/Users/daisuzz/.sdkman'
[[ -s '/Users/daisuzz/.sdkman/bin/sdkman-init.sh' ]] && source '/Users/daisuzz/.sdkman/bin/sdkman-init.sh'


# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# Go
export PATH=/usr/local/go:$PATH

# Ruby
eval "$(rbenv init -)"
