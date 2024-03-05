" syntax on
set guifont=FantasqueSansMono-Regular:h16
runtime ~/.vim/autoload
set ttyfast
set lazyredraw
execute pathogen#infect()
filetype plugin indent on
set encoding=utf-8
set number
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set clipboard=unnamed
let g:ags_enable_async = 1
let g:ags_agexe = 'rg'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
set rnu
map <C-F> :FZF<space><CR>
map <C-S> :Ag<space><CR>
map <C-b> :Buff<CR>
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
 Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
 Plug 'vim-airline/vim-airline'
 Plug 'airblade/vim-gitgutter'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'cohama/lexima.vim'
 Plug 'tpope/vim-commentary'
 Plug 'terryma/vim-multiple-cursors'
 "Plug 'junegunn/seoul256.vim'
 Plug 'fedepujol/move.nvim'
 Plug 'wincent/vim-clipper'
 Plug 'edkolev/tmuxline.vim'
 "Plug 'cocopon/iceberg.vim'
 Plug 'ghifarit53/tokyonight-vim'
call plug#end()
" Set paths for non-plugin manager managed plugin
set runtimepath^=~/.vim/bundle/vim-move/plugin/move.vim
set timeoutlen=3000
" Airline theme
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
let g:airline_theme='zenburn'
"colorscheme iceberg
"colo seoul256-light
set termguicolors
let g:tokyonight_style = 'night'
colorscheme tokyonight
set backspace=indent,eol,start
set guioptions=
set splitright
set splitbelow
set termguicolors
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'editorconfig/editorconfig-vim'
 " Plugin 'nathanaelkane/vim-indent-guides'
call vundle#end()

noremap <S-l> gt
noremap <S-h> gT
noremap <S-x> :Dispatch rspec %<CR>
nnoremap <Leader><space> :noh<CR>
map <C-t> :NERDTreeToggle<CR>
let g:nerdtree_tabs_autoclose=0
:nnoremap <C-n> :bnext<CR>
:nnoremap <C-p> :bprevious<CR>
:nnoremap <C-f> :FzfLua files<CR>
:nnoremap <C-b> :FzfLua buffers<CR>
:nnoremap <C-s> :FzfLua grep<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
:nnoremap <silent> <Leader>s :FzfLua grep_cword <C-R><C-W><CR>
:nnoremap <silent> <Leader>f :FZF -q <C-R><C-W><CR>
:nnoremap <silent> <Leader>e :NERDTreeFind <CR>
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  }
  \}
let g:airline_left_sep = ''
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
set cursorline
set cursorcolumn
autocmd BufEnter NERD_tree* :LeadingSpaceDisable
set viminfo=
nmap ,cs :call system('nc localhost 8377', expand("%"))<CR>
nmap ,cl :call system('nc localhost 8377', expand("%:p"))<CR>
set foldmethod=syntax
set nofoldenable
let ruby_foldable_groups = 'def'
" highlight VertSplit guibg=Orange guifg=Black ctermbg=6 ctermfg=0
" highlight Visual cterm=NONE ctermbg=0 ctermfg=0 guibg=#af5f00 guifg=white
" Normal-mode commands
nnoremap <silent> <C-j> :MoveLine(1)<CR>
nnoremap <silent> <C-k> :MoveLine(-1)<CR>
nnoremap <silent> <C-l> :MoveHChar(1)<CR>
nnoremap <silent> <C-h> :MoveHChar(-1)<CR>

" Visual-mode commaCds
vnoremap <silent> <C-j> :MoveBlock(1)<CR>
vnoremap <silent> <C-k> :MoveBlock(-1)<CR>
vnoremap <silent> <C-l> :MoveHBlock(1)<CR>
vnoremap <silent> <C-h> :MoveHBlock(-1)<CR>
