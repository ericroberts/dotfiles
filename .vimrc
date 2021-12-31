set termguicolors
set nocompatible
set number
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set ruler
set background=dark

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'editorconfig/editorconfig-vim'
Plug 'gantoreno/vim-substrata'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-airline/vim-airline'
Plug 'luizribeiro/vim-cooklang', { 'for': 'cook' }

call plug#end()

syntax on

silent! colorscheme substrata

filetype plugin indent on
syntax enable

nmap <C-P> :GFiles<CR>
nmap <C-T> :GFiles<CR>

let g:airline_theme='substrata'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline#extensions#tabline#left_sep=''
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#right_sep=''
let g:airline#extensions#tabline#right_alt_sep=''
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0

augroup substrata_settings
  autocmd!
  autocmd BufEnter * 
        \ if exists('g:colors_name') && g:colors_name == 'substrata'
        \ | hi link TelescopeBorder        comment 
        \ | hi link TelescopePromptBorder  comment 
        \ | hi link TelescopeResultsBorder comment 
        \ | hi link TelescopePreviewBorder comment
        \ | hi link CocExplorerIndentLine  comment |
        \ endif
augroup end
