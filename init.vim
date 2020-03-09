" https://github.com/asvetliakov/vscode-neovim#installation
if !exists('g:vscode')
" This check is so that these plugins don't run when running the 'vscode-neovim' extension in vscode.

" Set tabs to four spaces

filetype plugin indent on " https://vi.stackexchange.com/questions/10124/what-is-the-difference-between-filetype-plugin-indent-on-and-filetype-indent
set tabstop=4    " Show existing tab with 4 spaces width
set shiftwidth=4 " When indenting with '>', use 4 spaces width
set expandtab    " On pressing tab, insert 4 spaces

" General Settings

syntax on     " Syntax highlighting
set showmatch " Shows matching brackets
set ruler     " Always shows location in file (line#)
set smarttab  " Autotabs for certain code

" End check for 'vscode-neovim' extension.
endif
