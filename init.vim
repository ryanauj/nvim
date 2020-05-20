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
Plug 'vim-scripts/kate'
Plug 'zcodes/vim-colors-basic'
Plug 'NLKNguyen/papercolor-theme'
Plug 'reedes/vim-colors-pencil'

" Better git integration
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

" Vim snippets separated from UtilSnips engine
Plug 'honza/vim-snippets'

" Easy search, substitution, and abbreviation.
Plug 'tpope/vim-abolish'

" Javascript support
Plug 'pangloss/vim-javascript'

" Typescript support
Plug 'leafgarland/typescript-vim'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Javascript Tern-based Completion
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Javascript tern completion for deoplete
Plug 'carlitux/deoplete-ternjs'

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
set t_Co=256
set background=light
colorscheme papercolor
let g:airline_theme='papercolor'

" Filenames to auto close tags
let g:closetag_filenames = '*.html,*.html.erb,*.jsx'

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,’deoplete#omni#input_patterns’,{})

" Tern
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = [“tern”]
let g:tern#arguments = [“ — persistent”]

" Prettier
" Allow auto formatting for files (default only those with '@format' or '@prettier' tag)
let g:prettier#autoformat = 1

" Allow auto formatting for files without '@format' or '@prettier' tag
let g:prettier#autoformat_require_pragma = 0
