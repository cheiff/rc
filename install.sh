#!/bin/bash
if [ -f ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi
if [ -f ~/.screenrc ]; then
  mv ~/.screenrc ~/.screenrc.old
fi
ln -s ~/rc/.vimrc ~/.vimrc
ln -s ~/rc/.screenrc ~/.screenrc
