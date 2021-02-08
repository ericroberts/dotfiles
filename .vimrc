set nocompatible              " be iMproved, required
set number
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set ruler

"autocmd BufNewFile,BufRead /Users/Eric/code/projects/tint/* set noexpandtab

let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'slim-template/vim-slim.git'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'leafgarland/typescript-vim'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'sheerun/vim-polyglot'
Plugin 'ruanyl/vim-gh-line'
Plugin 'dracula/vim', {'name':'dracula'}
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
silent! colorscheme solarized
filetype plugin indent on    " required
syntax enable
set background=dark
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = '»'
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

let g:airline_theme='solarized'
let g:airline#extensions#ale#enabled = 1
highlight clear SignColumn
nmap <C-P> :GFiles<CR>
nmap <C-T> :GFiles<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

command! -bang -nargs=* GG
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
