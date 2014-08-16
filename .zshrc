#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

#for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

export TERM="xterm-256color"

export ANDROID_HOME=$HOME/Downloads/adt-bundle-linux-x86_64-20140702/sdk
PATH=${PATH}:$ANDROID_HOME/tools

alias ll='ls -lah'
alias copy='xsel -ib'
alias paste='xsel -b'

alias g='git status'
alias gc='git commit -m'
alias gal='git commit -am'
alias gpom='git checkout master; git pull origin master'
alias ,q='exit'

bindkey -v

#http://unix.stackexchange.com/questions/547/make-my-zsh-prompt-show-mode-in-vi-mode
zle-keymap-select () {
  case $KEYMAP in
    vicmd) print -rn -- $terminfo[cvvis];; # block cursor
    viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  esac
}
#http://stackoverflow.com/questions/3622943/zsh-vi-mode-status-line
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

#set terminal vim insert mode change timeout to 10ms
KEYTIMEOUT=1
