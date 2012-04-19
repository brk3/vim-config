set nocompatible

" Display incomplete commands
set showcmd

" Tabs/Indents
set expandtab
set tabstop=4
set shiftwidth=4

" Line width
set textwidth=79
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)

set background=dark

" Works fine when you save often
set noswapfile

set wrap
set vb t_vb=
set nohlsearch
set ignorecase
set smartcase
set modeline
set dictionary=/usr/share/dict/words

filetype indent on

" Stash backup files in one place
set backup
silent execute '!mkdir ~/.backup 2>/dev/null'
set backupdir=~/.backup/
au BufWritePre * let &bex = '@' . substitute(getcwd(), '/', '%', 'g')

" Syntax highlighting
filetype plugin on
syntax on
highlight LineNr ctermfg=darkgray
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
highlight javaComment ctermfg=DarkGreen

" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ %=%l,%v(%L\L)

" Folds
"set foldnestmax=2
"set foldmethod=indent
au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" JavaImp plugin
let g:JavaImpPaths="/home/bourke/bin/android-sdk-linux_r17/sources/android-15," .
    \ "/home/bourke/sandbox/ActionBarSherlock/library/src," .
    \ "/usr/lib/jvm/java-6-sun-1.6.0.26/src," .
    \ "/home/bourke/sandbox/twitter4j-android-2.2.5/twitter4j-core/src/main/java/twitter4j/"
let g:JavaImpDataDir = $HOME . "/vim/JavaImp"
let g:JavaImpDocViewer = "google-chrome"

" F2 to toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" F4 to call clearmatches()
:nnoremap <F4> :call clearmatches()<CR>

" F5 to delete all trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" F6 to call JavaImp
:nnoremap <F6> :JavaImpSilent<CR>

" F7 to call clean redundant Java imports and sort them
function JavaImpClean()
    %!/home/bourke/bin/clean_imports.sh %
    :JavaImpSort
endfunction
:command JavaImpClean exec JavaImpClean()
:nnoremap <F7> :JavaImpClean<CR>

" S to 'stamp' the current line with yanked text
nnoremap S "_ddP
