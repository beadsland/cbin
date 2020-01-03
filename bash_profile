#!/usr/bin/env bash

BRW="\e[33m"
NCL="\e[0m"

CHRX=/media/removable/chrx
DEVX=/dev/mmcblk0p7

printf "${BRW}Confirming chrx volume is mounted and executable...${NCL}\n"

# Replaces: https://gist.github.com/DennisLfromGA/b9e8715e6c6851bb827e
# Need debugging mode to not be blown away by chromeos updates to use that,
# so we hard-code it here instead.
if ! grep -qs $CHRX /proc/mounts; then
  [ -e $CHRX ] || sudo mkdir $CHRX
  sudo mount $DEVX $CHRX
fi

# Add the following lines to /etc/rc.local to make the above useful:
#
#   mount --bind /media/removable/chrx/crouton/homebeads /home/beads
#

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
