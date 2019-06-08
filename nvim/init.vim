
" note: use 'runtime file.vim' rather than 'source file.vim' to source other files
" runtime syntax/c.vim
" runtime! */maps.vim
" runtime **/maps.vim


" map leader to space
" let mapleader ="\<SPACE>"
let mapleader =","
" ===========================================
call plug#begin('~/.config/nvim/plugged')
" ===========================================
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'

Plug 'dyng/ctrlsf.vim'
Plug 'SirVer/ultisnips'
Plug 'haya14busa/incsearch.vim'
Plug 'Valodim/vim-zsh-completion'
Plug 'ying17zi/vim-conque'

Plug 'universal-ctags/ctags'
Plug 'majutsushi/tagbar'
Plug 'lvht/tagbar-markdown'
Plug 'vim-voom/VOoM'
Plug 'moorereason/vim-markdownfmt'

Plug 'jreybert/vimagit'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'farmergreg/vim-lastplace'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'bling/vim-airline'
Plug 'kshenoy/vim-signature'
Plug 'crusoexia/vim-monokai'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'daeyun/vim-matlab'
Plug 'sheerun/vim-polyglot'

" ===========================================
call plug#end()
" ===========================================

" Settings
set nocompatible
set virtualedit=""
set hidden
set encoding=utf-8
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set gdefault
set splitbelow splitright
set bg=dark
set mouse=a
set clipboard=unnamedplus
set wildignore=*.bak,~,*.o,*.info,*.swp,*.class
set winminheight=0
set modelines=1
set autowrite
set ttyfast
set nowrap
set wildmode=longest,list,full
" set diffopt+=algorithm:patience
" set diffopt+=indent-heuristic

set hlsearch
set tags=.tags;
set timeout timeoutlen=400
set foldenable "check

" Remapping Keys Defaults (fix alt mapping)
" if !has('gui_running')
"   map <A-n>
" endif

" Undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" set highlight mode
" set highlight=8b,@-,db,es,lb,mb,M-,nu,rs,sr,tb,vr,ws
" todo: not working
highlight TermCursor cterm=bold gui=bold ctermbg=black ctermfg=green guibg=black guifg=green


" FileType Config
filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set smartindent
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab textwidth=0

" Relative numbering (toggle with ',,r')
set number norelativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc
nnoremap <leader><leader>r :call NumberToggle()<cr>

" Remappings for Jump to Start/End of Line
noremap gh ^
noremap gl $
" noremap H ^
" noremap L $
" unmap J
" remap J :10j

" Remappings for Write/Quite
nnoremap <leader><leader><leader>w :w!<CR>
nnoremap <leader><leader><leader>q :q!<CR>
nnoremap <leader><leader>w :w<CR>
nnoremap <leader><leader>wq :wq<CR>
nnoremap <leader><leader>q :q<CR>

" EasyMotion
map <leader> <Plug>(easymotion-prefix)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap <Leader>s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 1 " keep cursor column when JK motion

" Quick Scope
let g:qs_max_chars=240
let g:qs_lazy_highlight = 1
  augroup qs_colors
    autocmd!
    autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
  augroup END
" let g:qs_accepted_chars = [a-zA-Z0-9]

" Vim-Sneak
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
autocmd ColorScheme * highlight SneakScope guifg=green guibg=black ctermfg=green ctermbg=black
autocmd ColorScheme * highlight Sneak guifg=yellow guibg=black ctermfg=yellow ctermbg=black

" Operator-Flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$
" g:operator#flashy#group
let g:operator#flashy#flash_time = 200
highlight Flashy ctermfg=9 ctermbg=19


" Color-Scheme
syntax on
colorscheme monokai
set termguicolors
" set t_Co=256


" Goyo plugin makes text more readable when writing prose:
map <leader><leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader><leader>o :setlocal spell! spelllang=en_us<CR>


" Nerd tree
map <A-h><A-h> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
map <leader><C-h> <C-w>h
map <leader><C-j> <C-w>j
map <leader><C-k> <C-w>k
map <leader><C-l> <C-w>l

" Check file in shellcheck:
" map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
" map <leader>b :vsp<space>$BIB<CR>
" map <leader>r :vsp<space>$REFER<CR>

" Replace all is aliased to S.
" nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
" map <leader><leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
" map <leader><leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
" autocmd VimLeave *.tex !texclear %

autocmd BufRead,BufNewFile */notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
" autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
" autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=light

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
" autocmd BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Navigating with guides
" inoremap <leader><leader> <Esc>/<Enter>"_c4l
" vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
" map <leader><leader> <Esc>/<++><Enter>"_c4l

