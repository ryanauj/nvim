" Neovim configuration file
" See here for general starting info - https://neovim.io/doc/user/starting.html
" #9 in that document specifies information on standard paths for neovim
" See 'https://neovim.io/doc/user/eval.html#stdpath() for 'stdpath' info

" VIM-PLUG - https://github.com/junegunn/vim-plug

" Add this section to the vim-plug documentation for Automatic installation in
" neovim if you get it working.

" See below for an example, as well as why it may be best not to use this:
" https://github.com/jonhoo/configs/issues/4#issue-510497037
" which is based off of this:
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

" if empty(glob(stdpath('config') . '/autoload/plug.vim'))
"   silent !curl -fLo stdpath('config') . '/autoload/plug.vim' --create-dirs
"       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
"
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
let g:deoplete#enable_at_startup = 1

" Asynchronous Lint Engine
" Works with linters and code formatters
" Uses Deoplete for completion
Plug 'w0rp/ale'

" Track UtilSnips snippets engine
Plug 'SirVer/ultisnips'

" Vim snippets separated from UtilSnips engine
Plug 'honza/vim-snippets'

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
set background=dark
colorscheme dracula
let g:airline_theme='dark'

" UtilSnips
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Prettier
" Allow auto formatting for files without '@format' or '@prettier' tag
let g:prettier#autoformat_require_pragma = 0

" Deoplete
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\    '_': ['ale'],
\})

" Ale
" Fixers - Recommended to do this in ftplugin file
" https://github.com/OmniSharp/omnisharp-vim#example-vimrc
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
