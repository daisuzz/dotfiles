# よく使うエイリアスやら各コマンドのデフォルトのオプションを設定
alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias sshvps='ssh tk2-211-15409.vs.sakura.ne.jp'

# プロンプトの表示をカスタマイズ
export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$ \[\033[00m\]'
export HISTSIZE='10000'

