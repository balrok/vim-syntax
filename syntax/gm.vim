" Vim syntax file
" Language:     GrGen Model
" Maintainer:   Sebastian Buchwald <Sebastian.Buchwald@kit.edu>
" Last Change:  2011 May 7

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn spell notoplevel

syn keyword gmKeyWords  abstract class connect const copy
" start,exit is a keyword in .grs - so display it as kw here too
syn keyword gmKeyWords  start exit
syn keyword gmKeyWords  in nodes


" edges can be following:
syn keyword gmKeyWords  directed undirected arbitrary

syn keyword gmKeyWords  edge enum extends node
syn keyword gmKeyWords  type

syn keyword gmKeyWords  package

syn keyword gmValues    string int boolean set
syn region  gmComment   start="/\*" end="\*/" contains=@Spell
syn region  gmComment   start="//" end="$" contains=@Spell


syn match  gmStringMatch /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[,}\]]/ contains=gmString
syn region  gmString oneline matchgroup=gmQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ concealends contains=gmEscape contained
syn match   gmEscape    "\\["\\/bfnrt]" contained
syn match   gmEscape    "\\u\x\{4}" contained

syn match gmBoolean /\(true\|false\)\(\_s\+\ze"\)\@!/

syn match gmSemicolonError /\: *\(string|int|boolean\) *[^;]/

" syn region gmBracesBlock matchgroup=gmBraces start='{' end='}' contains=@gmAttributes

hi def link gmKeyWords  Statement
hi def link gmComment   Comment
hi def link gmValues    Number
hi def link gmQuote 	Quote
hi def link gmBoolean Boolean
hi def link gmSemicolonError Error

let b:current_syntax = "gm"
