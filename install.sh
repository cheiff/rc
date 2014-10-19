#!/bin/bash

function backup_file {
  if [ -f ~/$1 ]; then
    mv ~/$1 ~/$1.old
    echo "Backing up $1"
  fi
  echo "Installing new $1"
  ln -s ~/rc/$1 ~/$1
}

backup_file .vimrc
backup_file .screenrc
backup_file .tmux.conf
if [ $# = 0 ]; then 
  if [[ $(/usr/bin/id -u) -ne 999 ]]; then
    sudo apt-get install tmux -y
    sudo apt-get install exuberant-ctags -y
  fi
fi
echo "Installing vim files"
#cp -rv ~/rc/.vim ~/
ln -s ~/rc/.vim ~/.vim
ln -s ~/rc/.tmux ~/.tmux
cd ~/rc
git submodule init
git submodule update

