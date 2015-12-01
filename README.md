Bootstrap
=========

Unix
----
```bash
curl https://raw.githubusercontent.com/brk3/vim-config/master/bootstrap.sh | bash
```

Windows
-------
```
git clone https://github.com:brk3/vim-config.git %HOME%\vimfiles
git clone https://github.com/gmarik/vundle.git %HOME%\vimfiles\bundle\vundle
mklink %HOME%\_vimrc %HOME%\vimfiles\vimrc
vim +BundleInstall +qall
```
