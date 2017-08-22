source ~/.dotfiles/nvim/plugins.vim
source ~/.dotfiles/nvim/functions.vim

syntax enable

set background=dark
colorscheme solarized8_dark

let g:solarized_visibility= "normal"
let g:solarized_termtrans= 1
let g:solarized_old_cursor_style= 1

let mapleader = ','
nnoremap <leader>ev :e $MYVIMRC<cr>                  " edit init.vim
nnoremap <leader>ef :so ~/.config/nvim/init.vim<cr>  " reload init.vim
set modelines=0

set foldmethod=manual

syntax enable
highlight clear VertSplit
highlight clear LineNr
"highlight VertSplit ctermfg=black ctermbg=none
"highlight CursorLine ctermbg=none ctermfg=white guibg=black guibg=0
"highlight CursorLineNr term=bold ctermfg=yellow guifg=White
"highlight Normal ctermfg=None ctermbg=none
"highlight clear SignColumn
"highlight ALEErrorSign ctermbg=none ctermfg=1
"highlight ALEWarningSign ctermbg=none ctermfg=blue
"highlight ErrorMsg ctermbg=none ctermfg=1
hi MatchParen cterm=none ctermbg=none ctermfg=5

set fillchars+=vert:\|
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
set linespace=2
"set backupcopy=yes

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" Clear search highlighting
nnoremap <leader><space> :let @/=''<cr>
nnoremap <cr> :nohlsearch<cr><cr>
" Toggle NERDTree
map <silent> <C-n> :NERDTreeToggle<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=80
set formatoptions=qrn1
highlight ColorColumn ctermbg=5
call matchadd('ColorColumn', '\%81v.', 100)

set clipboard=unnamedplus

nnoremap j gj
nnoremap k gk

" Escape Insert Mode with 'jk' or 'kj'
inoremap jk <ESC>
inoremap kj <ESC>

" Windows
map <silent> <C-h> :call functions#WinMove('h')<cr>
map <silent> <C-j> :call functions#WinMove('j')<cr>
map <silent> <C-k> :call functions#WinMove('k')<cr>
map <silent> <C-l> :call functions#WinMove('l')<cr>

map <silent> <C-w> :q<cr>

" https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
" deoplete config
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:UltiSnipsExpandTrigger="<C-m>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" ^^^^^^^ end config from above webpage

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Ale, lint only on save
"let g:ale_lint_on_text_changed = 'never'

let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

let g:ale_javascript_eslint_executable = 'eslint_d'

let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
