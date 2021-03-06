set nocompatible              " be iMproved, required
filetype off                  " required


" ================ Vundle Section =================== {{{
"
"
" 1. Install with `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
" 2. Install Nerfonts from https://github.com/ryanoasis/nerd-fonts
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Vundle plgin manager
Plugin 'altercation/vim-colors-solarized' " Solarized colaour theme
Plugin 'tpope/vim-fugitive'               " Better git handing
Plugin 'vim-scripts/tComment'             " T-Comment for faster commenting
Plugin 'SirVer/ultisnips'                 " Ultisnips for snippets
Plugin 'honza/vim-snippets'               " Base snippets
Plugin 'godlygeek/tabular'                " Tabular util
Plugin 'ctrlpvim/ctrlp.vim'               " Control-P file explorer
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/taglist.vim'          " Taglist
Plugin 'majutsushi/tagbar'                " Tagbar
Plugin 'ryanoasis/vim-devicons'           " Dev icons
Plugin 'mhinz/vim-startify'               " Dev icons
Plugin 'othree/javascript-libraries-syntax.vim' " Javascript Syntax Helpers
"Plugin 'ervandew/supertab'                " Supertab plugin

call vundle#end()
filetype plugin indent on
"}}}

" ================ Buffer Shortcuts =================
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>"

" ================ Commands =================

" Set the ownership of the current file to this user.
command Chown !a=$(groups $USER |  awk '{print $1 $2 $3}' ); sudo chown $a %:p

" ================ Tab shortcots ====================
"
map <silent> tt :tabnew<cr>   " Create Tab
map <silent> -- :tabp<cr>     " Previous tab
map <silent> == :tabn<cr>     " Next Tab

map <silent> ,1 :tabn 1<cr> " Use numbers to pick the tab you want (like iTerm)
map <silent> ,2 :tabn 2<cr>
map <silent> ,3 :tabn 3<cr>
map <silent> ,4 :tabn 4<cr>
map <silent> ,5 :tabn 5<cr>
map <silent> ,6 :tabn 6<cr>
map <silent> ,7 :tabn 7<cr>
map <silent> ,8 :tabn 8<cr>
map <silent> ,9 :tabn 9<cr>


" ================ Split window shortcuts ===========
"
nnoremap <silent> vv <C-w>v " Split vert.
nnoremap <silent> ss <C-w>s " Split hori.

nnoremap <C-J> <C-W><C-J> " Instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <ESC>[B <C-W><C-J> " Instead of ctrl-w then j, it’s just ctrl-j:
nnoremap <ESC>[A <C-W><C-K>
nnoremap <ESC>[C <C-W><C-L>
nnoremap <ESC>[D <C-W><C-H>

" ================ Tabularize Shortcuts =============
"
nmap \| :Tabularize /
vmap \| :Tabularize /


" ================ Indentation ======================
"
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab


" ================ Folds ============================
"
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set foldmethod=marker
set fillchars+=fold:\.

function! CleanFold()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = ' '
  let foldtextstart = strpart('+ FOLD' . repeat(foldchar, v:foldlevel) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=CleanFold()

" ================ Solarized Plugin =================
"
syntax enable
set background=dark
colorscheme solarized
highlight Folded cterm=bold ctermfg=lightblue ctermbg=NONE


" ================ Ultisnips Plugin =================
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit='vertical' " If you want :UltiSnipsEdit to split your window.


" ================ Set Sane Defaults ================
"
let mapleader=","
set number      " Numbers on left
set relativenumber
set ignorecase  " Ignore case
set smartcase
set laststatus=2



" ================ Smarter Commenting ===============
"
map <leader>c <c-_><c-_>


" ================ Ariline Config ===================
"
let g:airline_theme='solarized'
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_branch_prefix = '⭠ '
" let g:airline_readonly_symbol = '⭤'
" let g:airline_linecolumn_prefix = '⭡'
"
" let g:airline#extensions#tabline#enabled = 1            "
" let g:airline#extensions#tabline#left_sep = '⮀'         " Smarter tab lines
" let g:airline#extensions#tabline#left_alt_sep = '⮁'     "

let g:airline_powerline_fonts = 1


" ================ NERDTree and Tagbar ==============
"
nmap \\ :NERDTreeToggle<CR>:NERDTreeMirror<CR>:TagbarToggle<CR>

nnoremap <silent> <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>n :NERDTreeToggle<CR>:NERDTreeMirror<CR>

" ================ Search ===========================
"
nnoremap // :nohlsearch<CR>


" ========== Persistant Undo Between Sessions =======
"
set undofile


" ========== Set No Swap Fle ========================
"
" set noswapfile
set undodir=~/.vim/backups


" ================ Nerd Fonts =======================
"
set encoding=utf8
set term=xterm-256color
set termencoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:8
let g:Powerline_symbols = 'fancy'


" ================ Improved Javascript ==============
"
let g:used_javascript_libs = 'angularjs,jquery,angularui,angularuirouter,vue'


" ================ emenu - experimental =============
"

" YOU CAN MANUALLY TRIGGER MENU COMPLETION BY INVOKING TAB COMPLETION ON THE
" :EMENU COMMAND, BY DOING :EMENU<SPACE><TAB>

" Enable smart command line completion on <Tab> (enable listing all possible
" choices, and navigating the results with <Up>, <Down>, <Left>, <Right>, and
" <Enter>)
set wildmenu

" Make repeated presses cycle between all matching choices
set wildmode=full

" Load the default menus (this would happen automatically in gvim, but not in
" terminal vim)
" TODO: Replace with custom menu
source $VIMRUNTIME/menu.vim


