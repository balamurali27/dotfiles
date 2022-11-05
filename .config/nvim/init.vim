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
" Plug 'arcticicestudio/nord-vim'
Plug 'shaunsingh/nord.nvim'
Plug 'bignimbus/pop-punk.vim'
" HTML
Plug 'mattn/emmet-vim'

" Coding
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-rsi'
Plug 'ludovicchabant/vim-gutentags'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
" Plug 'chiel92/vim-autoformat'
" Tests
Plug 'airblade/vim-rooter'
Plug 'vim-test/vim-test'
Plug 'ankush/frappe_test.vim'

""""""""
"  LSP  "
"""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'github/copilot.vim'

"search
" Plug 'kyazdani42/nvim-web-devicons'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" Plug 'fannheyward/telescope-coc.nvim'

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
Plug 'img-paste-devs/img-paste.vim'

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
let g:nord_contrast = v:false
let g:nord_borders = v:true
let g:nord_disable_background = v:false
let g:nord_italic = v:true
let g:nord_uniform_diff_background = v:true
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

" Always copy sql to clipboard on save
function! CopyBufferToClipboard()
	:%y+
endfunction
autocmd! BufWritePost *.sql call CopyBufferToClipboard()

let g:rooter_patterns = ['.git', 'package.json']

let test#custom_runners = {'python': ['Frappe']}
let test#enabled_runners = ["python#frappe"]
let test#strategy = "make"

let g:test#python#frappe#testsite = "frappe_cloud_test"  " important to specify your test site name here

""""""""""""""""""""""""
"  Tree Sitter config  "
""""""""""""""""""""""""
lua require('treesitter')

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Disable treesitter for highlighting
function! DisableTreeSitterHighlight()
	:TSBufDisable highlight
endfunction
" Disable treesitter for highlighting markdown as comments aren't dulled out
autocmd! BufEnter *.md call DisableTreeSitterHighlight()

""""""""""""""""""
"  md-img-paste  "
""""""""""""""""""

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'
