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

" Linting support
" Install eslint
Plug 'dense-analysis/ale', { 'do': 'npm install -g eslint' }

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Javascript Tern-based Completion
Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }

" Javascript tern completion for deoplete
Plug 'carlitux/deoplete-ternjs'

" Typescript deoplete completion
Plug 'mhartington/nvim-typescript'

" Prettier - Note: assumes node and yarn|npm installed globally
" post install eslint plugins globally (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
\    'do': 'npm install -g eslint-plugin-prettier eslint-config-prettier && npm install',
\    'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

" Requires https://github.com/neovim/python-client
Plug 'davidhalter/jedi'
Plug 'deoplete-plugins/deoplete-jedi'

call plug#end()

" Set tabs to four spaces
"
" https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
filetype plugin indent on " Activates filetype detection
set tabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces

" Show space as ·, tabs as >-, trailing whitespace as ~
set list
set listchars=space:·,tab:>-,trail:~,extends:>,precedes:<

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
colorscheme papercolor
let g:airline_theme='papercolor'

" Filenames to auto close tags
let g:closetag_filenames = '*.html,*.html.erb,*.jsx'

" ESLint ALE configuration
" Based off of this article: https://davidtranscend.com/blog/configure-eslint-prettier-vim/
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'css': ['prettier']
\}
let g:ale_linter_aliases = {'jsx': 'javascript'}
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fix_on_save = 1

" Deoplete, OmniFunc, and Tern configuration based off of this post:
" https://gregjs.com/vim/2016/configuring-the-deoplete-asynchronous-keyword-completion-plugin-with-tern-for-vim/

" Deoplete
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
" Need to install other filetype deoplete plugins (I think)
augroup omnifuncs
  autocmd!
  " autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  " autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  " autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern-tab complete
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
