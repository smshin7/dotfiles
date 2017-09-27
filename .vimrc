"""""""""""""""""""""""""""""""""
"         Plugin Manager        "
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 

" Git wrapper
Plug 'tpope/vim-fugitive'

" Text editing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" Navigation
Plug 'easymotion/vim-easymotion'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'kien/ctrlp.vim'

" Display
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-theme'

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

" Airline
let g:airline#extensions#ale#enabled = 1

" vim-jsx - don't require .jsx extension
let g:jsx_ext_required = 0

" ctrl-p settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
 \ 'file': '\.so$\|\.dat$|\.DS_Store$'
 \ }

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
set termguicolors

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

