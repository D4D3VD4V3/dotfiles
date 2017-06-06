se nocompatible              " be iMproved, required

cal plug#begin()
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ervandew/supertab'
Plug 'jmcantrell/vim-virtualenv', {'for': ['python']}
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', {'for': ['markdown', 'text']}
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'python-mode/python-mode'
Plug 'scrooloose/nerdcommenter' 
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
cal plug#end()

filetype plugin indent on    " required

packadd! matchit
se encoding=utf-8
colo industry
let mapleader="\<Space>"
se history=1000
se autoindent
se smartindent
se autoread
se backspace=indent,eol,start
se tabstop=4
se softtabstop=4
se shiftwidth=4
se expandtab
se foldlevel=99
se foldmethod=indent
se guifont=Fira\ Mono\ for\ Powerline:h12
"Speeds up switching buffers
se hid
se ignorecase
se incsearch
"To keep airline always visible
se laststatus=2
se nohlsearch
se nowrap
se number
se relativenumber
se scrolloff=9
se shortmess+=I
se showcmd
se showmatch
se smartcase
se spell spelllang=en_us
se backup
se undofile
se updatetime=750
se wildmenu

if !isdirectory(expand("~/.vim/tmp")) | cal mkdir(expand("~/.vim/tmp"), "p") | en
se directory=~/.vim/tmp//,.
se backupdir=~/.vim/tmp//,.
se undodir=~/.vim/tmp//,.

se noeb vb t_vb=

se guioptions-=m  "remove menu bar
se guioptions-=T  "remove toolbar
se guioptions-=r  "remove right-hand scroll bar
se guioptions-=L  "remove left-hand scroll bar

syntax enable

aug reload_vimrc
    au!
    au BufWritePost $MYVIMRC source $MYVIMRC
aug END 

aug misc
    au!
    au BufWritePost *.py sil !start /min ctags -R --python-kinds=-i
    au BufWritePre *.py sil PymodeLintAuto 
    au FileType html,css EmmetInstall
    au FileType nerdtree setl relativenumber
    au FileType python nnoremap <buffer> <F5> !start cmd /c python % & pause<cr>
    au QuickFixCmdPost * cwindow
aug END

map <f12> :sil !start /min ctags -R --python-kinds=-i<cr>

noremap <Leader>a ggVG

sil! nmap <F3> :NERDTreeFind<CR>
sil! nmap <F4> :NERDTreeToggle<CR>
sil! nmap <F8> :TagbarToggle<CR>

command! -nargs=* -complete=help H helpgrep <args>

"Default Windows behaviour for Ctrl+Backspace
inoremap <C-BS> <C-W>
cnoremap <C-BS> <C-W>

xnoremap < <gv
xnoremap > >gv

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
nmap <sil> <Leader>e :e $MYVIMRC<CR>
nmap <leader>w :w!<cr>
nmap <leader>v :vs<CR><C-L><C-F>:se scb<CR><C-H>:se scb<CR>

nnoremap <leader>cp :let @*='"' . expand("%:p") . '"'<CR>
nnoremap <leader>cd :let @*='"' . expand("%:p:h") . '"'<CR>
nnoremap <leader>oe :!start <C-R>='"' . expand("%:p:h") . '"'<CR><CR>
nnoremap <C-P> :FZF<CR>

nnoremap <Leader>qo :copen<CR>
nnoremap <Leader>qc :cclose<CR>
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lclose<CR>

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gt :Gcommit -v -q :%p<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :sil! Glog<CR>:bot copen<CR>
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

nnoremap <Left> <C-W><
nnoremap <Right> <C-W>>
nnoremap <Up> <C-W>+
nnoremap <Down> <C-W>-

"No Ex mode ugh
nnoremap Q <nop>

if !exists('g:airline_symbols') | let g:airline_symbols={} | en

let g:airline#extensions#branch#enabled=1
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

let g:NERDTreeIgnore=['\.swp$', '\.un\~$', '\.pyc$', 'tags', '\.ropeproject[[dir]]', '__pycache__[[dir]]']

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=[] 
let g:syntastic_markdown_checkers=['proselint']
let g:syntastic_text_checkers=['proselint']

let g:pymode=1
let g:pymode_indent=1
let g:pymode_lint=1
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_options_max_line_length=119
let g:pymode_lint_cwindow = 1
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_todo_symbol='TD'
let g:pymode_motion=1
let g:pymode_options_colorcolumn=1
let g:pymode_doc = 0
let g:pymode_rope=1
let g:pymode_rope_lookup_project=0
let g:pymode_rope_autoimport=0
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

let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=2
let g:tagbar_iconchars=['▶', '▼']
let g:tagbar_silent=1
let g:tagbar_sort=0

let g:session_autoload = 'no'

"Support for ipdb adapted from https://gist.github.com/berinhard/523420/89ce9864ce60b9053b31c8a26a20ae0355892f3b
func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'sil! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nnoremap <F6> :cal <SID>ToggleBreakpoint()<CR>
