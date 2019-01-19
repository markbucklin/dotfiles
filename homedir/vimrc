call plug#begin()

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

" fzf
let g:fzf_install = 'yes | ./install'
Plug 'junegunn/fzf', { 'do': g:fzf_install }


" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'brooth/far.vim'


call plug#end()


set relativenumber
