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

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

export TERM="xterm-256color"


export ANDROID_HOME=$HOME/Downloads/adt-bundle-linux-x86_64-20140702/sdk
PATH=${PATH}:$ANDROID_HOME/tools

alias ll='ls -lah --color'
alias copy='xsel -ib'
alias paste='xsel -b'
