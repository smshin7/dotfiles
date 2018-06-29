"""""""""""""""""""""""""""""""""
"         Plugin Manager        "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Text editing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
let NERDSpaceDelims = 1

" Navigation
Plug 'easymotion/vim-easymotion'

" Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'raimondi/delimitmate'
Plug 'alvan/vim-closetag'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Display
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax Highlighting
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'

" Colorschemes
Plug 'tomasr/molokai'
Plug 'cdmedia/itg_flat_vim'

call plug#end()

" NERDTree
map <F2> ;NERDTreeToggle<CR>

" ALE
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

" YouCompleteMe
" " Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" Close tag
let g:closetag_filenames = '*.html,*.js'

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline#extension#tabline#enabled = 1

" vim-jsx - don't require .jsx extension
let g:jsx_ext_required = 0

" fzf settings
nnoremap <silent> <C-p> :GFiles<CR>

" disable netrw banner
let g:netrw_banner=0

"""""""""""""""
"   GENERAL   "
"""""""""""""""
filetype plugin indent on

set backspace=eol,start,indent

" colon remap
noremap : ;
noremap ; :


let mapleader = ","
let g:mapleader = ","

" Ack search
map <leader>a ;Ack!<space>

" disable arrow keys
noremap <Left> :echoe "Use H"<CR>
noremap <Right> :echoe "Use L"<CR>
noremap <Up> :echoe "Use K"<CR>
noremap <Down> :echoe "Use J"<CR>


" move between buffers
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" ESC w/ jk
inoremap jk <ESC>

" Allow mouse scroll
set mouse=n

" No .swp file
set noswapfile

" copy to clipboard
set clipboard=unnamed
map <F10> :set pastetoggle<CR>


"""""""""""""""""""""
"   COLORS/SYNTAX   " 
"""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Themes
colorscheme molokai

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" For regular expressions turn magic on
set magic

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" tabs
set smarttab
" Use tabs instead of spaces
set expandtab
" 1 tab == 2 spaces
set tabstop=2
retab

" Don't auto indent
set noai
"Always show current position
set ruler
set shiftwidth=2
set relativenumber
set number

