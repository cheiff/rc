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
backup_file .vim
backup_file .tmux
if [ $# = 0 ]; then 
  if [[ $(/usr/bin/id -u) -ne 999 ]]; then
    sudo apt-get install tmux ack-grep -y
    sudo apt-get install exuberant-ctags -y
    sudo apt-get install rxvt-unicode-256color ncurses-term -y
  fi
fi
echo "Installing vim files"
#cp -rv ~/rc/.vim ~/
ln -s ~/rc/.vim ~/.vim
ln -s ~/rc/.tmux ~/.tmux
cd ~/rc
git submodule init
git submodule update

echo "GIT_PROMPT_ONLY_IN_REPO=1" >> ~/.bashrc
#echo "source ~/rc/bash-git-prompt/gitprompt.sh" >> ~/.bashrc
mkdir -p ~/.config
ln -s ~/rc/base16-shell ~/.config/base16-shell

echo "BASE16_SHELL=$HOME/.config/base16-shell/ " >> ~/.bashrc
echo '[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"' >> ~/.bashrc
echo "base16_default-dark" >> ~/.bashrc
