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
#zle-keymap-select () {
  #case $KEYMAP in
    #vicmd) print -rn -- $'\e[0;31m$ \e[0m';; #$terminfo[cvvis];; # block cursor
    #viins|main) print -rn -- $terminfo[cnorm];; # less visible cursor
  #esac
#}
#
#
 #change cursor colour depending on vi mode
#zle-keymap-select () {
  #if [ "$TERM" = "rxvt-unicode-256color" ]; then
#if [ $KEYMAP = vicmd ]; then
#echo -ne "\033]12;red\007"
    #else
#echo -ne "\033]12;grey\007"
    #fi
#fi
#}; zle -N zle-keymap-select
#zle-line-init () {
  #zle -K viins
  #echo -ne "\033]12;grey\007"
#}; zle -N zle-line-init



#function zle-keymap-select zle-line-init
#{
    ## change cursor shape in iTerm2
    #case $KEYMAP in
        #vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        #viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    #esac

    #zle reset-prompt
    #zle -R
#}

#function zle-line-finish
#{
    #print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
#}

#zle -N zle-line-init
#zle -N zle-line-finish
#zle -N zle-keymap-select
##http://stackoverflow.com/questions/3622943/zsh-vi-mode-status-line
#

#set terminal vim insert mode change timeout to 10ms
KEYTIMEOUT=1

# See: https://github.com/ndbroadbent/scm_breeze
#[ -s "/Users/ozziegooen/.scm_breeze/scm_breeze.sh" ] && source "/Users/ozziegooen/.scm_breeze/scm_breeze.sh"
#[ -s "/home/ozzi/.scm_breeze/scm_breeze.sh" ] && source "/home/ozzie/.scm_breeze/scm_breeze.sh"
#
#Get FuzzySearch!
#Cntr-r to load history
#Cntr-t to load files
source ~/.fzf.zsh

bindkey -s '^a' 'cd ..\n ; ls \n'


# urxvt (and family) accepts even #RRGGBB
INSERT_PROMPT="grey"
COMMAND_PROMPT="red"

# helper for setting color including all kinds of terminals
set_prompt_color() {
    if [[ $TERM = "linux" ]]; then
       # nothing
    elif [[ $TMUX != '' ]]; then
        printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
    else
        echo -ne "\033]12;$1\007"
    fi
}

# change cursor color basing on vi mode
zle-keymap-select () {
    if [ $KEYMAP = vicmd ]; then
        set_prompt_color $COMMAND_PROMPT
    else
        set_prompt_color $INSERT_PROMPT
    fi
    RPS1="${${KEYMAP/vicmd/X}/(main|viins)/|}"
    RPS2=$RPS1
    zle reset-prompt
}

zle-line-finish() {
    set_prompt_color $INSERT_PROMPT
}

zle-line-init () {
    zle -K viins
    set_prompt_color $INSERT_PROMPT
    RPS1="${${KEYMAP/vicmd/X}/(main|viins)/|}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

#zle -N zle-line-init
#zle -N zle-keymap-select
