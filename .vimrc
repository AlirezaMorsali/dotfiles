 "vimrc configurations
" Vundle for plugin management



set nocompatible              " be iMproved, required
filetype off                  " required



" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %


" Text Wrap
set wrap
set linebreak
set showbreak=…
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

" Autopair
Plugin 'jiangmiao/auto-pairs'

"LSP
Plugin 'liuchengxu/vista.vim'

" Fuzzy search
Plugin 'junegunn/fzf.vim', { 'do': { -> fzf#install()  }  }

" airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Writing Notes
Plugin 'junegunn/goyo.vim'

" Multicurser
Plugin 'terryma/vim-multiple-cursors'


" Vim unicode
Plugin 'chrisbra/unicode.vim'

" vim latex
"Plugin 'vim-latex/vim-latex'

" Latex live
Plugin 'lervag/vimtex'

" Commentary
Plugin 'tpope/vim-commentary'


" vifm  plugin
Plugin 'vifm/vifm.vim'

" Icons
Plugin 'ryanoasis/vim-devicons'

" Pugin for python fancy costumization
Plugin 'fisadev/fisa-vim-config'

"Intellisense engine for Vim8 & Neovim, full language server protocol support
"as VSCode
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}


"Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
Plugin 'dense-analysis/ale'


" vim repeat
Plugin 'tpope/vim-repeat'
" surround
Plugin 'tpope/vim-surround'


" Themes
Bundle 'altercation/vim-colors-solarized'
Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}
" All of your Plugins must be added before the following line

Plugin 'joshdick/onedark.vim'
" for test
Plugin 'junegunn/seoul256.vim'


Plugin 'sheerun/vim-polyglot'

"Python

"Plugin 'jeetsukumaran/vim-pythonsense'

" Python plugin
"Plugin 'python-mode/python-mode'

" Vimspecter debugger
Plugin 'puremourning/vimspector'

"jupyter notebook
Plugin 'jupyter-vim/jupyter-vim'

" VTM
Plugin 'christoomey/vim-tmux-runner'

"Vim Cellmode
"Plugin 'ZichaoLong/vim-cellmode'

" Coq
Plugin 'whonore/Coqtail'
Plugin 'let-def/vimbufsync'

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


" airline theme
let g:airline_theme='deus'

"Vim specter
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector


" VTM 
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
nnoremap <leader>av :VtrAttachToPane<cr>
nnoremap <leader>at :VtrAttachToPane 2<cr>
nnoremap <leader>ad :VtrAttachToPane 1<cr>
nnoremap <leader>ror :VtrReorientRunner<cr>
nnoremap <leader>rc :VtrSendCommandToRunner<cr>
nnoremap <leader>re :VtrSendLinesToRunner<cr>
vnoremap <leader>re :VtrSendLinesToRunner<cr>
nnoremap <leader>or :VtrOpenRunner<cr>
nnoremap <leader>kr :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>
nnoremap <leader>dr :VtrDetachRunner<cr>
nnoremap <leader>cr :VtrClearRunner<cr>
nnoremap <leader>fc :VtrFlushCommand<cr>
nnoremap  <leader>rr :VtrSendFile<cr>
" easy motion
map <Space> <Plug>(easymotion-bd-w)

 
" Vifm Plugin
map <leader>vi :Vifm<CR>

 "vim latex
"let g:tex_flavor='latex'
"let g:Tex_TreatMacViewerAsUNIX = 1
"let g:Tex_ExecuteUNIXViewerInForeground = 1
"let g:Tex_ViewRule_ps = 'open -a Skim'
"let g:Tex_ViewRule_pdf = 'open -a /Applications/Skim.app'

" Unicode
map <leader>uf <Plug>(UnicodeFuzzy)

" ALE
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['yapf','isort','add_blank_lines_for_python_control_statements','remove_trailing_lines','trim_whitespace']}

nmap <leader>af <Plug>(ale_fix)

" COC.nvim
"Going To definition
"nmap <silent> gd <Plug>(coc-definition)
""Displaying documentation (in the floating window!)
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
    "if (index(['vim','help'], &filetype) >= 0)
        "execute 'h '.expand('<cword>')
    "else
        "call CocAction('doHover')
    "endif
"endfunction


"Smart rename (renames the exports across all files)
"nmap <leader>rn <Plug>(coc-rename)

" use <tab> for trigger completion and navigate to the next complete item
"function! s:check_back_space() abort
      "let col = col('.') - 1
        "return !col || getline('.')[col - 1]  =~ '\s'
    "endfunction

    "inoremap <silent><expr> <Tab>
          "\ pumvisible() ? "\<C-n>" :
          "\ <SID>check_back_space() ? "\<Tab>" :
          "\ coc#refresh()
"vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='skim'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" vimtex settings
"let g:vimtex_view_method = 'skim'
"let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_zathura_hook_view = 'MyViewHook'

    "function! MyViewHook() abort dict
              "echom 'See what I am:' string(self)
                  "endfunction
"let g:vimtex_view_zathura_hook_view
"let g:vimtex_view_method = 'okular'
"let g:polyglot_disabled = ['latex']
" Some settings to enable the theme:
"set number
syntax enable
"set background=dark
"let g:solarized_termcolors = 256  " New line!!
"colorscheme solarized
"colorscheme atom
"syntax on
" colorscheme onedark
colorscheme challenger_deep


filetype plugin indent on
syntax enable
set termguicolors
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
