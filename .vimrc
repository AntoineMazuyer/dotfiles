"""""""""""
" PLUGINS "
"""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'          "Beautiful status bar 
  Plug 'airblade/vim-gitgutter'           "Git status
  Plug 'derekwyatt/vim-fswitch'           "Switch betweem .h  and .cpp
  Plug 'ycm-core/YouCompleteMe'           "Autocompletion
  Plug 'sainnhe/vim-color-forest-night'   "Color scheme
  Plug 'rust-lang/rust.vim'               "Rust
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

"""""""""
" BASIS "
"""""""""

set number

" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Turn on the Wild menu
set wildmenu

"Always show current position
set ruler

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Add a bit extra margin to the left
set foldcolumn=1

" Enable syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
    set hlsearch
    hi Search ctermbg=LightCyan
catch
endtry

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lineshttps://github.com/theodelrieu/dotfiles/blob/master/.ycm_extra_conf.py


" Always show the status line
set laststatus=2

"""""""""""""""""
" PLUGIN CONFIG "
"""""""""""""""""
" git gutter
set updatetime=100

" YCM
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
map <F9> :YcmCompleter FixIt<CR>

" Airline
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" Vim tous les jours
let g:vimtlj_main_dir = '/home/amazuyer/vimtlj'
