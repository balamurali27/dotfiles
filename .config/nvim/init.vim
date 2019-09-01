set number relativenumber mouse=a
set foldlevelstart=99 foldmethod=syntax
" reduce delay when going to normal mode from insert mode
set timeoutlen=1000 ttimeoutlen=0
" switch buffers without writing
set hidden
" enable spell check in comments and documents
set spell spelllang=en_gb

call plug#begin()
" Colour
Plug 'arcticicestudio/nord-vim'

" HTML
Plug 'mattn/emmet-vim'

" Editing
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
call plug#end()

"""""""""""""""
"  EasyAlign  "
"""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""
"  nord  "
""""""""""

let g:nord_italic                        = 1
let g:nord_underline                     = 1
let g:nord_italic_comments               = 1
let g:nord_cursor_line_number_background = 1
set cursorline
colorscheme nord

"""""""""""""""
"  ultisnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger             = "<tab>"
let g:UltiSnipsJumpForwardTrigger        = "<tab>"
let g:UltiSnipsJumpBackwardTrigger       = "<s-tab>"
" let g:UltiSnipsEditSplit="tabdo"
let g:snips_author                       = "Balamurali M"
" make ultisnips look for private snippets in .UltiSnips directory in current workspace
let g:UltiSnipsSnippetsDir               = ".UltiSnips"
let g:UltiSnipsSnippetDirectories        = [getcwd()."/".g:UltiSnipsSnippetsDir,"UltiSnips/personal", "UltiSnips"]

"""""""""""""""""""
"  NERDcommenter  "
"""""""""""""""""""
let g:NERDSpaceDelims                    = 1
let g:NERDTrimTrailingWhitespace         = 1

"""""""""""
"  Netrw  "
"""""""""""
let g:netrw_banner                       = 0
let g:netrw_liststyle                    = 3
let g:netrw_browse_split                 = 4
let g:netrw_altv                         = 1
let g:netrw_winsize                      = 25
nnoremap <C-n> :Vex<CR>

"""""""""
"  fzf  "
"""""""""
nnoremap <space> <Nop>
" fuzzy find files in the working directory
nnoremap <space>f :Files<cr>
" fuzzy find lines in the current file
nnoremap <space>/ :BLines<cr>
" fuzzy find an open buffer
nnoremap <space><space> :Buffers<cr>
" fuzzy find text in the working directory
nnoremap <space>r :Rg
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nnoremap <space>c :Commands<cr>

"""""""""""""""""""""""""
"  built in completion  "
"""""""""""""""""""""""""
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

