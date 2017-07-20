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

# Longer history more useful for searches
HISTSIZE=4096
HISTFILESIZE=$HISTSIZE

# Aggregate & propagate command history across all shells
shopt -s histappend
export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Don't use terminal flow control
[[ $- == *i* ]] && stty -ixon

# Don't use Ctrl+D to exit the shell
set -o ignoreeof

# Personal applications
export PATH="$HOME/bin/script:$HOME/bin:$HOME/.cabal/bin"${PATH:+":$PATH"}
export MANPATH="$HOME/share/man:$HOME/man:$MANPATH"
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig:$HOME/share/pkgconfig"${PKG_CONFIG_PATH:+":$PKG_CONFIG_PATH"}
export CPATH="$HOME/include"${CPATH:+":$CPATH"}
export LD_LIBRARY_PATH="$HOME/lib"${LD_LIBRARY_PATH:+":$LD_LIBRARY_PATH"}
export LIBRARY_PATH="$HOME/lib"${LIBRARY_PATH:+":$LIBRARY_PATH"}
export ACLOCAL_PATH="$HOME/share/aclocal"${ACLOCAL_PATH:+":$ACLOCAL_PATH"}
export PYTHONPATH="$HOME/lib/python2.7/dist-packages:$HOME/lib/python2.7/site-packages"${PYTHONPATH:+":$PYTHONPATH"}

export EDITOR=vim

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
    if [ $# -ne 2 ]; then
	echo "Both source and destination paths required." >&2
	return
    fi

    TARGET=$2
    if [ -d $TARGET ]; then
        TARGET="$2/`basename $1`"
    fi

    if [ -e $TARGET ]; then
	read -p "'$TARGET' exists. Delete? " -r
	if [[ $REPLY =~ ^y(es)?$ ]]; then
	    rm -f $TARGET
	else
	    echo "Doing nothing."
	    return
	fi
    fi

    if [ -e $1 ]; then
	touch $TARGET
	chmod --reference=$1 $TARGET
	pv $1 >> $TARGET
    else
	echo "'$1' doesn't exist." >&2
    fi
}
