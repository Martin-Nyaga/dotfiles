if exists('g:vscode')
  "Do not execute rest of init.vim, do not apply any configs
  finish
endif

" Load Plugins
call plug#begin('~/.vim/plugins')

" Navigation
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Martin-Nyaga/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'akinsho/bufferline.nvim'

" Editing'
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
Plug 'kshenoy/vim-signature'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

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
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'ap/vim-css-color'
Plug 'weilbith/nvim-lsp-smag'

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
Plug 'davidmh/mdx.nvim'

" Statusbar
Plug 'nvim-lualine/lualine.nvim'

" Themes
Plug 'RRethy/nvim-base16'
Plug 'Shatur/neovim-ayu'
Plug 'rcarriga/nvim-notify'

" Copilot
" Plug 'github/copilot.vim'

" Prose writing
Plug 'marcelofern/vale.nvim'

call plug#end()


" Copilot
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

" => Ack.vim 
" Try use rg or ag instead of ack for searching
if executable('rg')
	let g:ackprg='rg --vimgrep'
elseif executable('ag')
	let g:ackprg='ag --vimgrep'
endif

" => Colorscheme 
" colorscheme ayu
if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
" else
"   set background=dark
"   colorscheme ayu
endif

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
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
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
let g:vista_default_executive = 'nvim_lsp'

" => Lualine
lua << END
require('lualine').setup{
  options = {
    theme = "codedark",
    component_separators = { left = ' ', right = ' '},
    section_separators = { left = ' ', right = ' '},
  }
}
END

" => Bufferline
lua << EOF
require("bufferline").setup{
  options = {
    mode = "tabs",
    diagnostics = "nvim_lsp",
    buffer_close_icon = 'x',
    always_show_bufferline = false
  }
}
EOF

" => Treesitter
" highlight link TSError Normal
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "make", "ruby", "javascript", "typescript", "tsx", "css", "python", "rust", "json", "jsdoc", "html", "vim" },
  auto_install = true,
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
let g:neoformat_enabled_cpp = ['clangformat']

augroup fmt
  autocmd!
  autocmd BufWritePre *.go,*.rs Neoformat
augroup END

" => Rails
nmap <C-a> :A<cr>

" => Mergetool
let g:mergetool_layout = 'mr'
let g:mergetool_prefer_revision = 'local'
nmap <leader>mt <plug>(MergetoolToggle)

" => Trouble
lua << EOF
  require("trouble").setup {
    signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
  }
EOF
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>td <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>tq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>tl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" => gitgutter
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_added = '▕'
let g:gitgutter_sign_modified = '▕'
let g:gitgutter_sign_removed ='▕'
let g:gitgutter_sign_removed_first_line = '▕' 
let g:gitgutter_sign_removed_above_and_below = '▕' 
let g:gitgutter_sign_modified_removed = '▕'

" => Vale
lua <<EOF
  require("vale").setup({
    -- path to the vale binary.
    bin="~/.local/bin/vale",
    -- path to your vale-specific configuration.
    vale_config_path=vim.fn.getcwd() .. "/.vale.ini",
  })
EOF
