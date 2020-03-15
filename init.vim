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
\    '_': ['ale', 'foobar'],
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
" Linting
let g:ale_linters = {
\    'cs': ['OmniSharp']
\}

" Omnisharp
" Based off of https://github.com/OmniSharp/omnisharp-vim#example-vimrc
" -----------------------------------------------------------------------------

" Note: this is required for the plugin to work
filetype indent plugin on

" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" Mono Required on OSX and Linux
let g:OmniSharp_server_use_mono = 1

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
" let g:ale_linters = { 'cs': ['OmniSharp'] }
" Done above

" Update semantic highlighting after all text changes
" let g:OmniSharp_highlight_types = 3
" Update semantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Enable snippet completion
" let g:OmniSharp_want_snippet=1
" -----------------------------------------------------------------------------
