#!/bin/bash
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
if [ -f ~/.screenrc ]; then
  mv ~/.screenrc ~/.screenrc.old
fi
if [ -f ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf.old
fi
ln -s ~/rc/.vimrc ~/.vimrc
ln -s ~/rc/.screenrc ~/.screenrc
ln -s ~/rc/.tmux.conf ~/.tmux.conf
