set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
set laststatus=2
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-syntastic/syntastic' 
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv' "python-mode also has virtualenv support?
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession' 
Plugin 'tpope/vim-abolish'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-unimpaired'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/rainbow_parentheses.vim'
"Plugin 'vim-scripts/Gundo'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mtth/scratch.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set encoding=utf-8
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax enable
set background=light
colorscheme solarized
let mapleader="\<Space>"
set guifont=Fira\ Mono\ for\ Powerline:h10
set number
set wrap
set relativenumber
set undofile
set incsearch
set nohlsearch
set clipboard=unnamed
set spell spelllang=en_us
set ignorecase
set backspace=indent,eol,start
set numberwidth=5
set foldmethod=indent
set foldlevel=99
set showmatch
set smartcase
set showcmd
set noerrorbells
set autoindent
set autoread
set wildmenu
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
"Speeds up switching buffers
set hid
"nnoremap <C-Up> <C-W>|
" Enable folding
" Enable folding with the spacebar
silent! nmap <F5> :GundoToggle<CR>
silent! nmap <F4> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

"let g:NERDTreeMapActivateNode="<F3>"
"let g:NERDTreeMapPreview="<F4>"

filetype plugin on

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

"set winheight=30
"set winminheight=5
""python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
  "project_base_dir=os.environ['VIRTUAL_ENV']
  "activate_this=os.path.join(project_base_dir, 'bin/activate_this.py')
  "execfile(activate_this, dict(__file__=activate_this))
"EOF

noremap <Leader>sa ggVG
noremap U <C-r>
noremap H 0
noremap L $
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
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
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nnoremap <leader>cf :let @*=expand("%:p")<CR>
nnoremap <C-P> :FZF<CR>
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
nnoremap <leader>f 1z=
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap Q <nop>
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
"autocmd VimEnter * RainbowParentheses

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif


let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=[] "I'm removing syntastic's python checkers because I've already got python-mode for that

let g:pymode=1
let g:pymode_syntax=0
let g:pymode_motion=1
let g:pymode_doc=1
let g:pymode_doc_bind='K'
let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_trim_whitespaces=1
let g:pymode_rope=0
let g:pymode_rope_completion=1
let g:pymode_rope_autoimport=0
let g:pymode_rope_rename_bind='<C-c>rr'
let g:pymode_options_max_line_length=119
let g:pymode_options_colorcolumn=1
let g:pymode_quickfix_minheight=3
let g:pymode_indent=1
let g:pymode_virtualenv=1
let g:pymode_virtualenv_path=$VIRTUAL_ENV
let g:pymode_lint=1
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
