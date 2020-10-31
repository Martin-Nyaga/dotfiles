" Load Plugins
call plug#begin('~/.vim/plugins')

" Navigation
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Martin-Nyaga/vim-vinegar'
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'

" Editing
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'adelarsq/vim-matchit'
Plug 'tmsvg/pear-tree'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'

" External tooling integration
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Language agnostic features
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'liuchengxu/vista.vim'

" Language-specific features
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ap/vim-css-color'
Plug 'elixir-editors/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rails'
Plug 'aliou/sql-heredoc.vim'

" Themes
Plug 'chriskempson/tomorrow-theme', {'rtp': '/vim'}
Plug 'kaicataldo/material.vim'

call plug#end()

" => Ack.vim 
" Try use rg or ag instead of ack for searching
if executable('rg')
	let g:ackprg='rg --vimgrep'
elseif executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" => Colorscheme 
set background=dark
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material 
" Transparent background to blend into terminal 
hi! Normal ctermbg=NONE guibg=NONE

" => Pear tree
" Balance brackets
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1
let g:pear_tree_timeout = 15

" => FZF
map <C-F> :Files<cr>
map <C-B> :Buffers<cr>
let g:fzf_preview_window = 'right:50%'
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

" => Rustfmt
let g:rustfmt_autosave = 1

" => RubyFmt
if executable("rubyfmt")
  nmap <Leader>ru :!rubyfmt -i %<CR> :e<CR>
end

" => Tmux vim navigation
" Make Netrw C-l work
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
endfunction

" => Prettier: disable format on save which is too slow
let g:prettier#autoformat = 0
nnoremap <Leader>p :Prettier<CR>

" => Vim Javascript - better js folding
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" => COC.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Jump to next error
nmap <leader>en <Plug>(coc-diagnostic-next-error)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" => Vista
" to show position in a file
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = 1
let g:vista_fzf_preview = ['right:30%']
let g:vista_icon_indent = ["▸", ""]
let g:vista#renderer#enable_icon = 1
nmap <Leader>b :Vista<CR>
nmap <Leader>t :Vista finder<CR>
