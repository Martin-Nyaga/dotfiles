" Sethow many lines of history VIM has to remember
set history=10

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable

" Set to auto read when a file is changed from the outside
set autoread

" Change leader key to space
let mapleader = " "

" Map ; to : for quicker pressing
nmap ; :

" Full screen zooming
nmap zi :tab split<cr>
ca tn tabnew<cr>

" Enable yank to system clipboard
set clipboard=unnamedplus

" No need to be compatible with old Vi
set nocompatible

" Enable folding
set foldmethod=indent

" Set 7 lines to the cursor - when moving vertically using j/k
set so=2

" Highlight line under cursor
set cursorline

" Limit text width
set colorcolumn=80
set textwidth=80

" Turn on the Wild menu
set wildmenu

" Ignore files in the wildmenu
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Height of the command bar
set cmdheight=2

" Configure backspace and cursor wrapping
" so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Preview replace commands
if has("nvim")
  set inccommand=nosplit
end

" Don't redraw while executing macros (good performance config)
if !has("nvim")
  set ttyfast
end
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Diffopt
set diffopt+=vertical

" Show line numbers
set number

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set real colors
set termguicolors
if !has('gui_running')
  set t_Co=256
endif

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Relative line numbers
set relativenumber

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Allow mouse support - useful for copy paste
set mouse=a

" Statusline
set laststatus=2

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun
autocmd BufWritePre *.rb,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.haml :call CleanExtraSpaces()

" Fast shortcuts for netrw
map <leader>nn :Explore.<cr>
map <leader>nf :Explore<cr>

" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" <shift-Z> to add newline
nnoremap Z a<CR><ESC>k$

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
  set undodir=~/.vim/temp_dirs/undodir
  set undofile
catch
endtry

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack<space>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>

" Only show tabline if there is more than one tab
set showtabline=1

" Delete/Paste without yanking
vnoremap p "_dP

" Easy shortcuts to open vim settings 
command! Evimrc e $HOME/.vim/vimrcs/main.vim
command! Eplugins e $HOME/.vim/vimrcs/plugins.vim
command! Reload source $MYVIMRC

" Squiggles
command! Esquiggles e ./squiggles.txt
map <leader>sq :Esquiggles<cr>

" Add Python support
" let g:python3_host_prog="$HOME/pythonenv/bin/python"
" let g:python_host_prog="$HOME/pythonenv/bin/python"

" Helper functions
function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
      call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
      call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Add node_modules binaries to vim path
if isdirectory($PWD .'/node_modules')
  let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif

