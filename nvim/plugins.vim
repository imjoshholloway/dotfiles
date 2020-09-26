"
" Install vim-plug if it doesn't exist
"
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"
" ================== Vim Plugins ====================
"
call plug#begin('~/.config/nvim/plugged')

  " make vim sensible!
  Plug 'tpope/vim-sensible'

  " emacs style command help
  Plug 'liuchengxu/vim-which-key'

  " always be where git starts
  Plug 'airblade/vim-rooter'

  " whitespace be gone
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-commentary'

  " language support for :allthethings:
  Plug 'sheerun/vim-polyglot'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'google/vim-jsonnet'
  " auto detect indentation settings
  Plug 'tpope/vim-sleuth'
  " tags
  Plug 'liuchengxu/vista.vim'
  " autocomplete
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " start screen
  Plug 'mhinz/vim-startify'
  " statusline
  Plug 'vim-airline/vim-airline'

  " searching but good
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " navigation without stupidity
  Plug 'christoomey/vim-tmux-navigator'

  " git
  Plug 'mhinz/vim-signify'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'

  " terminal
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/goyo.vim'

  " colorscheme
  Plug 'joshdick/onedark.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

