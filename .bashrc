#!/bin/bash
source ~/.bash_local

# if [[ "$OSTYPE" == "linux-gnu" ]]; then
if [[ "$OSTYPE" != "win32" ]]; then
	if [ -f /usr/local/share/gitprompt.sh ]; then
		GIT_PROMPT_THEME=Solarized
		. /usr/local/share/gitprompt.sh
	fi
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

