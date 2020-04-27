set nocompatible              " be iMproved, required
filetype off                  " required



" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

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
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <Leader>s :update<CR>
vnoremap  <Leader>s :update<CR>
inoremap  <Leader>s :update<CR>


" Quick quit command
noremap <Leader>q :quit<CR>  " Quit current window
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
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'easymotion/vim-easymotion'


" airline
Plugin 'vim-airline/vim-airline'


" vim latex
"Plugin 'vim-latex/vim-latex'

" Latex live
Plugin 'lervag/vimtex'

"Nerd commenter
Plugin 'preservim/nerdcommenter'
" Plugin 'tomtom/tcomment_vim'
"map <C-/>  <plug>NERDCommenterComment
"map <C-=> <plug>NERDCommenterComment

" Nerdtree plugin
Plugin 'preservim/nerdtree'

" Icons
Plugin 'ryanoasis/vim-devicons'

" Pugin for python fancy costumization
Plugin 'fisadev/fisa-vim-config'

Bundle 'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
""""map <leader>c  <plug>NERDCommenterComment
map <leader>c <plug>NERDCommenterToggle



" vim latex
"let g:tex_flavor='latex'
"let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_ExecuteUNIXViewerInForeground = 1
"let g:Tex_ViewRule_ps = 'open -a Skim'
"let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'


" vimtex settings
"let g:vimtex_view_method = 'skim'
let g:vimtex_view_method = 'zathura'
let g:polyglot_disabled = ['latex']
" Some settings to enable the theme:
set number
syntax enable
set background=dark
let g:solarized_termcolors = 256  " New line!!
colorscheme solarized
"colorscheme atom
