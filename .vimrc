if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
Plug 'townk/vim-autoclose'
"Plug 'vim-scripts/cSyntaxAfter'
call plug#end()

"autocmd! FileType c,cpp,java,php call CSyntaxAfter() "for cSyntaxAfter plugin

set number relativenumber
set mouse=a
set clipboard=unnamedplus "to copy paste across terminals with yy and p

let g:airline_powerline_fonts = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="tabdo"
" to make ultisnips look for private snippets in .UltiSnips directory in current workspace
let g:UltiSnipsSnippetsDir=".UltiSnips"
let g:UltiSnipsSnippetDirectories=[getcwd()."/".g:UltiSnipsSnippetsDir, "UltiSnips"]

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

map <C-n> :NERDTreeToggle<CR>