""""LATEX
"" Word count:
"" autocmd FileType tex map <leader>w :w !detex \| wc -w<CR>
"" Code snippets
"autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
"autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
"autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
"autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
"autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
"autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
"autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
"autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
"autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
"autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
"autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
"autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
"autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
"autocmd FileType tex inoremap ,li <Enter>\item<Space>
"autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
"autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
"autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
"autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
"autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
"autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
"autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
"autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
"autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
"autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
"autocmd FileType tex inoremap ,bt {\blindtext}
"autocmd FileType tex inoremap ,nu $\varnothing$
"autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
"autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

""""HTML
"autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
"autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
"autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
"autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
"autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
"autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
"autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
"autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
"autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
"autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
"autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
"autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
"autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
"autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
"autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
"autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
"autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
"autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
"autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
"autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
"autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
"autocmd FileType html inoremap &<space> &amp;<space>
"autocmd FileType html inoremap á &aacute;
"autocmd FileType html inoremap é &eacute;
"autocmd FileType html inoremap í &iacute;
"autocmd FileType html inoremap ó &oacute;
"autocmd FileType html inoremap ú &uacute;
"autocmd FileType html inoremap ä &auml;
"autocmd FileType html inoremap ë &euml;
"autocmd FileType html inoremap ï &iuml;
"autocmd FileType html inoremap ö &ouml;
"autocmd FileType html inoremap ü &uuml;
"autocmd FileType html inoremap ã &atilde;
"autocmd FileType html inoremap ẽ &etilde;
"autocmd FileType html inoremap ĩ &itilde;
"autocmd FileType html inoremap õ &otilde;
"autocmd FileType html inoremap ũ &utilde;
"autocmd FileType html inoremap ñ &ntilde;
"autocmd FileType html inoremap à &agrave;
"autocmd FileType html inoremap è &egrave;
"autocmd FileType html inoremap ì &igrave;
"autocmd FileType html inoremap ò &ograve;
"autocmd FileType html inoremap ù &ugrave;


"""".bib
"autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
"autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
"autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

""MARKDOWN
"" autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
"autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
"autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
"autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
"autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
"autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
"autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
"autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
"autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
"autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
"autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
"autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
"autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
"autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
"autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

"""".xml
"autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
"autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"



" shows content of registers (" and @ )
"Plug 'junegunn/vim-peekaboo'
" g:peekaboo_window = 'vertical botright 30new'
" g:peekaboo_delay = 200
" g:peekaboo_compact = 0 " (boolean)	Compact display
" g:peekaboo_prefix "Empty (string)	Prefix for key mapping (e.g. <leader>)
" g:peekaboo_ins_prefix "Empty (string)	Prefix for insert mode key mapping (e.g. <c-x>)
" let g:peekabo_prefix = '<leader>'

" for quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Disable automatic commenting on newline
autocmd FileType setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Header constants for generating and updating the comment header
let g:header_field_author = 'Mark Bucklin'
let g:header_field_author_email = 'markbucklin@gmail.com'

autocmd FileType markdown set conceallevel=3

" Remap ESCAPE back from INSERT to NORMAL mode to add MOVE RIGHT
" inoremap <ESC> <ESC><right>
" imap jj <ESC>
" imap kk <ESC><right>
" imap jk <ESC><right>
" imap kj <ESC>
" <M-NL>
" <M-C-K>
inoremap <M-i> <right><ESC>
inoremap <C-j> <ESC>$
" nnoremap Q :q!

" Use ctrl+alt+enter or shift+alt+enter to add a blank line above or below
nnoremap <M-CR> O<ESC>
nnoremap <M-M> o<ESC>

inoremap  <ESC>:Commentary<CR>
nnoremap  :Commentary<CR>
vnoremap  :Commentary<CR>
"  
:imap <c-k> <right><esc>Da
" :imap <c-y> <esc><right>"+p
:imap <c-y> <esc>p
:inoremap  <esc>ui


" test text for imap imap

" Vim after ob
" r * call after_object#enable([']', '['], '=', ':')
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '_', '%', ';')

" CtrlSF  <C-Space>
nmap     <C-Space>f <Plug>CtrlSFPrompt
vmap     <C-Space>f <Plug>CtrlSFVwordPath
vmap     <C-Space>F <Plug>CtrlSFVwordExec
nmap     <C-Space>n <Plug>CtrlSFCwordPath
nmap     <C-Space>p <Plug>CtrlSFPwordPath
nnoremap <C-Space>o :CtrlSFOpen<CR>
nnoremap <C-Space>t :CtrlSFToggle<CR>
inoremap <C-Space>t <Esc>:CtrlSFToggle<CR>

