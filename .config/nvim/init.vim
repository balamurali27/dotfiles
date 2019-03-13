set number
set mouse=a
call plug#begin()
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Chiel92/vim-autoformat'
call plug#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
