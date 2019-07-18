" if empty(glob('~/.vim/autoload/plug.vim'))
  " silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    " \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
set number relativenumber
set mouse=a
set clipboard=unnamedplus "to copy paste across terminals with yy and p
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-surround'
" Plug 'townk/vim-autoclose'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
" let g:airline_powerline_fonts = 1
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
" dark colors for line number and comments
map <C-n> :NERDTreeToggle<CR>
hi LineNr ctermfg=8
hi comment ctermfg=7
