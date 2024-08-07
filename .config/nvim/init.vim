set number mouse=a
set cpoptions+=y "Make yank repeatable with .
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
Plug 'glench/vim-jinja2-syntax'

" Coding
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'preservim/vimux'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-speeddating'
" Plug 'tpope/vim-rsi'
Plug 'ludovicchabant/vim-gutentags'
Plug 'psliwka/vim-smoothie'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'aserowy/tmux.nvim'
Plug 'chrisgrieser/nvim-spider'
Plug 'chrisgrieser/nvim-various-textobjs'
" Plug 'chiel92/vim-autoformat'
" Tests
Plug 'airblade/vim-rooter'
Plug 'vim-test/vim-test'
Plug 'ankush/frappe_test.vim'

""""""""
"  LSP  "
"""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'

""""""""""""""""
"  treesitter  "
""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'andymass/vim-matchup'
Plug 'hiphish/rainbow-delimiters.nvim'

"search
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'fannheyward/telescope-coc.nvim'

"nginx
Plug 'LeonB/vim-nginx'

"disable search highlight after done
Plug 'romainl/vim-cool'

" Fuzzy find
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" Fancy
Plug 'folke/twilight.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'wakatime/vim-wakatime'

" Writing
Plug 'img-paste-devs/img-paste.vim'
Plug 'vimwiki/vimwiki'


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
autocmd! BufReadPost,BufNewFile *.py call SetupEnvironment()

let g:netrw_browsex_viewer="xdg-open"

" Always copy sql to clipboard on save
function! CopyBufferToClipboard()
	:%y+
endfunction
autocmd! BufWritePost *.sql call CopyBufferToClipboard()

""""""""""""""""""""""""
"  Tree Sitter config  "
""""""""""""""""""""""""
lua require('treesitter_config')

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

"""""""""""""
"  vimwiki  "
"""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Don't treat all markdown files as part of vimwiki
let g:vimwiki_global_ext = 0

" Don't mess with autocomplete
au filetype vimwiki silent! iunmap <buffer> <Tab>

"""""""""""""""""
"  nvim-spider  "
"""""""""""""""""
lua require('various_textobjs_config')
lua require('spider_config')

"""""""""""""""""""""
"  twilight config  "
"""""""""""""""""""""

lua << EOF
  require("twilight").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

""""""""""""""""""
"  matchup conf  "
""""""""""""""""""

lua << EOF
require('nvim-treesitter.configs').setup {
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
  },
}
EOF

"""""""""""""""""""""
"  build integration  "
"""""""""""""""""""""
function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! SetMakePrg()
	let path = expand('%:p')
  " Get path to file from cwd and without extension. rooter required for correct root.
  let path = fnamemodify(path, ':.:r')
  let path = substitute(path, '\/', '.', 'g')
	if StartsWith(expand('%:t'), 'test')
		let make_cmd = "bench --site test_frappe_cloud run-tests --failfast --module " . l:path
		let &makeprg= l:make_cmd
	endif
endfunction

let g:asyncrun_open = 8

nnoremap <leader>n :TestNearest -strategy=asyncrun_background<CR>
nnoremap <leader>N :TestNearest -strategy=vimux<CR>
nnoremap <leader>m :call SetMakePrg()<CR>
nnoremap <leader>mm :call SetMakePrg()<CR>:call <SNR>101_Python_jump('n','\v^\s*(class\|def\|async\ def)>','Wb',v:count1)<CR>w"8yt(:set makeprg+=\ --test\ <C-R>8<CR><c-o>
"b for build
nnoremap <leader>b :Make<CR>
nnoremap <leader>B :AsyncRun -program=make -pos=tmux -mode=term<CR>

let g:rooter_patterns = ['.git']

let test#custom_runners = {'python': ['Frappe']}
let test#enabled_runners = ["python#frappe"]
let g:test#strategy = "asyncrun_background"

let g:test#python#frappe#testsite = "test_frappe_cloud"  " important to specify your test site name here
let g:test#python#frappe#arguments = "--failfast"  " arguments to run-test function

"quickfix window close
nnoremap ,q :cclose<CR>

" juggling with quickfix entries
nnoremap <End>  :cnext<CR>
nnoremap <Home> :cprevious<CR>

" " close quickfix window if its the last one
" augroup QFClose
"   autocmd!
"   autocmd WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
" augroup END


