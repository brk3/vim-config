set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" Bundles
" github repos
Bundle 'garbas/vim-snipmate.git'
Bundle "honza/snipmate-snippets"
Bundle 'honza/snipmate-snippets.git'
Bundle 'kien/ctrlp.vim.git'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-surround.git'
Bundle 'scrooloose/nerdcommenter'

" vim-scripts repos
Bundle 'JavaImp.vim--Lee'
Bundle 'taglist.vim'
Bundle 'bad-whitespace'

" Display incomplete commands
set showcmd

" Tabs/Indents
set expandtab
set tabstop=4
set shiftwidth=4

" Line width
set textwidth=79
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
au FileType gitcommit set tw=72

" Dark terminal background
set background=dark

" Works fine when you save often
set noswapfile

" Search
set nohlsearch
set ignorecase
set smartcase

" Max number of tabs
set tabpagemax=50

" Other
set wrap
set vb t_vb=
set modeline
set dictionary=/usr/share/dict/words "CTRL-X_CTRL-K
set spelllang=en_gb

" Stash backup files in one place
set backup
silent execute '!mkdir ~/.backup 2>/dev/null'
set backupdir=~/.backup/
au BufWritePre * let &bex = '@' . substitute(getcwd(), '/', '%', 'g')

" Syntax highlighting tweaks
highlight LineNr ctermfg=darkgray
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
highlight javaComment ctermfg=DarkGreen

" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ %=%l,%v(%L\L)
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=lightblue
  au InsertLeave * hi StatusLine ctermfg=white
endif

" Folds
"set foldnestmax=2
"set foldmethod=indent
au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" JavaImp plugin
let g:JavaImpPaths=$HOME . "/bin/android-sdk-linux/sources/android-15," .
    \ $HOME . "/sandbox/ActionBarSherlock/library/src," .
    \ "/usr/lib/jvm/jdk1.7.0/src," .
    \ $HOME . "/sandbox/glimmr/src/main/java," .
    \ $HOME . "/sandbox/twitter4j-android-2.2.5/twitter4j-core/src/," .
    \ $HOME . "/sandbox/FlickrjApi4Android/flickrj-android/src"
let g:JavaImpDataDir = $HOME . "/.JavaImp"
let g:JavaImpDocViewer = "google-chrome"

" F2 to toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

:nnoremap <F4> :ToggleBadWhitespace<CR>
:nnoremap <F5> :EraseBadWhitespace<CR>
:nnoremap <F6> :JavaImpSilent<CR>

" F7 to call clean redundant Java imports and sort them
function JavaImpClean()
    %!$HOME/bin/clean_imports.sh %
    :JavaImpSort
endfunction
:command JavaImpClean exec JavaImpClean()
:nnoremap <F7> :JavaImpClean<CR>

" S to 'stamp' the current line with yanked text
nnoremap S "_ddP

" Set makeprg to 'ant debug' for Java files
autocmd BufRead *.java
    \ set makeprg=ant\ -find\ build.xml\ debug
    \|set errorformat=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'gen$\|bin$\|libs$\|\.git$',
  \ 'file': '\.class$\|\.so$|\.png$',
  \ }

" Gui options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

"call pathogen#infect()