" Easy moving between tabs and windows
" map <C-J> <C-W>j
" map <C-K> <C-W>k
" map <C-L> <C-W>l
" map <C-H> <C-W>h
nnoremap <Leader>jh 1<C-W>w
nnoremap <Leader>jl 1<C-W>b

" Wrapped lines goes down/up to next row, rather than next line in file.
" nnoremap j gj
" nnoremap k gk

" Remove keybinding for Ex Mode
nnoremap Q <nop>


" fzf drop down
let g:fzf_layout = { 'down': '~40%' }

" fzf mappings
nnoremap <Leader>.f :Files<CR>
nnoremap <Leader>.l :Lines<CR>
nnoremap <Leader>.t :Tags<CR>
nnoremap <Leader>.b :Buffers<CR>
nnoremap <Leader>.c :Commands<CR>
nnoremap <Leader>.w :Windows<CR>
nnoremap <Leader>.a :Ag<CR>
nnoremap <Leader>.g :GitFiles<CR>
nnoremap <Leader>.o :Locate<Space>
nnoremap <Leader>.m :Maps<CR>
nnoremap <Leader>.h :History<CR>
nnoremap <Leader>.s :Snippets<CR>
nnoremap <Leader>.i :Commits<CR>
nnoremap <Leader>.r :Colors<CR>
nnoremap <Leader>.e :Helptags<CR>
nnoremap <Leader>..c :BCommits<CR>
nnoremap <Leader>..t :BTags<CR>
nnoremap <Leader>..l :BLines<CR>

" CtrlP compatibility
" nnoremap <C-P> :Files<CR>
nmap <Leader>z <Leader>.

" autocmd! User FzfStatusLine call airline#update_once()

" Command override (with preview)
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)


" Airline-Tabline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
" let g:airline_theme= 'gruvbox'


" Zsh-Completion
:set completefunc=zsh_completion#Complete

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader><Leader>h :%s//g<Left><Left>

let g:bookmark_no_default_key_mappings = 1
let g:bookmark_highlight_lines=1
let g:bookmark_manage_per_buffer = 1
nmap <Leader>bb <Plug>BookmarkToggle
nmap <Leader>bi <Plug>BookmarkAnnotate
nmap <Leader>ba <Plug>BookmarkShowAll
nmap <Leader>bj <Plug>BookmarkNext
nmap <Leader>bk <Plug>BookmarkPrev
nmap <Leader>bc <Plug>BookmarkClear
nmap <Leader>bx <Plug>BookmarkClearAll
nmap <Leader>bmk <Plug>BookmarkMoveUp
nmap <Leader>bmj <Plug>BookmarkMoveDown


" Cursor control
if &term =~ "xterm\\|rxvt"
  let &t_SI = "\<Esc>]12;blue\x7"
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  let &t_SI .= "\<Esc>[6 q"
  let &t_EI .= "\<Esc>[5 q"
    let &t_SR .= "\<Esc>[1 q"
endif


" "in line" (entire line sans white-space; cursor at beginning--ie, ^)
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>


 " Vim Multiple Cursors
 let g:multi_cursor_use_default_mapping=0
 let g:multi_cursor_start_word_key      = '<C-n>'
 let g:multi_cursor_select_all_word_key = '<A-n>'
 let g:multi_cursor_start_key           = 'g<C-n>'
 let g:multi_cursor_select_all_key      = 'g<A-n>'
 let g:multi_cursor_next_key            = '<C-n>'
 let g:multi_cursor_prev_key            = '<C-p>'
 let g:multi_cursor_skip_key            = '<C-x>'
 let g:multi_cursor_quit_key            = '<Esc>'

"
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
highlight multiple_cursors_cursor  cterm=bold ctermbg=darkblue gui=bold guibg=darkblue guifg=orange
highlight link multiple_cursors_visual Visual


" function! MmarkFmt ()
"     let l = line(".")
"     let c = col(".")
"     silent !clear
"     execute "%!" . "mmark -markdown"
"     redraw!
"     call cursor(l, c)
" endfunction

let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
" let g:pandoc#modules#disabled = ["folding"]
let g:pandoc#formatting#mode = "a"
let g:pandoc#formatting#textwidth = 0
let g:pandoc#folding#mode = "stacked"
let g:pandoc#folding#level = 2
let g:pandoc#folding#fastfolds = 1
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fold_div_classes = 1

let g:pandoc#completion#bib#use_preview = 1

" au FileType pandoc command! Fmt call MmarkFmt()
" au FileType markdown command! Fmt call MmarkFmt()
" let mmark = "mmark -markdown -width 100"
" au FileType pandoc set formatprg=mmark
" au FileType markdown set formatprg=mmark

