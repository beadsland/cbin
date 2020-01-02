# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

CHRX=/media/removable/chrx

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Make for a more powerful crosh.
source $CHRX/crouton/homebeads/bin/cbin/setup.sh
PATH=~/cbin:$PATH

alias go="sudo ~/cbin/launch"
alias back="~/cbin/backup"
alias xiwi="sudo ~/cbin/xiwi"
alias nope="touch ~/cbin/dontgo"
alias less="cat"
