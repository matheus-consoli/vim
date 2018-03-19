set nocompatible

"""""""""""""""""""""""""""""""""""""""""""
" ---------------- PLUG ----------------- "
"""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" -- PLUGINS -- "

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fugitive'

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#whitespace#mixed_indent_algo = 0
    let g:airline#extensions#whitespace#symbol = '!'

Plug 'mkitt/tabline.vim'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#show_splits = 1
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'
    let g:airline#extensions#tabline#show_close_button = 1
    let g:airline#extensions#tabline#close_symbol = 'X'
    " let g:airline#extensions#tabline#fnametruncate = 0
    " let g:airline#extensions#tabline#keymap_ignored_filetypes =
    "         \ ['vimfiler', 'nerdtree', 'tagbar']
    " let airline#extensions#tabline#ignore_bufadd_pat =
    "         \ '\c\vgundo|undotree|vimfiler|tagbar|nerd_tree'

Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_detect_modified=1
    let g:airline_theme='wombat'

Plug 'ervandew/supertab'

Plug 'nvie/vim-flake8'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'davidhalter/jedi-vim'
    let g:jedi#completions_enabled = 1
    let g:jedi#force_py_version = 3

Plug 'zchee/deoplete-jedi'

if has('nvim')
    Plug 'shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#enable_refresh_always = 1
        let g:deoplete#enable_on_insert_enter = 1
        let g:python3_host_prog = '/usr/bin/python3'
        let g:loaded_python_provider = 1  " no python2
        let g:python_host_skip_check = 1  " no python2 checker
endif

Plug 'dracula/vim'

Plug 'rakr/vim-one'

Plug 'reewr/vim-monokai-phoenix'

Plug 'tmhedberg/SimpylFold'
    let g:SimpylFold_docstrign_preview=1

Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'flazz/vim-colorschemes'

Plug 'Yggdroot/indentLine'
    let g:indentLine_char = '┆'
    let g:indentLine_concealcursor = 0

if has('vim')
    Plug 'scrooloose/syntastic'
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        let g:syntastic_check_on_open=1
        let g:syntastic_loc_list_height=3
endif

Plug 'tpope/vim-commentary'

Plug 'lervag/vimtex'
    let g:airline#extensions#vimtex#enabled = 1

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'jiangmiao/auto-pairs'

Plug 'majutsushi/tagbar'
    noremap <F9> :TagbarToggle<cr>

Plug 'vim-scripts/numbers.vim'

Plug 'junegunn/fzf.vim'

if has('nvim')
    Plug 'w0rp/ale'
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '⌲'
    let g:ale_sign_warning = '⌳'
    let g:ale_lint_delay = 1000
    let g:airline#extensions#ale#enabled = 1
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%severity%] %code%: %s [%linter%] '
    nnoremap <leader>n <Plug>(ale_next_wrap)
    nnoremap <leader>p <Plug>(ale_previous_wrap)
    nnoremap <leader>g <Plug>(ale_go_to_definition_in_tab)
    nnoremap <leader>h <Plug>(ale_detail)
endif
" VER ryanoasis/vim-devicons

Plug 'tell-k/vim-autopep8'

call plug#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""
" --------------------------------------- "
"""""""""""""""""""""""""""""""""""""""""""
colorscheme monokai-phoenix

" -------- MAPS ---------"
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"  AUTO PAIRS
" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap [ []<left>
" inoremap " ""<left>
" inoremap ' ''<left>
nnoremap <space> za
noremap <c-n> :NERDTreeToggle<cr>
noremap <c-j> ddp
noremap <c-k> ddkP
vnoremap <c-j> dkp
vnoremap <c-k> dkP
noremap <M-down> <esc>:resize +2<cr>
noremap <M-up> <esc>:resize -2<cr>
noremap <M-left> <c-w><
noremap <M-right> <c-w>>
noremap <c-left> <c-w>h
noremap <c-right> <c-w>l
noremap <c-down> <c-w>j
noremap <c-up> <c-w>k
noremap <C-M-k> <c-w>K
noremap <C-M-j> <c-w>J
noremap <C-M-l> <c-w>L
noremap <C-M-h> <c-w>H
nnoremap <silent> <leader>2 :setlocal spell! spelllang=en<cr>
nnoremap <silent> <leader>1 :setlocal spell! spelllang=pt_br<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>s Yp$
nnoremap <leader>z :noh<cr>
nnoremap <leader>b i<cr>
nnoremap <leader>vim :w<cr>:source $MYVIMRC<cr>
nnoremap <pageUP> :bNext<cr>
nnoremap <pageDOWN> :bprevious<cr>
nnoremap <leader><tab> :tabnew<cr>
nnoremap <leader>a :%y+<cr>
tnoremap <esc> <c-\><c-n>


" ------- SETS ------ "
set t_ut=
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
set relativenumber
set magic
set autoindent
set tabstop=4
set expandtab
set ruler
set shiftwidth=4
set showmode
set showmatch
set encoding=utf-8
set cursorline
set textwidth=79
set synmaxcol=80
set list
set listchars+=trail:•
set nojoinspaces
if exists('$SUDO_USER')
    set noswapfile
else
    set directory+=~/.config/.tmp/swap//
    set directory+=.
endif
if exists('$SUDO_USER')
    set nobackup
    set nowritebackup
else
    set backupdir+=~/.config/nvim/.tmp/backup
    set backupdir+=.
endif
set undolevels=1000
if exists('$SUDO_USER')
    set noundofile
else
    set undodir+=~/.config/nvim/.tmp/undo
    set undodir+=.
endif
set autoread
set history=200
set scrolloff=4
set backspace=indent,eol,start
set colorcolumn=+1
" set completeopt-=preview
set showcmd
set path+=**
set wildmenu
set hidden
set splitbelow
set splitright
set inccommand=split
" set list lcs=tab:\┆\  "like indentLine plugin, but for tabs indentation
" let &l:colorcolumn='+' . join(range(0, 254), ',+')

if has('folding')
    if has('windows')
        set fillchars=vert:│
    endif
    set foldmethod=indent
    set foldlevelstart=99
endif
set virtualedit=block
syntax on




" ----- last cursor position ----- "
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


augroup BgHighlight
    autocmd!

    autocmd WinEnter * set relativenumber
    autocmd WinLeave * set norelativenumber

    autocmd WinEnter * set ruler
    autocmd WinLeave * set noruler

    autocmd WinEnter * set laststatus=2
    autocmd WinLeave * set laststatus=0

    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline

    " autocmd! FocusLost ColorColumn='+' . join(range(0, 254), ',+')

    autocmd TermOpen * set norelativenumber nonumber
    autocmd TermClose * set norelativenumber nonumber

    autocmd! VimEnter * hi SignColumn ctermbg=236
                        hi MatchParen cterm=bold ctermbg=none ctermfg=yellow
                        hi CursorLineNr ctermbg=239 ctermfg=yellow
                        hi ALEWarningSign cterm=bold ctermbg=236 ctermfg=yellow
                        hi ALEErrorSign cterm=bold ctermbg=236 ctermfg=9
augroup end


augroup ALE_confs
    autocmd!
    autocmd! VimEnter * hi ALEWarning cterm=italic ctermbg=none ctermfg=none
             hi ALEWarningLine cterm=italic
             hi ALEError cterm=undercurl ctermbg=none
             hi ALEErrorLine cterm=italic,bold ctermfg=red
augroup end


" USEFULL UNICODE CHARS
" ⛔26d4
" ✘ 2718
" ✔ 2714
" ⛉ 26c9
" ⛊ 26ca
" ⌲ 2332
" ⌳ 2333
" ☠ 2620
" ☢ 2622
" ☣ 2623
