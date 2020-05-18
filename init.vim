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

" Deoplete - Completion framework
" See https://github.com/Shougo/deoplete.nvim#install
" Requires msgpack package 1.0.0+. Please install/upgrade msgpack package by pip - https://github.com/msgpack/msgpack-python
" Neovim or Vim8 with if_python3.
" - Can check by running ':echo has("python3")', seeing if it returns 1
" - See here if not - https://github.com/Shougo/deoplete.nvim#requirements
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Rails completion
Plug 'fishbullet/deoplete-ruby'
Plug 'etordera/deoplete-rails'

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

" Asynchronous Lint Engine
" Works with linters and code formatters
" Uses Deoplete for completion
Plug 'w0rp/ale'

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

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern tab complete
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Use ALE as completion source for all code - Trying to use Tern with Deoplete instead
" call deoplete#custom#option('sources', {
" \    '_': ['ale'],
" \})

" Ale
" Fixers - Recommended to do this in ftplugin file
" https://github.com/OmniSharp/omnisharp-vim#example-vimrc
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'javascript': ['prettier'],
" \}

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" Enable completion
" let g:ale_completion_enabled = 1
