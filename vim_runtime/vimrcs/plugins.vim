" Load Vundle
set rtp+=$HOME/.vim_runtime/plugins/Vundle.vim
call vundle#begin('~/.vim_runtime/plugins')

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/goyo.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-commentary'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-repeat'
Plugin 'Shougo/deoplete.nvim'
Plugin 'vim-scripts/loremipsum'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier'
Plugin 'ap/vim-css-color'
Plugin 'ayu-theme/ayu-vim'
Plugin 'sstallion/vim-wtf'
Plugin 'dracula/vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'airblade/vim-gitgutter'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'

call vundle#end()

" " => Nerd Tree
" let g:NERDTreeWinPos = "left"
" let NERDTreeShowHidden=0
" let NERDTreeIgnore = ['.DS_Store']
" let g:NERDTreeWinSize=35
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark<Space>
" map <leader>nf :NERDTreeFind<cr>
" let g:NERDTreeDirArrowExpandable = ""
" let g:NERDTreeDirArrowCollapsible = ""
" let NERDTreeMinimalUI=1

" => surround.vim config
" Annotate strings with gettext
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

" => Colorscheme 
set background=dark
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


" => Vim Notes
let g:notes_directories = ['~/Personal Drive/Notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'rename_file'

" => Goyo 
nnoremap <Leader>z :Goyo<CR>

" => Vim Pencil for latex  & notes
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#conceallevel = 0
autocmd BufRead,BufNewfile *.tex call pencil#init()

" => Deoplete Vim 
let g:deoplete#enable_at_startup = 1
" Use <TAB> for completion with deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" => Prettier
let g:prettier#autoformat = 0
nnoremap <Leader>p :PrettierAsync<CR>

" => Rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
