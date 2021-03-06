set number relativenumber mouse=a
"Don't show documentation on omnicomplete
set completeopt-=preview
set foldlevelstart=99 foldmethod=syntax
" reduce delay when going to normal mode from insert mode
set timeoutlen=1000 ttimeoutlen=0
" switch buffers without writing
set termguicolors
set hidden
" logical yank mapping
:map Y y$

call plug#begin()
" Colour
Plug 'arcticicestudio/nord-vim'
Plug 'bignimbus/pop-punk.vim'
" HTML
Plug 'mattn/emmet-vim'

" Coding
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-rsi'
Plug 'ludovicchabant/vim-gutentags'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
" Plug 'chiel92/vim-autoformat'
""""""""
"  LSP  "
"""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"nginx
Plug 'LeonB/vim-nginx'

"disable search highlight after done
Plug 'romainl/vim-cool'

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 appearance                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
""  Custom Colors for when no themes "
""""""""""""""""""""""""""""""""""""""
"" dark colors for line number and comments
"highlight LineNr ctermfg=DarkGray
"highlight comment ctermfg=DarkGray
"highlight CursorLineNr ctermfg=LightGray

""""""""""""
""  nord  "
""""""""""""
let g:nord_italic                        = 1
let g:nord_underline                     = 1
let g:nord_italic_comments               = 1
let g:nord_cursor_line_number_background = 1
set cursorline
colorscheme nord

"""""""""""""""
"  gutentags  "
"""""""""""""""
let g:gutentags_ctags_tagfile = '.git/tags'

""""""""""""""""""""""
"  ripgrep optimize  "
""""""""""""""""""""""
if executable('rg')
	"ctags obey gitignore and faster
	let g:gutentags_file_list_command = 'rg --files'

	" change grep default, (no idea how to use)
	set grepprg=rg\ --vimgrep
	" set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

""""""""""""""""
""  Ultisnips  "
""""""""""""""""
let g:UltiSnipsExpandTrigger             = "<tab>"
let g:UltiSnipsJumpForwardTrigger        = "<tab>"
let g:UltiSnipsJumpBackwardTrigger       = "<s-tab>"

" let g:UltiSnipsEditSplit="tabdo"
let g:snips_author                       = "Balamurali M"
" make ultisnips look for private snippets in .UltiSnips directory in current workspace
let g:UltiSnipsSnippetsDir               = ".UltiSnips"
let g:UltiSnipsSnippetDirectories        = [getcwd()."/".g:UltiSnipsSnippetsDir,"UltiSnips/personal", "UltiSnips"]

"""""""""""""""""""""
"  build integration  "
"""""""""""""""""""""
"build
nnoremap <leader>b :Make<CR>
nnoremap <leader>B :Make!<CR>
"quickfix window close
nnoremap ,q :cclose<CR>

" juggling with quickfix entries
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" close quickfix window if its the last one
augroup QFClose
  autocmd!
  autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
augroup END

" zeal mapping
if executable('zeal')
	nnoremap gz :!zeal "<cword>"&<CR><CR>
endif

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

" search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" " pynvim constant path
" let g:python3_host_prog = "/home/balu/.pyenv/versions/3.8.1/bin/python"

" delete all buffers but current one
command! BufOnly execute '%bdelete|edit #|bdelete #|normal `"'
nnoremap <leader>d :BufOnly<CR>

""Chiel92/Autoformat (don't need if coc enabled)
"nnoremap <leader>f :Autoformat<CR>

" TEMPLATE to load project specific vim config(use separate file and load as after plugin)

function! SetupEnvironment()
	let l:path = expand('%:p')
	if l:path =~ '/home/balu/project-a/'
		"add common to all file config here with setlocal
		if &filetype == 'python'
			"options like compiler, makeprg, tabstop"
		elseif &filetype == 'vue'
			"vue specific options"
		endif
		"add subsequent project directories like this
	elseif l:path =~ '/home/balu/project-b/'
		"other project config
	endif
endfunction
autocmd! BufReadPost,BufNewFile * call SetupEnvironment()

