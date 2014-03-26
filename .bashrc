PROMPT_COMMAND='if [ ${#PWD} -gt 25 ]; then SHORT_PWD=${PWD:0:11}...${PWD:${#PWD}-11}; else SHORT_PWD=$PWD; fi'
PS1='\D{%Y-%m-%d %H:%M} \H:$SHORT_PWD\n'

if [[ $EUID -eq 0 ]]; then
    export PS1="$PS1# "
else
    export PS1="$PS1$ "
fi

# Don't store or recall duplicate or short/unhelpful commands in history
HISTCONTROL="ignoredups:erasedups"
HISTIGNORE="?:??:???:exit:clear:history:git diff:git branch"

# Aggregate & propagate command history across all shells
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Personal applications
export PATH="$HOME/bin/script:$HOME/bin:$PATH:$HOME/.cabal/bin"
export MANPATH="$HOME/share/man:$HOME/man:$MANPATH"
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
export INCLUDE="$HOME/include:$INCLUDE"
export LD_LIBRARY_PATH="$HOME/lib:$LD_LIBRARY_PATH"

export EDITOR=vim

# Colours
eval `dircolors ~/.dir_colors`

# Personal aliases
alias vim='vim -Xp'
alias ls='ls --color=auto'
alias ll='ls --color=auto -ltrh'
alias la='ls --color=auto -a'
alias ssh='ssh -X'
alias tclsh='rlwrap tclsh'
alias make_tags='ctags --tag-relative=yes -R -f .tags'

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
