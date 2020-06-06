# color
autoload -Uz colors
colors

# prompt
PROMPT='%F{green}[%n@%m]%f %c $ '

# share history
setopt share_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/suzukidaisaku/.sdkman"
[[ -s "/Users/suzukidaisaku/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/suzukidaisaku/.sdkman/bin/sdkman-init.sh"
