" Load Plugins
call plug#begin('~/.vim/plugins')

Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'xolox/vim-misc'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/loremipsum'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'ap/vim-css-color'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'adelarsq/vim-matchit'
Plug 'ecomba/vim-ruby-refactoring'

call plug#end()

" => Nerd Tree
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['.DS_Store']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeDirArrowExpandable = ""
let g:NERDTreeDirArrowCollapsible = ""
let NERDTreeMinimalUI=1

" => surround.vim config
" Annotate strings with gettext
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" => Colorscheme 
set background=dark
let g:dracula_italic = 0
colorscheme dracula

" => FZF
" Add fzf to vim path
set rtp+=/usr/local/opt/fzf
map <C-F> :Files<cr>
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

" => Goyo 
nnoremap <Leader>z :Goyo<CR>

" => Vim Pencil for latex  & notes
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
autocmd BufRead,BufNewfile *.tex call pencil#init()

" => Prettier
let g:prettier#autoformat = 0
nnoremap <Leader>p :PrettierAsync<CR>
