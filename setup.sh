#!/usr/bin/env bash

HOME=/home/chronos/user
CHRX=/media/removable/chrx
CBIN=$CHRX/crouton/homebeads/bin/cbin

printf "${BRW}Confirming cbin is mounted and executable...${NCL}\n"

if ! grep -qs "$HOME/cbin" /proc/mounts; then
  [ -e $HOME/cbin ] || sudo mkdir $HOME/cbin
  sudo mount --bind $CBIN $HOME/cbin
fi

sudo mount $HOME/cbin -o remount,exec

printf "${BRW}Relinking bashrc ${NCL}(just to be sure)...\n"
cd $HOME

rm $HOME/.bash_profile
cp $CBIN/bash_profile $HOME/.bash_profile # We can't rely on softlink if DEVX unmounted
rm $HOME/.bashrc
ln -s $CBIN/bashrc $HOME/.bashrc

printf "${BRW}Preparing shill to let openvpn live ${NCL}...\n"
$HOME/cbin/prepvpn

printf "${BRW}Confirming crouton is current and installed...${NCL}\n"
curl  -Lo ~/Downloads/crouton https://goo.gl/fd3zc
sudo install -Dt /usr/local/bin -m 755 ~/Downloads/crouton
