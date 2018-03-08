set nocompatible

"""""""""""""""""""""""""""""""""""""""""""
" ---------------- VUNDLE --------------- " 
"""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" -- PLUGINS -- "
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
    let g:airline#extisions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#formatter = 'unique_tail'
Plugin 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_detect_modified=1
    let g:airline_powerline_fonts=1
    let g:airline_theme='angr'
Plugin 'ervandew/supertab'
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
    let g:jedi#force_py_version = 3
if !has('nvim')
    Plugin 'valloric/youcompleteme'
        " --- instalar o clang e recompilar  --- "
        "  sudo apt-get install clang
        "  cd ~/.vim/bundle/youcompleteme
        "  python3 install.py --all
        let g:ycm_autoclose_preview_window_after_completion=1
        let g:ycm_python_binary_path='/usr/bin/python3'
        map <leader>g :ycmcompleter gotodefinitionelsedeclaration<cr>
endif
if has('nvim')
    Plugin 'shougo/deoplete.nvim'
        let g:deoplete#eneble_at_startup = 1
        let g:python3_host_prog = '/usr/bin/python3'
        let g:loaded_python_provider = 1  " no python2
        let g:python_host_skip_check = 1  " no python2 checker
endif
Plugin 'dracula/vim'
Plugin 'rakr/vim-one'
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'tmhedberg/SimpylFold'
    let g:SimpylFold_docstrign_preview=1
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'flazz/vim-colorschemes' 
"Plugin '' TAGBAR
Plugin 'Yggdroot/indentLine'
    let g:indentLine_char = '┆'  
Plugin 'scrooloose/syntastic'
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_check_on_open=1
    let g:syntastic_loc_list_height=3
Plugin 'tpope/vim-commentary'
Plugin 'lervag/vimtex'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
    noremap <F9> :TagbarToggle<cr>
Plugin 'vim-scripts/numbers.vim'

call vundle#end()
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
nnoremap <leader>en :setlocal spell! spelllang=en<cr>
nnoremap <leader>pt :setlocal spell! spelllang=pt<cr>
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
set completeopt-=preview
set showcmd
set path+=**
set wildmenu
set hidden
set inccommand=split
    hi MatchParen cterm=bold ctermbg=none ctermfg=lightblue
" set list lcs=tab:\┆\  "like indentLine plugin, but for tabs indentation

" if exists('+colorcolumn')
"     " -- Highlight up too 255 columns beyound 'textwidth' -- "
"     let &l:colorcolumn='+' . join(range(0, 254), ',+')
" endif

if has('folding')
    if has('windows')
        set fillchars=vert:│
    endif
    set foldmethod=indent
    set foldlevelstart=99
endif
set virtualedit=block
syntax on



"
" ----- PYTHON VIRTUALENV SUPPORT ----- "
"
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    exec:compile(open(activate_this, 'rb').read(), activate_this, 'exec'),
"                 dict(__file__=activate_this))
"EOF



"
" ----- last cursor position ----- "
"
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


"""""""""""""""""""""""""""""
"      VIM   SCREENCAST     "
"""""""""""""""""""""""""""""

"VimScreencast #65: moving lines vertically
""function! s:Visual()
"    return visualmode() == 'V'
"endfunction
"
"function! wincent#mappings#visual#mode_up() abort range
"    let l:at_top=a:firstline == 1
"    if s:Visual() && !l:at_top
"        '<,'>move '<-2
"        call feedkeys('gv=', 'n')
"    endif
"    call feedkeys('gv', 'n')
"endfunction
"
"function! wincent#mappings#visual#move_down() abort range
"    let l:at_bottom=a:lastline == line('$')
"    if s:Visual && !l:at_bottom
"        '<,'>move '>+1
"        call feddkeys('gv=', 'n')
"    endif
"    call feedkeys('gv', 'n')
"endfunction
"


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
    autocmd WinEnter * hi CursorLineNr ctermfg=yellow

    autocmd WinLeave colorcolumn='+' . join(range(0, 254), ',+')

    autocmd TermOpen * set norelativenumber nonumber
augroup end
