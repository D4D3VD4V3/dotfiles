set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
"set rtp+=$HOME/vimfiles/bundle/vim-snippets/
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Raimondi/delimitMate'
Plugin 'alvan/vim-closetag'
Plugin 'ervandew/supertab'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf'
Plugin 'junegunn/goyo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic' 
Plugin 'wellle/targets.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

set encoding=utf-8
colorscheme solarized
let mapleader="\<Space>"
set autoindent
set smartindent
set autoread
set background=light
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldlevel=99
set foldmethod=indent
set guifont=Fira\ Mono\ for\ Powerline:h10
"Speeds up switching buffers
set hid
set ignorecase
set incsearch
"To keep airline always visible
set laststatus=2
set nohlsearch
set nowrap
set number
set relativenumber
set scrolloff=9
set shortmess+=I
set showcmd
set showmatch
set smartcase
set spell spelllang=en_us
set undofile
set updatetime=750
set wildmenu

set noeb vb t_vb=

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

syntax enable
filetype plugin on

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END 

augroup misc
    autocmd!
    autocmd BufWritePost *.py :silent !start /min ctags -R --python-kinds=-i
    autocmd BufWritePre *.py :silent PymodeLintAuto
    autocmd FileType html,css EmmetInstall
    autocmd FileType nerdtree setlocal relativenumber
    autocmd FileType python nnoremap <buffer> <F5> :!start cmd /c python % & pause<cr>
    autocmd QuickFixCmdPost * cwindow
augroup END

map <f12> :silent !start /min ctags -R --python-kinds=-i<cr>

noremap <Leader>a ggVG

silent! nmap <F3> :NERDTreeFind<CR>
silent! nmap <F4> :NERDTreeToggle<CR>
silent! nmap <F8> :TagbarToggle<CR>

"Default Windows behaviour for Ctrl+Backspace
inoremap <C-BS> <C-W>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>airlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
nmap <silent> <Leader>e :e $MYVIMRC<CR>
nmap <leader>w :w!<cr>

nnoremap <leader>cf :let @*=expand("%:p")<CR>
nnoremap <C-P> :FZF<CR>
nmap <leader>v :vs<CR><C-L><C-F>:set scb<CR><C-H>:set scb<CR>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q :%p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Gpush<CR>
nnoremap <leader>gpl :Gpull<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"No Ex mode ugh
nnoremap Q <nop>

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_detect_modified=1
let g:airline_powerline_fonts=1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ }

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=[] 

let g:pymode=1
let g:pymode_indent=1
let g:pymode_lint=1
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_options_max_line_length=119
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_todo_symbol='TD'
let g:pymode_motion=1
let g:pymode_options_colorcolumn=1
let g:pymode_doc = 0
let g:pymode_rope=1
let g:pymode_rope_lookup_project=0
let g:pymode_rope_autoimport=1
let g:pymode_rope_completion=1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_syntax=0
let g:pymode_trim_whitespaces=1
let g:pymode_virtualenv=1
"Find a better keybinding
let g:pymode_rope_rename_bind='<C-C>r'

let g:solarized_contrast="high"

"maximize window on startup
au guienter * simalt ~x

let g:virtualenv_auto_activate=1

let g:user_emmet_install_global=0
let g:user_emmet_leader_key="<C-M>"

let NERDTreeShowLineNumbers=1

let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=2
let g:tagbar_iconchars=['▶', '▼']
let g:tagbar_silent = 1

let g:session_autoload = 'no'
let g:session_autosave = 'yes'
