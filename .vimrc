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
Plugin 'Valloric/YouCompleteMe'
    " --- instalar o clang e recompilar  --- "
    "  sudo apt-get install clang
    "  cd ~/.vim/bundle/YouCompleteMe
    "  python3 install.py --all
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_python_binary_path='/usr/bin/python3'
    map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<cr>
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
"Plugin 'scrooloose/syntastic'
    " MAGNUN LENO CONFIGs "
    " let g:syntastic_error_symbol='✗'
    " let g:syntastic_warning_symbol='⚠'
    " let g:syntastic_check_on_open=1
    " let g:syntastic_loc_list_height=3

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""
" --------------------------------------- " 
"""""""""""""""""""""""""""""""""""""""""""
colorscheme monokai-phoenix

" -------- MAPS ---------"
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap " ""<left>
inoremap ' ''<left>
nnoremap <space> za  " folding 
map <c-n> :NERDTreeToggle<cr>
map <c-j> ddp
map <c-k> ddkP
vmap <c-k> dkP
map <M-down> <esc>:resize +2<cr>
map <M-up> <esc>:resize -2<cr>
map <M-left> <c-w><
map <M-right> <c-w>>
map <c-right> <c-w>l
map <c-left> <c-w>h
map <c-down> <c-w>j
map <c-up> <c-w>k
nnoremap <leader>en :setlocal spell! spelllang=en<cr>
nnoremap <leader>pt :setlocal spell! spelllang=pt<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <leader>v Yp$
nnoremap <leader>s :let @/ = ""<cr>
nnoremap <leader>b i<cr>
nnoremap <leader>a <esc>mmggVGy'm :echo "Copiado"<cr>
nnoremap <leader>sop :source % <cr>


" ------- SETS ------ "
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
set magic
set autoindent
set tabstop=4
set expandtab
set ruler
set shiftwidth=4
setlocal showmode
set showmatch
set encoding=utf-8
set cursorline
set textwidth=79
" set updatecount=100  " swap file after 100 chars "
" set updatetime=10000  " swap file after 10 inactive secs "
set noswapfile
set undolevels=1000
set autoread
set history=200
set scrolloff=4
set backspace=indent,eol,start
set colorcolumn=+1
set completeopt-=preview
set showcmd
set path+=**
set wildmenu
" set list lcs=tab:\┆\  "like indentLine plugin, but for tabs indentation

syntax on



"
" ----- PYTHON VIRTUALENV SUPPORT ----- "
"
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    exec(compile(open(activate_this, 'rb').read(), activate_this, 'exec'),
                 dict(__file__=activate_this))
EOF



"
" ----- last cursor position ----- "
"
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
