 "vimrc configurations
" Vundle for plugin management



set nocompatible              " be iMproved, required
filetype off                  " required



" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %


" Text Wrap
set wrap
set linebreak
"set formatoptions=tcqa
"set formatoptions+=a
" move in shown lines:
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

"Escape :nohl
inoremap jk <ESC>



" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
" let mapleader = ","
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <leader>nh :nohl<CR>
vnoremap <leader>nh :nohl<CR>
inoremap <leader>nh :nohl<CR>


" Quicksave command
noremap <leader>s :update<CR>
vnoremap  <leader>s :update<CR>
inoremap  <leader>s <C-\><C-o>:w<CR>


" Quick quit command
noremap <Leader>q :quit<CR>  " Quit current window
vnoremap  <leader>q :quit<CR>
inoremap  <leader>q <C-\><C-o>:q<CR>
noremap <Leader>Q :qa!<CR>   " Quit all windows

" map sort function to a key
vnoremap <Leader><Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set relativenumber             " Show relative line numbers"
"set tw=79   " width of document (used by gd)
"set nowrap  " don't automatically wrap on load
"set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Useful settings
set history=700
set undolevels=700

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase
