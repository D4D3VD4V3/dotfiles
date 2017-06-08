se nocp              " be iMproved, required

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
Plug 'wakatime/vim-wakatime'
Plug 'wellle/targets.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
cal plug#end()

pa! matchit
se enc=utf-8
colo industry
let mapleader="\<Space>"
se hi=1000
se ai
se si
se ar
se backspace=indent,eol,start
se ts=4
se sts=4
se sw=4
se et
se fdl=99
se fdm=indent
se gfn=Fira\ Mono\ for\ Powerline:h12
"Speeds up switching buffers
se hid
se ic
se is
"To keep airline always visible
se ls=2
noh
se nowrap
se nu
se rnu
se so=9
se shm+=I
se sc
se sm
se scs
se bk
se udf
se ut=750
se wmnu

if !isdirectory(expand("~/.vim/tmp")) | cal mkdir(expand("~/.vim/tmp"), "p") | en
se dir=~/.vim/tmp//,.
se bdir=~/.vim/tmp//,.
se udir=~/.vim/tmp//,.

se noeb vb t_vb=

se go-=m
se go-=T
se go-=r
se go-=L

syn enable

aug all
    au!
    au BufWritePost $MYVIMRC so $MYVIMRC
    au BufWritePost *.py sil !start /min ctags -R --python-kinds=-i
    au BufWritePre *.py sil PymodeLintAuto 
    au FileType html,css EmmetInstall
    au FileType nerdtree setl rnu
    au FileType python nn <buffer> <F5> !start cmd /c python % & pause<cr>
    "maximize window on startup
    au GuiEnter * sim ~x
    au QuickFixCmdPost * cw
aug END

map <f12> :sil !start /min ctags -R --python-kinds=-i<cr>

no <Leader>a ggVG

sil! nm <F3> :NERDTreeFind<CR>
sil! nm <F4> :NERDTreeToggle<CR>
sil! nm <F8> :TagbarToggle<CR>

com! -nargs=* -complete=help H helpg <args>

"Default Windows behaviour for Ctrl+Backspace
ino <C-BS> <C-W>
cno <C-BS> <C-W>

xn < <gv
xn > >gv

nm <leader>1 <Plug>AirlineSelectTab1
nm <leader>2 <Plug>airlineSelectTab2
nm <leader>3 <Plug>AirlineSelectTab3
nm <leader>4 <Plug>AirlineSelectTab4
nm <leader>5 <Plug>AirlineSelectTab5
nm <leader>6 <Plug>AirlineSelectTab6
nm <leader>7 <Plug>AirlineSelectTab7
nm <leader>8 <Plug>AirlineSelectTab8
nm <leader>9 <Plug>AirlineSelectTab9
nm <leader>- <Plug>AirlineSelectPrevTab
nm <leader>+ <Plug>AirlineSelectNextTab
nm <silent> <Leader>e :e $MYVIMRC<CR>
nm <leader>w :w!<cr>
nm <leader>v :vs<CR><C-L><C-F>:se scb<CR><C-H>:se scb<CR>

nn <leader>cp :let @*='"' . expand("%:p") . '"'<CR>
nn <leader>cd :let @*='"' . expand("%:p:h") . '"'<CR>
nn <leader>oe :!start <C-R>='"' . expand("%:p:h") . '"'<CR><CR>
nn <C-P> :FZF<CR>

nn <Leader>qo :cope<CR>
nn <Leader>qc :ccl<CR>
nn <Leader>lo :lop<CR>
nn <Leader>lc :lcl<CR>

" fugitive git bindings
nn <leader>ga :Git add %:p<CR><CR>
nn <leader>gs :Gstatus<CR>
nn <leader>gc :Gcommit -v -q<CR>
nn <leader>gt :Gcommit -v -q :%p<CR>
nn <leader>gd :Gdiff<CR>
nn <leader>ge :Gedit<CR>
nn <leader>gr :Gread<CR>
nn <leader>gw :Gwrite<CR><CR>
nn <leader>gl :sil! Glog<CR>:bot copen<CR>
nn <leader>gp :Ggrep<Space>
nn <leader>gm :Gmove<Space>
nn <leader>gb :Git branch<Space>
nn <leader>go :Git checkout<Space>
nn <leader>gps :Gpush<CR>
nn <leader>gpl :Gpull<CR>

"split navigations
nn <C-J> <C-W><C-J>
nn <C-K> <C-W><C-K>
nn <C-L> <C-W><C-L>
nn <C-H> <C-W><C-H>

nn <Left> <C-W><
nn <Right> <C-W>>
nn <Up> <C-W>+
nn <Down> <C-W>-

"No Ex mode ugh
nn Q <nop>

if !exists('g:airline_symbols') | let g:airline_symbols={} | en

let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=2
let g:airline#extensions#virtualenv#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline_detect_modified=1
let g:airline_powerline_fonts=1
let g:airline_mode_map={
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
let g:pymode_lint_cwindow=1
let g:pymode_lint_on_fly=1
let g:pymode_lint_options_pep8={'max_line_length': g:pymode_options_max_line_length}
let g:pymode_lint_todo_symbol='TD'
let g:pymode_motion=1
let g:pymode_options_colorcolumn=1
let g:pymode_doc=0
let g:pymode_rope=1
let g:pymode_rope_lookup_project=0
let g:pymode_rope_autoimport=0
let g:pymode_rope_completion=1
let g:pymode_rope_complete_on_dot=1
let g:pymode_syntax=0
let g:pymode_trim_whitespaces=1
let g:pymode_virtualenv=1
"Find a better keybinding
let g:pymode_rope_rename_bind='<C-C>r'

let g:virtualenv_auto_activate=1

let g:user_emmet_install_global=0
let g:user_emmet_leader_key="<C-M>"

let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=2
let g:tagbar_iconchars=['▶', '▼']
let g:tagbar_silent=1
let g:tagbar_sort=0

let g:session_autoload='no'

func! s:SetBreakpoint()
    cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
    exe 'sil! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
    if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
nn <F6> :cal <SID>ToggleBreakpoint()<CR>
