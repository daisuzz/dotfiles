#!/bin/zsh

function command_exists() {
  type "$1" &> /dev/null ;
}

: "install brew" && {
  if ! command_exists brew; then
    echo "installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "brew is already installed"
  fi
}

: "install packages by brew" && {
  packages=( peco tig jq rbenv redis mysql chezmoi )
  for package in ${packages[@]}; do
    if ! brew list | grep $package &> /dev/null; then
      echo "installing ${package}..."
      brew install ${package}
    else
      echo "${package} is already installed"
    fi
  done
}

: "install packages by brew cask" && {
  packages=( rectangle  )
  for package in ${packages[@]}; do
    if ! brew list --cask | grep $package &> /dev/null; then
      echo "installing ${package}..."
      brew install --cask ${package}
    else
      echo "${package} is already installed"
    fi
  done
}

: "install sdkman" && {
  if [ ! -e $HOME/.sdkman ]; then
    echo "installing sdkman..."
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
  else
    echo "sdkman is already installed"
  fi
}
