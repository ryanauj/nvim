" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Make sure to use single quotes

" Bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" This has a ton of colorschemes included
" Check out repo for details
Plug 'flazz/vim-colorschemes'

" Inidividual colorschemes
Plug 'sainnhe/sonokai'" Git Wrapper
Plug 'tpope/vim-fugitive'

" Quoting / Parenthesizing
Plug 'tpope/vim-surround'

" Tree explorer
Plug 'scrooloose/nerdtree'

" Fuzzy file, tag, etc finder
Plug 'ctrlpvim/ctrlp.vim'

" Comments
Plug 'tpope/vim-commentary'

" Add 'end' keyword where applicable
Plug 'tpope/vim-endwise'

" Emmet html abbreviation expander
Plug 'mattn/emmet-vim'

" Auto close (X)HTML tags
Plug 'alvan/vim-closetag'

" HTML5 completion and syntax support
Plug 'othree/html5.vim'

" Terraform syntax support
Plug 'hashivim/vim-terraform'

" Javascript Tern-based Completion
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Vim snippets separated from UtilSnips engine
Plug 'honza/vim-snippets'

" Easy search, substitution, and abbreviation.
Plug 'tpope/vim-abolish'

" Prettier - Note: assumes node and yarn|npm installed globally
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
\    'do': 'yarn install',
\    'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

call plug#end()

" Set tabs to four spaces
"
" https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on " Activates filetype detection
set tabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces

" General Settings
"
syntax on     " Syntax highlighting
set showmatch " Shows matching brackets
set ruler     " Always shows location in file (line#)
" set number    " Show line numbers
set smarttab  " Autotabs for certain code

" Colorscheme - For themes like solarized, make sure that if you are using a
" terminal, that it's colorschme is using a compatible colorscheme
" https://github.com/altercation/vim-colors-solarized#important-note-for-terminal-users
set background=light
colorscheme bubblegum-256-light
let g:airline_theme='light'

" Filenames to auto close tags
let g:closetag_filenames = '*.html,*.html.erb,*.jsx'

" Prettier
" Allow auto formatting for files without '@format' or '@prettier' tag
let g:prettier#autoformat_require_pragma = 0
