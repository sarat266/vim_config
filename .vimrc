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
set rnu
map <C-F> :FZF<space><CR>
map <C-S> :Ag<space><CR>
map <C-b> :Buffers<CR>
map <C-x> :bp<bar>sp<bar>bn<bar>bd<CR>
map <C-r> :%s/
map <C-,> :reg<CR>
map <C-q> :q!<CR>
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
 Plug 'pangloss/vim-javascript'
 Plug 'mxw/vim-jsx'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'junegunn/seoul256.vim'

call plug#end()
" Set paths for non-plugin manager managed plugin
set runtimepath^=~/.vim/bundle/vim-move/plugin/move.vim
set timeoutlen=3000
" Airline theme
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
let g:airline_theme='zenburn'
set backspace=indent,eol,start
set guioptions=
set splitright
set splitbelow

set termguicolors
let g:seoul256_background = 235
colo seoul256
set background="dark"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'matze/vim-move'
 Plugin 'editorconfig/editorconfig-vim'
 Plugin 'Yggdroot/indentLine'
 Plugin 't9md/vim-ruby-xmpfilter'
 call vundle#end()

let g:move_key_modifier = 'C'

" nnoremap <M-j> <C-W><C-J>
" nnoremap <M-k> <C-W><C-K>
" nnoremap <M-l> <C-W><C-L>
" nnoremap <M-h> <C-W><C-H>
noremap <S-l> gt
noremap <S-h> gT
nnoremap <Leader><space> :noh<CR>
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
    \  }
  \}

"let g:indentLine_char_list = ['┊']
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_color_term = 239
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline
let g:lightline = { 'colorscheme': 'plastic' }
map <A-W> <Plug>(xmpfilter-mark)
map <A-E> <Plug>(xmpfilter-run)

autocmd BufEnter NERD_tree* :LeadingSpaceDisable
"set cursorline
"hi cursorline cterm=none term=none
"autocmd WinEnter * setlocal cursorline
"autocmd WinLeave * setlocal nocursorline
"highlight CursorLine guibg=#303000 ctermbg=234
set viminfo=
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>
highlight VertSplit cterm=NONE
