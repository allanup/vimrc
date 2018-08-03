"vim configuration file
"vim configuration file
"vim configuration file

" I want:
" - good colors
" - not too many colors otherwise code looks like a Chrismas tree
"
syntax on
set nocompatible   " Not compatible with vi (much better, multi-level undo...)
filetype off                   " required!

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

" let Vundle manage Vundle
" required! 
" Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache
" first) for foo
" :BundleClean(!)      - confirm(or auto-approve)
" removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not
" allowed..

"set shell=csh\ -f  " Speed up external commands (avoid reading .cshrc)
set visualbell     " Don't beep, don't bother co-workers
set ruler          " Show the ruler
set showcmd        " Show partially typed commands
set backup         " Keep a backup, it might be useful one day
set backspace=2    " Allow backspacing over everything in insert mode
set hidden         " Allow hidden buffers (to switch buffers without saving)
set shiftwidth=4   " Nb of spaces to use for indentation when pressing < or >
"set noexpandtab      " Tab will tabs
set expandtab      " Tab will insert spaces. Use CTRL-V<Tab> to insert real tab
"set softtabstop=3
set tabstop=4
set showmatch      " Show matching braces a la emacs
set incsearch      " Show match while typing pattern with / or ? like emacs
set hlsearch       " highlight search pattern
set listchars=tab:»·,trail:· " Show me tabs and trailing spaces
set textwidth=120
set ignorecase     "Ignore case of text during searches"
set smartcase      "Override 'ignorecase' if search pattern contains uppercase 
set autoindent      " Autoindentation is sometimes good but annoying when copy
" set cindent
set list
set nolist
set cino=:0        " don't unden't case: labels in switch() 
set comments=sr:/*,mb:*,ex:*/
set formatoptions=tcqor
set wrapscan       " wrap search at the end/begginning of file
let c_comment_strings=1 " I like highlighting strings inside C comments

" Flags for vi compatibility options (I prefer not to delete text
" when using the c (change) command and print at the end of the
" changed text (just like vi)
"set cpoptions=ces$
set cpoptions+=$

" Backspace and use arrow keys to move to previous lines
set backspace=2 whichwrap+=<,>,[,]

" How to handle completion
set laststatus=2    " Always have a statusbar
set wildmode=longest,list
set wildmenu
set nu
set tags=tags

"Use shift and mouse selection to copy/paste outside the xterm
"set mouse=nvi
set mouse=c
set mousehide   "Hide mouse while typing

"Use forward slash instead of backward slash in file paths
"set shell=g:/Apps/cygwin/bin/bash.exe
set shellslash
set shellcmdflag=-c
"set shellquote=
"set shellxquote=
"set shellpipe=2>&1| tee
"set shellredir=>%s 2>&1

"Make shift-insert work like in Xterm
map <S-insert> <MiddleMouse>
map! <S-insert> <MiddleMouse>

"map ,1 10k
"map ,2 10j

" toggle of few boolean options and print what is the value of the option
map <F4> :set paste!<CR>:set paste?<CR>
"map <F5> :set number!<CR>:set number?<CR>
"map <F6> :set hlsearch!<CR>:set hlsearch?<CR>
map <F6> :noh<CR>
map <F7> :set list!<CR>:set list?<CR>

" when multiple tags match, I want a menu instead of jumping to first match
map <c-]> g<c-]>  


" cycle thru buffers ...
" proposed by John Spetz
nnoremap <c-n> :bn<cr>
nnoremap <c-p> :bp<cr>

" cycle thru messages ...
" proposed by Hari
nnoremap <a-n> :cn<cr>
nnoremap <a-p> :cp<cr>

" selecting text in visual mode and hitting '>' indents text but
" also deselects text.  Following remap will make sure text remains selected
vnoremap > ><CR>gv
vnoremap < <<CR>gv

nnoremap <c-g> 2<c-g> " make <c-g> more verbose

"Abbreviation to put a separator line
ab 8< ----- 8< ----- 8< ----- 8< ----- 8< ----- 8< ----- 8< ----- 


"Added from vim-trolls mailing list
"For control of syntax based on file type
filetype on
filetype plugin on
filetype indent on
set makeprg=make

" Make command line two lines high. This will avoid vim waiting for input
" from me upon executing some commands.
set ch=2

"Perforce integration into vim
"Used by the script perforce.vim in plugin directory
let p4EnableMenu=1
let p4EnablePopupMenu=1
let p4UseExpandedPopupMenu=1
let g:p4CodelineRoot = 'f:/'
let g:p4CmdPath = 'e:/Perforce/p4.exe' " In case it is not in the path.
let g:p4DefaultDiffOptions = '-dc' 
let p4ClientRoot='f:/'

"Window manager activation to see explorer and buffer list
map <F2> :WMToggle<CR>
"let g:selectBufIntWithWinManager = 1
let g:selBufIntWithWinManager = 1
let g:winManagerWindowLayout = 'FileExplorer|SelectBuf'

" Copy the name of the current file into clipboard (in window's fashion).
nnoremap <F4> :let @*=substitute(expand("%:p"), "/", "\\", "g")<cr>
nnoremap <S-F4> :let @*=expand("%:p")<cr>
nnoremap <C-F4> :let @*=expand("%:p:h")<cr>
au BufEnter *   if &textwidth > 0 | exec 'match Todo /\%>' . &textwidth . 'v.\+/' | endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Open and close all the three plugins on the same time
"nmap <F8>   :TrinityToggleAll<CR>

" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>

" Open and close the taglist.vim separately
nmap <F8>  :TrinityToggleTagList<CR>

" Open and close the NERD_tree.vim separately
"nmap <F11>  :TrinityToggleNERDTree<CR>

nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l 

let g:ctags_title=0	" To show tag name in title bar.
let g:ctags_statusline=1	" To show tag name in status line.
let generate_tags=1	" To start automatically when a supported
      				" file is opened.

set ruler          " Show the ruler
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Adjust keycode timeout length
set ttimeoutlen=100

"""""""""""""""""""""
""" FOR FuzzyFinder 
"""""""""""""""""""""
" directories and extensions to ignore when listing files
" these contain a lot of Python-isms, yours will probably vary
let s:extension = '\.bak|\.dll|\.exe|\.o|\.pyc|\.pyo|\.swp|\.swo'
let s:dirname = 'build|deploy|dist|vms|\.bzr|\.git|\.hg|\.svn|.+\.egg-info'
"let g:fuf_file_exclude = '\v'.'('.s:startname.'('.s:dirname.')'.s:endname.')|(('.s:extension.')$)'
"let g:fuf_dir_exclude = '\v'.s:startname.'('.s:dirname.')'.s:endname

" limit number of displayed matches
" (makes response instant even on huge source trees)
let g:fuf_enumeratingLimit = 60

" Truth be told, I don't remember what these do, but I must have
" found them necessary back when I installed fuzzyfinder years ago
let s:slash = '[/\\]'
"let s:startname = '(^|'.s:slash.')'
let s:endname = '($|'.s:slash.')'

nnoremap f :FufFile **/<cr>
nnoremap b :FufBuffer<cr>
nnoremap t :FufTag<cr>


set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

