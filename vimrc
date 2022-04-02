" Basics ========================================{{{
" make Vim more useful, i.e. less Vi-compatible
" this option will set automatically to 'nocompatible' most of the time, e.g.
" when a user vimrc file is found or a vimrc file is found in the current
" directory; however, if Vim is started with -u command line argument to load
" a certain vimrc file, this option is not reset automatically
"
" mapping interpretations and certain options depend on the value of
" this option, so it should be placed at the very beginning of a vimrc
set nocompatible

set hidden                      " allow switching buffers without writing
set nomodeline                  " disable modeline for security
set mouse=a                     " enable mouse in all modes, useful for resize
set belloff=all                 " disable bleep or visual bell for all events
set timeoutlen=350              " time to wait for keys of a mapping or key
                                " codes to complete
let mapleader=" "
"}}}

" Appearance ===================================={{{
" when 'number' is used with 'relativenumber', only the current line number is absolute
" for all other lines, the number of lines relative to the current one is shown
set number
set relativenumber

set laststatus=2                " always show status line
set ruler                       " show cursor line and column position
set showcmd                     " show command keys that are typed in
set showmode                    " display mode for Insert, Replace, Visual

if has("gui_running")
  set guifont=IBMPlexMono:h13
  set linespace=3
  set columns=104
  set lines=31
endif
"}}}

" Syntax and colours ============================{{{
syntax on
filetype plugin on

set termguicolors               " display true color in supporting terminals
"}}}

" Editing, tabs, whitespaces and indents ========{{{
set backspace=start,eol,indent  " normal backspace behaviour
set expandtab                   " expand tabs to spaces
set softtabstop=2               " number of spaces to stand for a tab
set shiftwidth=2                " number of spaces to use for each indent
set listchars=trail:·           " list of invisible characters to display
set list                        " display invisible characters
set wrap                        " wrap text on display
set linebreak                   " do not arbritarily break texts at last char
set breakindent                 " display same indent for wrapped lines

set autoindent                  " copy indent on new line
set smartindent                 " useful indent for C-like programming
"}}}

" Windows ======================================={{{
" split new window below and to the right of current one
set splitbelow
set splitright

" easy window navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
"}}}

" Searching
set ignorecase                  " ignore case when only lower cases used
set smartcase                   " case-sensitive if upper case characters included
set hlsearch                    " highlight all matching searches
set incsearch                   " search as you type

" turn off highlighting of search
nnoremap <leader><Space> :nohlsearch<CR>

" Folding ======================================={{{
set foldlevelstart=99           " no folds closed when start to edit

" set marker fold method for vimrc files
augroup fold_filetype
  autocmd!
  autocmd FileType vim :setlocal foldmethod=marker
augroup end
"}}}

" Keymaps ======================================={{{
" stay on home row to exit to normal mode
inoremap jk <Esc>
inoremap kj <Esc>

" more accessible key to jump to matching pair
nnoremap <Tab> %

" swap 0 to be first non-blank character, and ^ to be first character on line
nnoremap 0 ^
nnoremap ^ 0

" save file
nnoremap <leader>w :w<CR>

" copy and paste to clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" insert a blank line below or above the current line
nnoremap <leader>o m`o<Esc>``
nnoremap <leader>O m`O<Esc>``

" uppercase current word
nnoremap <leader>u m`vawU``

" surround visually selected text with single quotes
vnoremap <leader>' <Esc>`<i'<Esc>`>a'

" for vimrc ====================================={{{
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" automatically source vimrc on saving
augroup autosource
  autocmd!
  autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
"}}}

noremap <F2> :!npm run test<CR>
