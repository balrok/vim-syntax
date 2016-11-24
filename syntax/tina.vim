
" Vim syntax file
" Language:     GrGen Rewrite Sequence
" Maintainer:   Sebastian Buchwald <Sebastian.Buchwald@kit.edu>
" Last Change:  2011 May 7

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn spell notoplevel

syntax match tinaNetTopic "^net "
syntax match tinaReachTopic "^REACHABILITY ANALYSIS"
syntax match tinaReachGraphTopic "^REACHABILITY GRAPH"
syntax match tinaMarkTopic "^MARKINGS"
syntax match tinaLiveTopic "^LIVENESS ANALYSIS"
syntax match tinaStrongTopic "^STRONG CONNECTED COMPONENTS"
syntax match tinaSCCTopic "^SCC GRAPH"
syntax match tinaAnTopic "^ANALYSIS COMPLETED"

syntax match simpleLeft "^tr .*" contains=node, simpleAssignment
"syntax match node "\([a-zA-Z0-9_]+\)\|\({[^}]+}\)" contained
syntax match node "\( \k\+\)\|\({[^}]*}\)" contained
syntax match simpleAssignment "->" contained nextgroup=simpleRight
syntax match simpleRight ".*" contained

syntax match reachGraphLeft "^[0-9]\+ ->.*" contains=node,jumpMarker
syntax match jumpMarker "\/[0-9]*" contained

hi def link tinaNetTopic Type
hi def link tinaReachTopic Type
hi def link tinaReachGraphTopic Type
hi def link tinaMarkTopic Type
hi def link tinaLiveTopic Type
hi def link tinaStrongTopic Type
hi def link tinaSCCTopic Type
hi def link tinaAnTopic Type


hi def link simpleLeft Float
hi def link simpleAssignment SpecialChar
hi def link simpleRight Function

hi def link reachGraphLeft Float
hi def link jumpMarker SpecialChar
hi def link node String
