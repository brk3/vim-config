#!/bin/bash -e

rm -rf ~/.vim*
curl --silent https://raw.githubusercontent.com/brk3/vim-config/master/vimrc -o ~/.vimrc
