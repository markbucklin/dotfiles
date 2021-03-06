
set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

"" whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

"" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" relative number line-numbering on left side
set relativenumber

" navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" Set leader key to comma
let mapleader = ","


"" PLUGINS BEGIN
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin()
"" ====================
" Sensible Defaults
Plug 'tpope/vim-sensible'


" Go 
Plug 'fatih/vim-go'


" fzf
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

" neoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'lionawurscht/deoplete-biblatex'
Plug 'zchee/deoplete-zsh'
Plug 'SevereOverfl0w/deoplete-github'


" matlab
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'daeyun/vim-matlab', { 'do': function('DoRemote') }



" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" far
Plug 'brooth/far.vim'

" Markdown
Plug 'tpope/vim-markdown'
" macro to add a link to text
autocmd filetype markdown nnoremap <Leader>e :normal "wya]}[ "wpa: <https://example.com><Esc>vi>
" can force markdown without plugin above using: autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Commenting
Plug 'tpope/vim-commentary'
autocmd FileType matlab setlocal commentstring=\% %s



" PLUG-END
call plug#end()



"jump to another file using 'gf'
set hidden
set path+=**



