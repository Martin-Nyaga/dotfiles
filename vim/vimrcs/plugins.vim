" Load Plugins
call plug#begin('~/.vim/plugins')

Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'tpope/vim-endwise'
Plug 'tmsvg/pear-tree'
Plug 'airblade/vim-rooter'
Plug 'rust-lang/rust.vim'
Plug 'Martin-Nyaga/vim-rubocop'
Plug 'aliou/sql-heredoc.vim'
Plug 'tpope/vim-rails'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-expand-region'
Plug 'michaeljsmith/vim-indent-object'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'leafgarland/typescript-vim'
Plug 'effkay/argonaut.vim'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'connorholyday/vim-snazzy'
Plug 'chriskempson/tomorrow-theme', {'rtp': '/vim'}
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'kaicataldo/material.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'liuchengxu/vista.vim'

call plug#end()

" => Colorscheme 
set background=dark
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme material 
" Transparent background to blend into terminal
hi! Normal ctermbg=NONE guibg=NONE

" => FZF
" Add fzf to vim path
map <C-F> :GFiles<cr>
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

" => Vim Pencil for latex  & notes
" let g:pencil#wrapModeDefault = 'soft'
" let g:pencil#conceallevel = 0
" autocmd BufRead,BufNewfile *.tex call pencil#init()

" => Rustfmt
let g:rustfmt_autosave = 1

" => RuboCop
let g:vimrubocop_keymap = 0
nmap <Leader>ru :RuboCop<CR>
nmap <Leader>rf :RuboCop -a -s<CR>

" => Prettier: disable format on save which is too slow
let g:prettier#autoformat = 0
nnoremap <Leader>p :Prettier<CR>

" => JS File import
let g:js_file_import_sort_after_insert = 1

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
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
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

