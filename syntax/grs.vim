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



" TODO Random Hierarchic Organic Orthogonal Circular Tree Diagonal Incremental Hierarchic Compilergraph
" debug set layout
syn keyword grgKeyWords "debug set layout" nextgroup=grgLayoutType
syn keyword grgLayoutType Random Hierarchic Organic Orthogonal Circular Tree Diagonal Incremental Hierarchic Compilergraph

syn keyword gmKeyWords  new graph quit
syn keyword gmKeyWords  start exit exec include validate
syn keyword gmKeyWords  dump xgrs echo
syn keyword gmKeyWords  debug show
syn keyword gmOptions   add set layout option textcolor color labels
syn keyword gmOptions   group by hidden incoming outgoing exclude
syn keyword gmOptions   infotag shortinfotag
syn keyword gmValues    true false enable disable
syn keyword gmvalues    on off
syn keyword gmNode node
syn keyword gmEdge edge

syn region  shapeRegion start=" shape " end="$" oneline contains=shape
syn keyword shape box triangle circle ellipse rhomb hexagon trapeze
syn keyword shape uptrapeze lparallelogram rparallelogram

syn keyword gmValues    continuous dotted dashed invisible
" syn region  gmComment   start="/\*" end="\*/" contains=@Spell
" syn region  gmComment   start="//" end="$" contains=@Spell
syn region  gmComment   start="#" end="$" contains=@Spell
syn region  gmString    start="\"" end="\"" contains=@Spell

syn region  colorRegion start=" color " end="$" oneline contains=colors

hi def link gmKeyWords  Statement
hi def link gmComment   Comment
hi def link gmString    String
hi def link gmOptions   Label
hi def link colorRegion Label
hi def link shapeRegion Label
hi def link gmValues    Number
hi def link grgLayoutType Number

hi def link gmNode Number
hi def link gmEdge Number

hi def link shape Number

let b:current_syntax = "grs"

try
	call css_color#init('css', 'extended', 'colorRegion')
catch
	" colors from http://pp.info.uni-karlsruhe.de/git/yComp/plain/src/de/unika/ipd/ycomp/VCG/VCGColor.java
	syn keyword colors white blue red green yellow magenta cyan gold 
	syn keyword colors lilac turquoise aquamarine khaki purple yellowgreen pink orange orchid black transparent
	syn keyword colors darkgrey darkblue darkred darkgreen darkyellow darkmagenta darkcyan
	syn keyword colors lightgrey lightblue lightred lightgreen lightyellow lightmagenta lightcyan
	hi def link colors Number
endtry
