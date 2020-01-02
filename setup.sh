#!/usr/bin/env bash

BRW="\e[33m"
NCL="\e[0m"

HOME=/home/chronos/user
CBIN=/media/removable/chrubuntu/crouton/homebeads/bin/cbin

printf "${BRW}Confirming cbin is mounted and executable...${NCL}\n"
if ! grep -qs '/mnt/foo' /proc/mounts; then
  [ -e $HOME/cbin ] || sudo mkdir $HOME/cbin
  sudo mount --bind $CBIN $HOME/cbin
fi
sudo mount $HOME/cbin -o remount,exec

printf "${BRW}Relinking bashrc ${NCL}(just to be sure)...\n"
cd $HOME
rm $HOME/.bashrc
ln -s $CBIN/bashrc $HOME/.bashrc

#printf "${BRW}Preparing shill to let openvpn live ${NCL}...\n"
$HOME/cbin/prepvpn
