#!bin/bash


brew install \
  tmux \
  ripgrep \
  vim

#tmux.conf
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

#vim
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
