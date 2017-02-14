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


" TODO only the first "syn include" is used
syn include @JAVA syntax/java.vim
unlet b:current_syntax
syn region  ossCodeJ matchgroup=ossCodeJ2 start=.<Class>. end=.</Class>. contains=@JAVA, ossSlot contained
syn region  ossCodeJM matchgroup=ossCodeJM2 start=.<Method>. end=.</Method>. contains=@JAVA, ossSlot contained
syn region  ossCodeJS matchgroup=ossCodeJS2 start=.<Stmt>. end=.</Stmt>. contains=@JAVA, ossSlot contained

syn match ossSlot "#[A-Z]\+#"

syn include @FORTRAN syntax/fortran.vim
unlet b:current_syntax
syn region  ossCode matchgroup=ossCode2 start=.<code>. end=.</code>. contains=@FORTRAN, ossSlot contained

syn keyword ossRecipeKW recipe nextgroup=ossRecipeId
syn match   ossRecipeId "\H\w*" nextgroup=ossRecipe contained
syn region  ossRecipe matchgroup=ossRecipe2 start=.[^{]\+{. end=.}. contains=ossKey contained

syn keyword ossStyleKW style nextgroup=ossStyleId
syn match   ossStyleId "\H\w*\H\w*" nextgroup=ossStyle contained
syn region  ossStyle matchgroup=ossStyle2 start=.[^{]\+{. end=.}. contains=ossFragmentKW contained

syn keyword ossFragmentKW fragment nextgroup=ossFragmentId contained
syn match   ossFragmentId "\H\w*\s\+" nextgroup=ossFragmentSpecifier contained
syn match   ossFragmentSpecifier "\(\*\|\w*\)" nextgroup=ossFragment contained
syn region  ossFragment matchgroup=ossFragment2 start=.[^{]\+{. end=.}. contains=ossFragCode, ossFragSlot, ossFragOther contained

syn match  ossFragCode    "code\s*:\(\n\|\s\)*" nextgroup=ossCodeJ,ossCodeJM,ossCodeJS,ossCode contained
syn match  ossFragSlot    "\(deferred\s*\)\?slot" nextgroup=ossFragSlotId contained
syn match  ossFragSlotId    "\H\w*\s*:" nextgroup=ossVal contained
syn match  ossFragOther    "\(iterateOver\|name\)\s*:" nextgroup=ossVal contained



syn match  ossKey     "^\([^:]\+\):\s*" nextgroup=ossVal contained
syn region ossVal start="." end="$" contained




hi def link ossRecipeKW Statement
hi def link ossRecipeId Identifier

hi def link ossFragmentKW Statement
hi def link ossFragmentId Identifier
hi def link ossFragmentSpecifier Type

hi def link ossStyleKW Statement
hi def link ossStyleId Identifier


hi def link ossFragOther Statement
hi def link ossFragCode Statement
hi def link ossFragSlot Statement
hi def link ossFragSlotId Identifier

hi def link ossSlot        Number
hi def link ossKey Function
hi def link ossVal Type
"hi def link ossCodeJ Todo
let b:current_syntax = "oss"
