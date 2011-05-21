set autoindent
set wrap
set smartindent
set paste
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

" syntax highlighting
filetype plugin on
syntax on
highlight LineNr ctermfg=darkgray

" java specfic
let java_highlight_all=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
highlight javaComment ctermfg=DarkGreen

" status line
set laststatus=2
set statusline=%F%m%r%h%w\ %=%l,%v(%L\L)

" save folds
au BufWinLeave * mkview
au BufWinEnter *.* silent loadview

" javaimp
"let g:JavaImpPaths=""
