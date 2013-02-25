PROMPT_COMMAND='if [ ${#PWD} -gt 25 ]; then SHORT_PWD=${PWD:0:11}...${PWD:${#PWD}-11}; else SHORT_PWD=$PWD; fi'
export PS1='\H:$SHORT_PWD> '

# Command history - don't recall duplicates
export HISTIGNORE="&"

# Personal applications
export PATH="$HOME/bin/script:$HOME/bin:$PATH"
export MANPATH="$HOME/share/man:$HOME/man:$MANPATH"
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
export INCLUDE="$HOME/include:$INCLUDE"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"

# Colours
eval `dircolors ~/.dir_colors`

case $TERM in
    xterm)  [ -e /usr/share/terminfo/x/xterm-256color ] && export TERM='xterm-256color' ;;
    screen) [ -e /usr/share/terminfo/x/screen-256color ] && export TERM='screen-256color'
            [ ! -z "$TERMCAP" ] && export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g') ;;
esac

# Forward X11 if we can, but aren't
if [ -z $DISPLAY ]; then
    export DISPLAY=`remote_x_servers | tail -n 1`
fi

# git tab-completion
. git-completion.bash

# Personal aliases
alias vim='vim -Xp'
alias ls='ls --color=auto'
alias ll='ls --color=auto -ltrh'
alias la='ls --color=auto -a'
alias ssh='ssh -X'

# Progress-reporting copy command
function copy() {
    TARGET=$2
    if [ -d $TARGET ]; then
        TARGET="$2/`basename $1`"
    fi

    if [ -e $TARGET ]; then
        rm -i $TARGET
    fi

    pv $1 > $TARGET
}
