Bootstrap
=========

Unix
----
```bash
git clone https://github.com/brk3/vim-config.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/vimrc ~/.vimrc
vim +BundleInstall +qall
```

Windows
-------
```
git clone https://github.com:brk3/vim-config.git %HOME%\vimfiles
git clone https://github.com/gmarik/vundle.git %HOME%\vimfiles\bundle\vundle
mklink %HOME%\_vimrc %HOME%\vimfiles\vimrc
vim +BundleInstall +qall
```
