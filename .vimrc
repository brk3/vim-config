set nocompatible
set wrap
set expandtab
set tabstop=4
set shiftwidth=4
set background=dark
set noswapfile
set vb t_vb=
set backup
set nohlsearch
set ignorecase
set smartcase
set modeline
set dictionary=/usr/share/dict/words
set foldnestmax=2

filetype indent on

" stash backup files in one place
silent execute '!mkdir ~/.backup 2>/dev/null'
set backupdir=~/.backup/
"au BufWritePre * let &bex = '@' . substitute(getcwd(), '/', '%', 'g')

" syntax highlighting
filetype plugin on
syntax on
highlight LineNr ctermfg=darkgray

" java specfic
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
highlight javaComment ctermfg=DarkGreen

" eclim settings
let b:EclimLocationListFilter = ["R cannot be resolved to a variable",]
let g:EclimJavaImportExclude = ["^android.R",]
let g:EclimPythonValidate=0

" status line
set laststatus=2
set statusline=%F%m%r%h%w\ %=%l,%v(%L\L)

" save folds
au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" javaimp plugin
let g:JavaImpPaths="/home/bourke/Documents/android-10-src/," .
    \ ""
let g:JavaImpDataDir = $HOME . "/vim/JavaImp"
let g:JavaImpDocPaths = "/home/bourke/bin/android-sdk-linux_x86/docs/reference," .
    \ ""
let g:JavaImpDocViewer = "google-chrome"

" F2 to toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" F5 to delete all trailing whitespace
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" make
"set makeprg=./debug.sh
"set errorformat=%f:%l:%c:%*\\d:%*\\d:%*\\s%m
