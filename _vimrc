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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-syntastic/syntastic' 
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'tpope/vim-fugitive'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession' 
Plugin 'tpope/vim-abolish'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'airblade/vim-gitgutter'
Plugin 'Raimondi/delimitMate'
Plugin 'python-mode/python-mode'
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
set relativenumber
set undofile
set incsearch
set hlsearch
set clipboard=unnamed
set spell spelllang=en_us
set ignorecase
set backspace=indent,eol,start
set numberwidth=5
set foldmethod=indent
set foldlevel=99
set showmatch
set smartcase

"nnoremap <C-Up> <C-W>|
" Enable folding
" Enable folding with the spacebar
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
nmap <silent> <Leader>e :e $MYVIMRC<CR>
nmap <leader>w :w!<cr>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
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

let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

let g:ctrlp_mru_files=1
let g:ctrlp_dotfiles=0
let g:ctrlp_show_hidden=0
let g:ctrlp_split_window=0
let g:ctrlp_max_files=0 
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

let g:syntastic_check_open=1

let g:pymode=1
let g:pymode_trim_whitespaces=1
let g:pymode_rope=1
let g:pymode_options_max_line_length=119
let g:pymode_options_colorcolumn=1
let g:pymode_quickfix_minheight=3
let g:pymode_indent=1
let g:pymode_virtualenv=1
let g:pymode_virtualenv_path=$VIRTUAL_ENV
let g:pymode_lint=1
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
