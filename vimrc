set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" Bundles
" github repos
Bundle 'kien/ctrlp.vim.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'vim-ruby/vim-ruby'

" vim-scripts repos
Bundle 'JavaImp.vim--Lee'
Bundle 'taglist.vim'
Bundle 'bad-whitespace'

" Display incomplete commands
set showcmd

" Relative linenumbers
"set relativenumber

" Tabs/Indents
set expandtab
set tabstop=4
set shiftwidth=4

autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" Line width
set textwidth=79
au FileType gitcommit set tw=72
highlight longLine ctermfg=DarkRed
au BufWinEnter * let w:m2=matchadd('longLine', '\%>79v.\+', -1)

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

" Syntax highlighting
syntax on
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
highlight LineNr ctermfg=darkgray
highlight javaComment ctermfg=DarkGreen

" Status line
set laststatus=2

" Folds
"set foldnestmax=2
"set foldmethod=indent
au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" JavaImp plugin
let g:JavaImpPaths=
            \ $ANDROID_HOME . "/sources/android-17," .
            \ $JAVA_HOME . "/src," .
            \ $HOME . "/.m2"
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

" \l to list available snippets
nnoremap <leader>l :call UltiSnips_ListSnippets()<CR>

" CtrlP plugin
let g:ctrlp_custom_ignore = {
  \ 'dir':  'gen$\|bin$\|libs$\|\.git$|\target$',
  \ 'file': '\.class$\|\.so$|\.png$',
  \ }

" Gui options
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

set noshowmode
