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
set wildignore+=**/arduino/**
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

