# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything:
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups

HISTSIZE=1000000
HISTFILESIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -alh'
alias l='ls -CF'
alias rm='rm -i'
alias mv='mv -i'
alias lh='ls -lrthF'
alias whois='/usr/bin/whois -H'
alias vi='/usr/bin/vim'
alias say='/usr/bin/espeak'
alias ssr='sudo su - '

# FROM SUSE
alias c='clear'

# MISC
alias cmx='chmod +x'
alias cdx='chmod -x'
alias diff='colordiff'

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#    ;;
#*)
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#    ;;
#esac

# Comment in the above and uncomment this below for a color prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profiles
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin
export PATH PS1
#export GREP_OPTIONS='--color=auto'
alias grep="/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

unset HISTFILESIZE
export PROMPT_COMMAND="history -a"
shopt -s histappend
export HISTCONTROL=ignoredups:erasedups

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1		;;
             *.tar.gz)    tar xzf $1		;;
             *.bz2)       bunzip2 $1		;;
             *.rar)       rar x $1		     ;;
             *.gz)        gunzip $1		;;
             *.tar)       tar xf $1		;;
             *.tbz2)      tar xjf $1		;;
             *.tgz)       tar xzf $1		;;
             *.zip)       unzip $1		     ;;
             *.Z)         uncompress $1		;;
             *.7z)        7z x $1		     ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

function mkcd(){ mkdir "$1" && cd "$1"; }

function sv(){ sudo vim "$1"; }

export HISTTIMEFORMAT="%h %d - %H:%M:%S: ==> "

source /etc/profile.d/bash_completion.sh
