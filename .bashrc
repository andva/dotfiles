#!/bin/bash
source ~/.bash_local

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
	
if [[ "$OSTYPE" == "darwin" ]]; then
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		$(brew --prefix)/etc/bash_completion
	fi
	#
	NONE="\[\033[0m\]"    # unsets color to term's fg color
	K="\[\033[0;30m\]"    # black
	G="\[\033[0;32m\]"    # green
	# regular colors
	Y="\[\033[0;33m\]"    # yellow
	B="\[\033[0;34m\]"    # blue
	M="\[\033[0;35m\]"    # magenta
	C="\[\033[0;36m\]"    # cyan
	W="\[\033[0;37m\]"    # white
	# empahsized (bolded) colors
	EMK="\[\033[1;30m\]"
	EMR="\[\033[1;31m\]"
	EMG="\[\033[1;32m\]"
	EMY="\[\033[1;33m\]"
	EMB="\[\033[1;34m\]"
	EMM="\[\033[1;35m\]"
	EMC="\[\033[1;36m\]"
	EMW="\[\033[1;37m\]"
	#
	if [ $? = 0 ]; then
		__cmd_status="${EMG}ツ${NONE}";
	else
		__cmd_status="${EMR}✘${NONE}";
	fi
	if [ "$SSH_CONNECTION" ]; then
		__computer_or_timestamp="${EMK}\h${NONE}";
	else
		__computer_or_timestamp="${EMK}\t${NONE}";
	fi
	source /usr/local/Cellar/git/2.9.0/etc/bash_completion.d/git-completion.bash
	__git_branch='$(__git_ps1)'
	export PS1="$__cmd_status $__computer_or_timestamp ${EMB}\w${M}$__git_branch ${EMY}>${NONE} "
	# Current dir as tab name
	if [ $ITERM_SESSION_ID ]; then
		export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
	fi
#
# elif [[ "$OSTYPE" == "win32" ]]; then

fi

export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTFILESIZE=10000
# Ignore cmds starting with space and remove duplicates
export HISTCONTROL=ignorespace:erasedups
# Append and not overwrite in bash file
shopt -s histappend

alias ll='ls -GFhl'
alias ls='ls -GFh'
alias l.='ls -A'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
#

