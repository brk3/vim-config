#!/bin/bash -e

rm -rf ~/.vim*
git clone https://github.com/brk3/vim-config.git /tmp
cp /tmp/vim-config/vimrc ~/.vimrc
