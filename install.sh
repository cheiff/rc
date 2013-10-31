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
if [[ $(/usr/bin/id -u) -ne 999 ]]; then
  sudo apt-get install tmux -y
fi
