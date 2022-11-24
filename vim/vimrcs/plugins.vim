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
Plug 'samoshkin/vim-mergetool'
Plug 'AndrewRadev/diffurcate.vim'

" Language agnostic features
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'

Plug 'liuchengxu/vista.vim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } 

" Language-specific features
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'ngmy/vim-rubocop'
Plug 'aliou/sql-heredoc.vim'
Plug 'rust-lang/rust.vim'
Plug 'jlcrochet/vim-rbs'

" Statusbar
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
call plug#end()

" Themes
Plug 'fnune/base16-vim'
Plug 'Shatur/neovim-ayu'
Plug 'rcarriga/nvim-notify'

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

"=> Vista
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
highlight link TSError Normal
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "make", "ruby", "javascript", "typescript", "tsx", "css", "python", "rust", "json", "jsdoc", "html", "vim" },
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

" => Mergetool
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)
