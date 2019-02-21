
set nocompatible
syntax enable
set encoding=utf-8
set showcmd
filetype plugin indent on

"" whitespace
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start

"" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" relative number line-numbering on left side
set relativenumber

set showmatch
set nojoinspaces

"jump to another file using 'gf'
set hidden
set path+=**

" natural splits
set splitbelow
set splitright

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" keymap leader:space and localleader:comma
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h


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

" Language-Pack
Plug 'sheerun/vim-polyglot'

" Color Schemes
Plug 'flazz/vim-colorschemes'

" Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
    au! BufNewFile,BufFilePre,BufRead *.markdown set filetype=markdown.pandoc
augroup END
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#codeblocks#embeds#langs = ['python', 'vim', 'make',
            \  'bash=sh', 'html', 'css', 'scss', 'javascript', 'matlab']
let g:formatdef_pandoc =
            \'"pandoc  --standalone --atx-headers --columns=79'.
            \' -f markdown -t ".b:markdown_flavor'
let g:formatters_markdown_pandoc = ['pandoc']

" Goyo & Limelight for Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" fzf
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'

" Formatting
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chiel92/vim-autoformat'
Plug 'godlygeek/tabular'

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

" Markdown
Plug 'tpope/vim-markdown'
" macro to add a link to text
autocmd filetype markdown nnoremap <Leader>e :normal "wya]}[ "wpa: <https://example.com><Esc>vi>
" can force markdown without plugin above using: autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" " Commenting
" Plug 'tpope/vim-commentary'
" autocmd FileType matlab setlocal commentstring=\% %s

" NerdTree
Plug 'scrooloose/NerdTree'

" Vim-Which-Key
Plug 'liuchengxu/vim-which-key'

" On-demand lazy load
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" To register the descriptions when using the on-demand load feature, use the autocmd hook to call which#register(),
" e.g., register for the Space key(see more configuration details in the following sections):
" autocmd! User vim-which-key call which#register('<Space>', 'g:which_key_map')

" (Which-Key alternative: Plug 'hecal3/vim-leader-guide')


nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500

" let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>



" PLUG-END
call plug#end()
" ===========================================================================


" space w -> write
nnoremap <Leader>w :w <enter>
nnoremap <Leader>q :bd <enter>

" <space> x p -> paste from clipboard
noremap <Leader>x "+


" Pairing Braces
inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

" Navigation Keys
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
map $ <Nop>
map ^ <Nop>
map { <Nop>
map } <Nop>
noremap K     {
noremap J     }
noremap H     ^
noremap L     $
noremap <C-x> :bp<Bar>bd #<Cr>

" Insert mode Navigation Keys
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Tab and Shift-Tab to indent
nmap >> <Nop>
nmap << <Nop>
vmap >> <Nop>
vmap << <Nop>
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

" Avoiding Esc
inoremap <S-Tab> <Esc>
onoremap <S-Tab> <Esc>

" Run macro with Q (qq:start,q:stop,Q:play)
nnoremap Q @q

" Y yank to end of line
nnoremap Y y$


" use semicolon
nnoremap ; :    " Use ; for commands.


set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/




" ctrlP
" " Open file menu
" nnoremap <Leader>o :CtrlP<CR>
" " Open buffer menu
" nnoremap <Leader>b :CtrlPBuffer<CR>
" " Open most recently used files
" nnoremap <Leader>f :CtrlPMRUFiles<CR>

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
" let g:airline_theme= 'gruvbox'