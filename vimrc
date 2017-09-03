" dmontanari vimrc file
" based on several others from Internet
" 

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==== PLUGINS ====
Plugin 'VundleVim/Vundle.vim'           " Vim Bundle - install helper
Plugin 'vim-scripts/L9'                 " extra commands for vim
Plugin 'tpope/vim-fugitive'             " Git Wrapper
Plugin 'scrooloose/nerdtree'            " NERDTree

" autocomplete
Plugin 'Valloric/YouCompleteMe'         " 
Plugin 'davidhalter/jedi-vim'

Plugin 'airblade/vim-gitgutter'         " Show git differences

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"
Plugin 'joe-skb7/cscope-maps'

" ==== PLUGIN THEMES ====
Plugin 'vim-scripts/darktango.vim'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'morhetz/gruvbox'
" ==== END PLUGIN THEMES ====

" ==== PLUGIN SYNTAXES ====
Plugin 'hdima/python-syntax'

" =================================================
" Powerline
"      Install for last
Plugin 'Lokaltog/powerline'

" ================================================
" Airline - another look powerline
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'



" === END PLUGIN SYNTAXES ====

" ==== END PLUGINS ====

call vundle#end()

" ==== Powerline ====
let g:Powerline_symbols = 'fancy'
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" ====== airline ======
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" ==== BASIC ====
colorscheme gruvbox
set guifont=Monospace\ 10
set fillchars+=vert:\$
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
set st=4 sw=4 et

" ==== OmniComplete ====
"
" Enable OmniCompletion
" " http://vim.wikia.com/wiki/Omni_completion
"execute pathogen#infect()
syntax on
filetype plugin indent on

"filetype plugin on
"set omnifunc=syntaxcomplete#Complete


" ==== NERDTREE ====
let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.so$', '\.a$', '[a-zA-Z]*egg[a-zA-Z]*', '[a-zA-Z]*cache[a-zA-Z]*']
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
map <C-t> :NERDTreeToggle<CR>

" === UltiSnips ===
" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>


set clipboard+=unnamed,unnamedplus,autoselect  " Share clipboard with system

"        ===== Kernel Development ========
"
" If we are in a kernel development directory
" set a few parameters to match kernel coding style
let g:dir=split(getcwd(), '/')
let g:curdir=dir[len(dir)-1]

:if curdir =~ "linux"
    set colorcolumn=81
    highlight ColorColumn ctermbg=Black ctermfg=DarkRed
    set tabstop=8
    set shiftwidth=8
    set noexpandtab
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
    let &colorcolumn="80"
:endif


