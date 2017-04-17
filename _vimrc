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
"Plugin 'SirVer/ultisnips'
"Plugin 'Yggdroot/indentLine'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'honza/vim-snippets'
"Plugin 'junegunn/rainbow_parentheses.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-obsession' 
"Plugin 'vim-scripts/Gundo'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-session'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Raimondi/delimitMate'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'jmcantrell/vim-virtualenv' "python-mode also has virtualenv support?
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'mtth/scratch.vim'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic' 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set encoding=utf-8
" Put your non-Plugin stuff after this line
"set confirm
colorscheme solarized
let mapleader="\<Space>"
set autoindent
set autoread
set background=light
set backspace=indent,eol,start
set clipboard=unnamed
set cursorcolumn
set cursorline
set foldlevel=99
set foldmethod=indent
set guifont=Fira\ Mono\ for\ Powerline:h8
"Speeds up switching buffers
set hid
set ignorecase
set incsearch
set laststatus=2
set nohlsearch
set nowrap
set number
set relativenumber
set scrolloff=5
set shortmess+=I
set showcmd
set showmatch
set smartcase
set spell spelllang=en_us
set undofile
set wildmenu
syntax enable
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

filetype plugin on

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

augroup tamebuffers
    autocmd!
    autocmd FileType * setlocal number
    autocmd FileType * setlocal relativenumber
augroup END
noremap <Leader>a ggVG

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
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nnoremap <F3> :Lexplore "getcwd()"<CR>
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

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

"let g:airline#extensions#wordcount#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_detect_modified=1
let g:airline_powerline_fonts = 1
"let g:airline_section_b = airline#section#create('%{virtualenv#statusline()}')

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=[] "I'm removing syntastic's python checkers because I've already got python-mode for that

let g:pymode=1
let g:pymode_doc=1
let g:pymode_doc_bind='K'
let g:pymode_indent=1
let g:pymode_lint=1
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
let g:pymode_motion=1
let g:pymode_options_colorcolumn=1
let g:pymode_options_max_line_length=119
let g:pymode_quickfix_minheight=3
let g:pymode_rope=1
let g:pymode_rope_autoimport=0
let g:pymode_rope_completion=0
let g:pymode_rope_rename_bind='<C-c>rr'
let g:pymode_run=1
let g:pymode_run_bind='<leader>r'
let g:pymode_syntax=0
let g:pymode_trim_whitespaces=1
let g:pymode_virtualenv=1

"let g:UltiSnipsSnippetsDir='/Users/david/.vim/mysnippets'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

let g:netrw_liststyle=3
"Show line numbers in netrw
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:solarized_contrast="high"

"Maximize window on startup
au GUIEnter * simalt ~x
