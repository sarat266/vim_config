" syntax on
set guifont=FantasqueSansMono-Regular:h16
set ttyfast
set lazyredraw
execute pathogen#infect()
filetype plugin indent on
set encoding=utf-8
" autocmd StdinReadPre * let s:std_in=1
set number
" filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set clipboard=unnamed
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=i:blinkwait700-blinkon400-blinkoff250
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
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
let g:ackprg = "ag --vimgrep"
let g:airline#extensions#tabline#enabled = 1
set rnu
map <C-F> :FZF<space><CR>
map <C-S> :Ag<space><CR>
map <C-b> :Buffers<CR>
map <C-x> :bp<bar>sp<bar>bn<bar>bd<CR>
map <C-r> :%s/
map <C-,> :reg<CR>
map <C-q> :bd!<CR>
let g:airline#extensions#tabline#fnamemod = ':t'

command -nargs=1 Vsb call VsbFunction(<f-args>)

function VsbFunction (arg1)
  execute 'vert sb' a:arg1
endfunction

" Install plugins necessary

call plug#begin()

 Plug 'scrooloose/nerdtree'
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'
 Plug 'vim-airline/vim-airline'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'maksimr/vim-jsbeautify'
 Plug 'cohama/lexima.vim'
 Plug 'tpope/vim-commentary'
 Plug 'drewtempelmeyer/palenight.vim'
 " Plug 'nathanaelkane/vim-indent-guides'
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'blueyed/vim-diminactive'
 Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Set paths for non-plugin manager managed plugin
set runtimepath^=~/.vim/bundle/vim-move/plugin/move.vim
set timeoutlen=3000
" Airline theme
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
set backspace=indent,eol,start
set background=dark
colorscheme palenight
" colorscheme gruvbox
" let g:gruvbox_contrast_light='soft'
let g:indent_guides_enable_on_vim_startup = 1
set guioptions=
set splitright
set splitbelow

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/autoload/Vundle.vim

call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'matze/vim-move'
 Plugin 'editorconfig/editorconfig-vim'
 Plugin 'Yggdroot/indentLine'
call vundle#end()

let g:move_key_modifier = 'C'

nnoremap <M-J> <C-W><C-J>
nnoremap <M-K> <C-W><C-K>
nnoremap <M-L> <C-W><C-L>
nnoremap <A-H> <C-W><C-H>
nnoremap <C-A> :let @*=expand("%:p")<CR>
map <C-t> :NERDTreeToggle<CR>
let g:nerdtree_tabs_autoclose=0
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
:nnoremap <silent> <Leader>s :Ag <C-R><C-W><CR>
:nnoremap <silent> <Leader>f :FZF -q <C-R><C-W><CR>
:nnoremap <silent> <Leader>e :NERDTreeFind <CR>
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:indentLine_char_list = ['┊']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
