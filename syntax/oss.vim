" Vim syntax file
" Language:     Orchestration Style Sheets
" Maintainer:   Carl Mai
" Last Change:  2017 Feb 14

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn spell notoplevel

syn keyword ossKeywords  recipe style slot code fragment
syn match ossSlot  "#[A-Z]\+#"



hi def link ossKeywords    Statement
hi def link ossSlot        Number
let b:current_syntax = "oss"
