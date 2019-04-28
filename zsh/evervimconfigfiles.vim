"" All of them, for testing purpose
let g:evervim_bundle_groups=[
            \ 'general',
            \ 'appearance',
            \ 'writing',
            \ 'youcompleteme',
            \ 'programming',
            \ 'python',
            \ 'javascript',
            \ 'typescript',
            \ 'html',
            \ 'misc',
            \ 'go',
            \ 'rust',
            \ 'cpp',
            \ 'lua',
            \ 'css',
            \ 'r',
            \ 'haskell',
            \ 'html',
            \ 'java',
            \ 'latex',
            \ 'matlab',
            \ 'php',
            \ 'ruby',
            \ 'scala',
            \ ]

" for quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" Color Theme
" Use :Colors for a list of available colorschemes
let g:evervim_color_theme="brogrammer"
let g:evervim_airline_theme="brogrammer"
let g:evervim_light_background = 0

"" Color Theme
"" If it's beyond dusk, I use dark theme.
"" Other wise, a lighter theme will be chosen.
"let cur_hour = str2nr(strftime("%H", localtime()))
"if cur_hour > 18 || cur_hour < 8
"let g:evervim_color_theme="dracula"
"let g:evervim_airline_theme="dracula"
"else
"let g:evervim_color_theme="pencil"
"let g:evervim_airline_theme="pencil"
"let g:evervim_light_background=1
"endif


" Disable automatic commenting on newline
 autocmd FileType setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Customize Patched Font
" Pick one at https://github.com/ryanoasis/nerd-fonts
" By default it's "Knack Nerd Font" on Unix and "Knack NF" on Windows
let g:evervim_font="FiraCode-Regular"
let g:evervim_font_size="16"


let g:override_evervim_bundles = 1

" Header constants for generating and updating the comment header
let g:header_field_author = 'Mark Bucklin'
let g:header_field_author_email = 'markbucklin@gmail.com'


" Leader keys
let g:evervim_leader=','
let g:evervim_localleader='\\'


" Enable smooth scrolling
" Use physics-based smooth scrolling for half-page/full-page scrolling
" Friction and air-drag can be override here
"let g:evervim_smooth_scrolling = 0

" Enable transparent background on terminal vim/nvim
let g:evervim_transparent_bg = 1

" Clear search highlighting
let g:evervim_clear_search_highlight = 1

" This makes the completion popup strictly passive.
" Keypresses acts normally. <ESC> takes you of insert mode, words don't
" automatically complete, pressing <CR> inserts a newline, etc. Iff the
" menu is open, tab will cycle through it. If a snippet is selected, <C-k>
" expands it and jumps between fields.
let g:evervim_noninvasive_completion = 1

let g:evervim_hybrid_linenumber = 1

" 80 Column Warning
" Shows a magenta line at column 81 only for those lines that exceeds 80
"   let g:evervim_80_column_warning = 1

" Minimap Support
" Shows a minimap on the right hand side, need has_python
"   let g:evervim_minimap

" Don't create default mappings for multicursors
" See :help multiple-cursors-mappings
   let g:multi_cursor_use_default_mapping=0
   let g:multi_cursor_next_key='<C-n>'
   let g:multi_cursor_prev_key='<C-p>'
   let g:multi_cursor_skip_key='<C-x>'
   let g:multi_cursor_quit_key='<Esc>'
" Require a special keypress to enter multiple cursors mode
   let g:multi_cursor_start_key='+'

" Mappings for editing/applying evervim config
let g:evervim_edit_config_mapping='<leader>ec'
let g:evervim_apply_config_mapping='<leader>ac'

" comment
" another
" disable this crap 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType markdown set conceallevel=0


"imap jj <ESC>
"imap kk <ESC>
imap jk <ESC>
imap kj <ESC>

 " Vim after object
autocmd VimEnter * call after_object#enable([']', '['], '=', '=', ':', '-', '#', ' ')



" let g:ALE
