" Sethow many lines of history VIM has to remember
set history=10

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Change leader key to space
let mapleader = " "

" Map ; to : for quicker pressing
nmap ; :

" Fast saving
nmap <leader>w :w!<cr>

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

" Change cursor per mode 
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" 

" Highlight line under cursor
set cursorline

" Limit text width to 78 chars
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
set ttyfast
set lazyredraw

" How long before updating
set updatetime=300

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Diffopt
set diffopt+=vertical

" Show line numbers
set number

" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set real colors
if (has("termguicolors"))
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
  set termguicolors
endif

" Turn backup off, since most stuff is in git anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Relative line numbers
set relativenumber

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Allow mouse support - useful for copy paste
set mouse=a

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Delete trailing white space on save
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

" Trim whitespace
autocmd BufWritePre *.rb,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.haml :call CleanExtraSpaces()

" Fast shortcuts for netrw
map <leader>nn :Explore.<cr>
map <leader>nf :Explore<cr>

" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
try
  set undodir=~/.vim/temp_dirs/undodir
  set undofile
catch
endtry

" Ack searching and cope displaying - Use ripgrep as vimgrep
if executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack<space>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
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
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

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

" Terminal exit
" tnoremap <Esc> <C-\><C-N>

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

" JSON comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" Python support
let g:python3_host_prog="$HOME/pythonenv/bin/python"
let g:python_host_prog="$HOME/pythonenv/bin/python"
