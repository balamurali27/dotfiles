set number relativenumber mouse=a
" copy from one vim instance to another
set clipboard=unnamedplus
set foldlevelstart=99 foldmethod=syntax
" reduce delay when going to normal mode from insert mode
set timeoutlen=1000 ttimeoutlen=0
" switch buffers without writing
set hidden

call plug#begin()
" Colour
" Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'
" HTML
Plug 'mattn/emmet-vim'

" Coding
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rsi'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/vim-easy-align'
Plug 'Chiel92/vim-autoformat'
Plug 'psliwka/vim-smoothie'
"disable search highlight after done
Plug 'romainl/vim-cool'

" remove next two probably
" Plug 'coddingtonbear/neomake-platformio'
" Plug 'embear/vim-localvimrc'

" Plug 'dense-analysis/ale'

" Fuzzy find
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" Writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

"""""""""""""""
"  gutentags  "
"""""""""""""""
"ctags obey gitignore and faster
if executable('rg')
	let g:gutentags_file_list_command = 'rg --files'
endif

"""""""""""""""
"  EasyAlign  "
"""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""
""  nord  "
""""""""""""
"let g:nord_italic                        = 1
"let g:nord_underline                     = 1
"let g:nord_italic_comments               = 1
"let g:nord_cursor_line_number_background = 1
"set cursorline
"colorscheme nord
""""""""""""""
"  seoul256  "
""""""""""""""
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colorscheme seoul256

"""""""""""""""""""
"  Custom Colors  "
"""""""""""""""""""
" dark colors for line number and comments
highlight LineNr ctermfg=DarkGray
highlight comment ctermfg=DarkGray
highlight CursorLineNr ctermfg=LightGray

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

"""""""""""
"  Netrw  "
"""""""""""
let g:netrw_banner                       = 0
let g:netrw_liststyle                    = 3
let g:netrw_browse_split                 = 4
let g:netrw_altv                         = 1
let g:netrw_winsize                      = 25

""""""""""
""  fzf  "
""""""""""
"nnoremap <space> <Nop>
"" fuzzy find files in the working directory
"nnoremap <space>f :Files<cr>
"" fuzzy find lines in the current file
"nnoremap <space>/ :BLines<cr>
"" fuzzy find an open buffer
"nnoremap <space><space> :Buffers<cr>
"" fuzzy find text in the working directory
"nnoremap <space>r :Rg
"" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
"nnoremap <space>c :Commands<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Vanilla file switch                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use space as leader
nnoremap <space> <Nop>

" wildmenu tweaks
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.*
set wildignore+=**/node_modules/**
set wildignore+=**/build/**
set wildignore+=**/arduino-esp32/**
set wildignorecase

set wildcharm=<C-z>

" juggling with files
set path=.,**
set ignorecase
set smartcase
nnoremap <space>f :find <C-z><S-Tab>
" nnoremap <space>f :find <C-R>=expand('%:h').'/'<CR>
" nnoremap <space>f :find <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

" juggling with buffers
nnoremap <space><space> :bprevious!<CR> :buffer <C-z><S-Tab>
nnoremap <space>r :grep <CR>
nnoremap <space>v :vimgrep /
nnoremap <space>c :vimgrep <cword> ** <CR>
nnoremap <space>j :tjump /

" change grep default, (no idea how to use)
if executable("rg")
	set grepprg=rg\ -uuu
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" built in completion
inoremap <silent> ,f <C-x><C-f>
inoremap <silent> ,i <C-x><C-i>
inoremap <silent> ,l <C-x><C-l>
inoremap <silent> ,n <C-x><C-n>
inoremap <silent> ,o <C-x><C-o>
inoremap <silent> ,t <C-x><C-]>
inoremap <silent> ,u <C-x><C-u>

"""""""""""""""""""""
"  build integration  "
"""""""""""""""""""""
"build
nnoremap <leader>b :Make<CR>
nnoremap <leader>B :Make!<CR>
"quickfix window close
nnoremap <leader>q :cclose<CR>

" juggling with quickfix entries
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" close quickfix window if its the last one
augroup QFClose
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup END

" zeal mapping
:nnoremap gz :!zeal "<cword>"&<CR><CR>

" Goyo and Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 8

" automatic spell check for certain filetypes
augroup setSpelling
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=en_us
  autocmd FileType markdown  setlocal spell spelllang=en_us
augroup END

" pasted as copied, I have no idea how this works. Could be useful in the
" future
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

