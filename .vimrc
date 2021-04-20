" syntax on
set guifont=FantasqueSansMono-Regular:h16
runtime autoload/pathogen.vim
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
map <C-b> :Windows<CR>
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
 Plug 'ayu-theme/ayu-vim'
 " Plug 'junegunn/seoul256.vim'
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
let ayucolor="light"
colorscheme ayu
let g:seoul256_light_background = 252
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 Plugin 'matze/vim-move'
 Plugin 'editorconfig/editorconfig-vim'
 Plugin 'Yggdroot/indentLine'
 Plugin 't9md/vim-ruby-xmpfilter'
 Plugin 'kchmck/vim-coffee-script'
call vundle#end()

let g:move_key_modifier = 'C'
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
:nnoremap <silent> <Leader>] :Buff <CR>
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  }
  \}
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_color_term = 239
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

nmap ,w <Plug>(xmpfilter-mark)<CR>
nmap ,e <Plug>(xmpfilter-run)<CR>

autocmd BufEnter NERD_tree* :LeadingSpaceDisable
set viminfo=
nmap ,cs :let @*=expand("%")<CR>
nmap ,cl :let @*=expand("%:p")<CR>
set foldmethod=syntax
set nofoldenable
let ruby_foldable_groups = 'def'
highlight VertSplit guibg=Orange guifg=Black ctermbg=6 ctermfg=0
highlight Visual cterm=NONE ctermbg=0 ctermfg=0 guibg=#af5f00 guifg=white
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
