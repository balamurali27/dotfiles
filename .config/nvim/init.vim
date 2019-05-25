" if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	" silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				" \  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
set number relativenumber mouse=a tabstop=8 shiftwidth=8
" switch buffers without writing
set hidden
" make html less lengthy
autocmd	BufReadPre *.html set tabstop=4 shiftwidth=4
"to copy paste across terminals with y and p
set clipboard=unnamedplus

call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'townk/vim-autoclose'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

" nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1
set cursorline
colorscheme nord

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsEditSplit="tabdo"
let g:snips_author="Balamurali M"
" to make ultisnips look for private snippets in .UltiSnips directory in current workspace
let g:UltiSnipsSnippetsDir=".UltiSnips"
let g:UltiSnipsSnippetDirectories=[getcwd()."/".g:UltiSnipsSnippetsDir,"UltiSnips/personal.snippets", "UltiSnips"]

let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

nnoremap <C-n> :NERDTreeToggle<CR>

" dark colors for line number and comments (for custom colorscheme)
" highlight LineNr ctermfg=8
" highlight comment ctermfg=7

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

