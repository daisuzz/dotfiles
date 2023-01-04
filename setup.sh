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
  packages=( peco tig jq rbenv)
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
  packages=( rectangle )
  for package in ${packages[@]}; do
    if ! brew list --cask | grep $package &> /dev/null; then
      echo "installing ${package}..."
      brew install --cask ${package}
    else
      echo "${package} is already installed"
    fi
  done
}

mkdir -p ~/.zsh/completion
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > .zsh/completion/_docker

DOT_FILES=(.zshrc .vimrc)
for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/$file ]; then
    ln -s $HOME/repository/dotfiles/$file $HOME/$file
  else
    echo "$file already exists"
  fi
done

# peco
mkdir -p $HOME/.peco
if [ ! -e $HOME/.peco ]; then
  ln -s $HOME/repository/dotfiles/.peco/config.json $HOME/.peco/config.json
else
  echo ".peco already exists"
fi

: "install sdkman" && {
  if [ ! -e $HOME/.sdkman ]; then
    echo "installing sdkman..."
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
  else
    echo "sdkman is already installed"
  fi
}
