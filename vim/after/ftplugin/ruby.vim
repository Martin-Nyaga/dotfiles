function! g:AddFrozenStringLiteral()
  execute "normal! ggO# frozen_string_literal: true\<esc>"
endfunction

map <Leader>rf :cal AddFrozenStringLiteral()<cr>
