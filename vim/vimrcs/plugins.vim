" Load Plugins
call plug#begin('~/.vim/plugins')

" Navigation
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Martin-Nyaga/vim-vinegar'
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
Plug 'justinmk/vim-sneak'
Plug 'editorconfig/editorconfig-vim'

" External tooling integration
Plug 'sbdchd/neoformat'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Language agnostic features
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'liuchengxu/vista.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' } 

" Language-specific features
Plug 'ap/vim-css-color'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'ngmy/vim-rubocop'
Plug 'aliou/sql-heredoc.vim'
Plug 'rust-lang/rust.vim'

" Statusbar
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" Themes
Plug 'fnune/base16-vim'
Plug 'Shatur/neovim-ayu'

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
colorscheme ayu

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" else
"   colorscheme base16-gruvbox-dark-hard
" endif

" Brighter comments & whiter text for base16 themes
" call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
" call Base16hi("Normal", g:base16_gui07, "", g:base16_cterm07, "", "", "")

" Italic comments
highlight Comment cterm=italic gui=italic

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
let g:fzf_layout = { 'down': '40%' }
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
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--info=inline']}), <bang>0)

" => Rustfmt
let g:rustfmt_autosave = 1

" => RubyFmt
if executable("rubyfmt")
  nmap <Leader>ru :!rubyfmt -i %<CR> :e<CR>
end

" => Rubocop
" Disable keymap to avoid clashing with rubyfmt
let g:vimrubocop_keymap = 0

" => Tmux vim navigation
" Make Netrw C-l work
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
function! NetrwMapping()
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
endfunction

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
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

augroup format_on_save
  autocmd BufWritePost *.cpp,*.h :call CocAction('format')
augroup END

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)

" Jump to next error
nmap <leader>en <Plug>(coc-diagnostic-next-error)
nmap <leader>wn <Plug>(coc-diagnostic-next)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"=> Vista
let g:vista_default_executive = 'coc'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" => Lightline
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

" => Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  }
}
EOF

" => Neoformat
nnoremap <Leader>p :Neoformat<CR>
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']

" => Rails
nmap <C-a> :A<cr>
