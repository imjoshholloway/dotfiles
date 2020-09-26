" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" map leader key to space
let mapleader=" "
nnoremap <Space> <Nop>

filetype plugin indent on

" make splitting more natural - By default vim splits to the left, right and down 'feels' right
set splitbelow
set splitright
let g:netrw_altv = 1

" Stop using arrow keys!
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" make backspace work properly
set backspace=eol,indent,start

set noswapfile
set nobackup
set number
set relativenumber
set nowrap
set visualbell
set fileformat=unix
set ignorecase
set smartcase
set cursorline          " highlight the line the cursor is currently on
set colorcolumn=80      " show a vertical line at 80
set cmdheight=2         " give more room to display messages
set laststatus=2        " always show the statusline
set shortmess+=c        " don't pass messages to |ins-completion-menu|.
set tabstop=4           " insert 2 spaces for a tab
set shiftwidth=4        " change the number of space characters inserted for indentation
set smarttab            " makes tabbing smarter will realize you have 2 vs 4
set expandtab           " converts tabs to spaces
set smartindent         " makes indenting smart
set autoindent          " good auto indent
set iskeyword+=-        " treat dash separated words as a word text object"
set formatoptions-=cro  " Stop newline continution of comments
set gcr=a:blinkon0      " disable cursor blink
set list
set listchars=tab:\|\ 

" make the cursor nice
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Strip whitespace on save
autocmd BufWritePre * FixWhitespace

" make FZF act like ctrlp
nnoremap <C-p> :Files<cr>
