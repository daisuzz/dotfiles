#!/bin/zsh

: "install brew" && {
  if ! command_exists brew; then
    info "installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    warn "brew is already installed"
  fi
}

: "install other packages by brew" && {
  packages=( peco tig jq )
  for package in ${packages[@]}; do
    if ! brew list | grep $package &> /dev/null; then
      info "installing ${package}..."
      brew install ${package}
    else
      warn "${package} is already installed"
    fi
  done
}

mkdir -p ~/.zsh/completion

curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > .zsh/completion/_docker

DOT_FILES=(.zshrc .vimrc)

for file in ${DOT_FILES[@]} 
do
 ln -s $HOME/repository/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.peco

ln -s $HOME/repository/dotfiles/.peco/config.json $HOME/.peco/config.json
