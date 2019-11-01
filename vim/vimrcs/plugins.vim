" Load Plugins
call plug#begin('~/.vim/plugins')

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'Martin-Nyaga/vim-vinegar'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-repeat'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'adelarsq/vim-matchit'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-endwise'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --rust-completer' }
Plug 'airblade/vim-rooter'
Plug 'rust-lang/rust.vim'
Plug 'Martin-Nyaga/vim-rubocop'
Plug 'aliou/sql-heredoc.vim'
Plug 'tpope/vim-rails'
Plug 'mhinz/vim-startify'

call plug#end()

" => Colorscheme 
set background=dark
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

" => FZF
" Add fzf to vim path
set rtp+=/usr/local/opt/fzf
map <C-F> :GFiles<cr>
map <C-A> :Buffers<cr>
" Use same colorscheme as vim
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" => Vim Pencil for latex  & notes
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
autocmd BufRead,BufNewfile *.tex call pencil#init()

" => Prettier
let g:prettier#autoformat = 0
nnoremap <Leader>p :PrettierAsync<CR>

" => Rustfmt
let g:rustfmt_autosave = 1

" => RuboCop
let g:vimrubocop_keymap = 0
nmap <Leader>ru :RuboCop<CR>
nmap <Leader>rf :RuboCop -a -s<CR>
