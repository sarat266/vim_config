execute pathogen#infect()
syntax on
filetype plugin indent on
set encoding=utf-8
autocmd StdinReadPre * let s:std_in=1
set number
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set clipboard=unnamed
let g:ags_agargs = {
                \ '--break'             : [ '', '' ],
                \ '--color'             : [ '', '' ],
                \ '--color-line-number' : [ '"1;30"', '' ],
                \ '--color-match'       : [ '"32;40"', '' ],
                \ '--color-path'        : [ '"1;31"', '' ],
                \ '--column'            : [ '', '' ],
                \ '--context'           : [ 'g:ags_agcontext', '-C' ],
                \ '--filename'          : [ '', '' ],
                \ '--group'             : [ '', '' ],
                \ '--heading'           : [ '', '-H' ],
                \ '--max-count'         : [ 'g:ags_agmaxcount', '-m' ],
                \ '--numbers'           : [ '', '' ]
                \ }
let g:airline#extensions#tabline#enabled = 1
set rnu
let g:ackprg = "ag --vimgrep"
map <C-F> :Ag<space>
map <C-b> :Buffers
map <C-x> :bd!
map <C-r> :%s/
let g:airline#extensions#tabline#fnamemod = ':t'

command -nargs=1 Vsb call VsbFunction(<f-args>)

function VsbFunction (arg1)
  execute 'vert sb' a:arg1
endfunction


" Install plugins necessary

call plug#begin()

" Easy Align
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'jelera/vim-javascript-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'maksimr/vim-jsbeautify'
Plug 'cohama/lexima.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

" Airline theme
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
set backspace=indent,eol,start
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_light='soft'
let g:indent_guides_enable_on_vim_startup = 1
set guioptions=
set guifont=Fantasque\ Sans\ Mono:h14
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
