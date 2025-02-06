source ~/.vim/base.vim 
source ~/.vim/test.vim
source ~/.vim/cons_only.vim
source ~/.vim/grep-operator.vim

" {{{ wl-copy
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
" }}}

" {{{ Lang
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
"set keymap=russian-jcukenwin
" }}}

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'

"text
Plug 'lervag/vimtex'
Plug 'preservim/vim-markdown'
Plug 'godlygeek/tabular'

"complete
Plug 'jiangmiao/auto-pairs'

Plug 'prabirshrestha/vim-lsp'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"design
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'
call plug#end()



" Color
colorscheme catppuccin_frappe
let g:lightline = {'colorscheme': 'catppuccin_frappe'}" 
set laststatus=2

"{{{ UltiSnips
"let g:UltiSnipsExpandTrigger="<>"
let g:UltiSnipsJumpForwardTrigger="<c-\\>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
"}}}

"NerdTree
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeMapOpenInTab = 1
let NERDTreeMapOpenInTabSilent = 1


"{{{ VimTex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
let g:tex_flavor='latex'
let g:vimtex_quickfix_autojump = 0
let maplocalleader = ","
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
"}}}

"{{{ MarkDown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_borderless_table = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
"}}}


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
"complete
Plugin 'ycm-core/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
call vundle#end()            " required

"{{{ YCM
let g:ycm_global_ycm_extra_conf = '/home/dyuzha/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_enable_semantic_highlighting=1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 10 
"}}}

"{{{ Pymode
let g:pymode_options = 1
let g:pymode_motion = 1
" C means class
" M means method or function

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0

let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'


" == checker ==
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes, pep8"
let g:pymode_lint_checker = "E501,E601,C0110"
let g:pymode_lint_on_write = 0
let g:pymode_lint_cwindow = 0

"let g:pymode_lint_ignore = []


let g:pymode_virtualenv = 1

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_slow_sync = 1

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>e'

let g:pymode_lint_todo_symbol = 'W'                                              
let g:pymode_lint_comment_symbol = 'C'                                           
let g:pymode_lint_visual_symbol = 'R'                                            
let g:pymode_lint_error_symbol = 'E'                                             
let g:pymode_lint_info_symbol = 'I'                                              
let g:pymode_lint_pyflakes_symbol = 'F'   
" }}}
