#!/bin/bash -e

git clone https://github.com/brk3/vim-config.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc
vim +BundleInstall +qall
