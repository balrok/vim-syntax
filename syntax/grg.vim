" Vim syntax file
" Language:     GrGen Rule Set
" Maintainer:   Sebastian Buchwald <Sebastian.Buchwald@kit.edu>
" Last Change:  2011 May 7

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn spell notoplevel

syn keyword grgKeyWords            alternative delete dpo exact false hom
syn keyword grgKeyWords            induced iterated modify multiple negative prio independent
syn keyword grgKeyWords            replace return true typeof def var
syn keyword grgKeyWords            count package function procedure continue
syn keyword grgKeyWords            int node
syn keyword grgKeyWords            pattern rule test nextgroup=grgRulePrefix
"original did not work: syn keyword grgKeyWords            exec using nextgroup=grgIgnoreStatement
syn keyword grgKeyWords            using nextgroup=grgString
syn keyword grgFunction 		   exec emit eval
syn keyword grgTodo 			   contained TODO FIXME XXX TBD

"syntax region grgParen   transparent matchgroup=grgParens   start='(' end=')'
"syntax match grgError ")"

syn match   grgVariable            "\h\w*"
syn match   grgVariable            "\h\w*" contained

"syn match   grgIf 				   "if"
"syn match   grgLoop 			   "for"
syntax match  grgOperator "[#<>=~^&|*/%+-]\|\.\."

syn match   grgPreProc             "^#include"
syn match   grgPreProc             "^#use"
syn match   grgTypePrefix          "(:([a-z_0-9]+::)*)" nextgroup=grgTypeDecl,grgReturnTypes,grgPatternInstance,grgKeyWords skipwhite skipnl
syn match   grgTypeDecl            "\h\w*\(\\\(\h\w*\|(\(,\=\h\w*\)*)\)\)\=" contained contains=grgType skipwhite skipnl
syn match   grgType                ":\(\h\w*::\)\?\h\w*"
syn region  grgEdgeType 		   start='-' end='->' oneline contains=grgType, grgVariable
syn region  grgEdgeType 		   start='<-' end='-' oneline contains=grgType, grgVariable
syn match   grgPatternInstance     "\h\w*(" contains=grgRule contained skipwhite skipnl
syn match   grgReturnTypes         "(\(,\=\h\w*\)*)" contains=grgType contained skipwhite skipnl

syn region  grgComment             start="/\*" end="\*/" contains=@Spell, grgTodo
syn region  grgComment             start="//" end="$" contains=@Spell, grgTodo
syn match   grgString              "\"\([^\\"]\|\\\\\|\\\"\|\\n\|\\t\)*\"" contains=grgSpecialChar,@Spell
syn match   grgSpecialChar         "\\\"\|\\\\\|\\n\|\\t"
syn match   grgRulePrefix          "" nextgroup=grgRule contained skipwhite skipnl
syn match   grgRule                "\h\w*" nextgroup=grgRulePostfix contained
syn match   grgRulePostfix         "(\(\n\|[^{]\)*" contains=grgVariable,grgType,grgTypePrefix,grgOriginalType,grgKeyWords,grgComment contained
syn match   grgOriginalType        "<\h\w*>" contains=grgType contained skipwhite skipnl
syn match   grgAlternativePattern  "\h\w*{" contains=grgAlternative skipwhite skipnl
syn match   grgAlternative         "\h\w*" contained
syn match   grgAttributePattern    "\.\h\w*"
syn match   grgEnumPattern         "\h\w*::" contains=grgEnum skipwhite skipnl
syn match   grgEnum                "\h\w*" contained
syn match   grgIgnoreStatement     "\(\n\|[^;]\)*;" contains=grgDelimiter contained
syn match   grgDelimiter           ";"
syn match   grgFunCall  		   /\k\+\%(\s*[{('"]\)\@=/

" Decimal constant
syntax match grgNumber "\<\d\+\>"
" Hex constant
syntax match grgNumber "\<0[xX][[:xdigit:].]\+\%([pP][-+]\=\d\+\)\=\>"
" Floating point constant, with dot, optional exponent
syntax match grgFloat  "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, starting with a dot, optional exponent
syntax match grgFloat  "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
" Floating point constant, without dot, with exponent
syntax match grgFloat  "\<\d\+[eE][-+]\=\d\+\>"

hi def link grgKeyWords    Statement
hi def link execs Statement
hi def link grgComment     Comment
hi def link grgPreProc     PreProc
hi def link grgString      String
hi def link grgSpecialChar SpecialChar
hi def link grgVariable    Identifier
hi def link grgType        Type
hi def link grgEdgeType    Type
hi def link grgEnum        Type
"hi def link grgIf 		   Conditional
"hi def link grgLoop 	   Repeat
hi def link grgOperator    Operator

hi def link grgFunction    Function
hi def link grgRule        Function
hi def link grgAlternative Function
hi def link grgFunCall     Function
hi def link grgDelimiter   Delimiter
hi def link grgFloat 	   Float
hi def link grgNumber 	   Number

"hi def link grgParens           Noise
"hi def link grgError            Error

let b:current_syntax = "grg"
