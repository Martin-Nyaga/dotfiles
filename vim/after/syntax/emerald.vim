" Vim syntax file
" Language: Emerald
" Maintainer: Martin Nyaga

if exists("b:current_syntax")
  finish
endif

" Comments and TODOs
syn keyword emTodo contained TODO FIXME XXX NOTE
syn match emComment "#.*$" contains=emTodo
syn keyword emKeyword def fn def defn do end true false nil if unless else when deftype defmodule
syn match emNumber '\<[-+]\?\d\+\>'
syn match emConstant '\<[A-Z]\+[a-zA-Z_0-9::]*\>'
syn match emSymbol '\<:[a-z]\+[a-zA-Z_0-9]*\>'

syn region emString start='"' skip='\\"' end='"'
syn region emBlock start="do" end="end" fold transparent
syn region emParenthesized start="(" end=")" fold transparent
syn region emArray start="\[" end="\]" fold transparent

hi def link emTodo        Todo
hi def link emComment     Comment
hi def link emKeyword     Keyword
hi def link emNumber      Number
hi def link emString      String
hi def link emConstant    Identifier
hi def link emSymbol      Constant

let b:current_syntax = "emerald"

