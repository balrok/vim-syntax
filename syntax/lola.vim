syntax match comma ","
syn keyword lolaKeyWords EF AG AX EX AF FIRABLE
syn keyword lolaOpKeywords AND OR NOT
syntax match  lolaOperator "[#<>=~^&|*/%+-]\|\.\."
syntax match  lolaBrackets "[()]"

syn region  lolaComment   start="/\*" end="\*/" contains=@Spell

syn match gmBoolean /\<\(yes\|no\|true\|false\)\>\(\_s\+\ze"\)\@!/

syn region markingDef matchgroup=markingDef2 start="^MARKING" end=";" contains=node, tokens
syn region placeDef matchgroup=placeDef2 start="^PLACE" end=";" contains=node
syn match transitionDef "^TRANSITION " nextgroup=node
syn region consumeDef matchgroup=consumeDef2 start="^\s*CONSUME" end=";" contains=node, tokens
syn region produceDef matchgroup=produceDef2 start="^\s*PRODUCE" end=";" contains=node, tokens
syntax match node "[-a-z0-9_$A-Z.]\+" contained
syntax match tokens "\d\+" contained

" Decimal constant
syntax match lolaNumber "\<\d\+\>"

syn match lolaprefix "^lola:"
syntax match lolaResult "^lola: result: "



hi def link lolaResult Statement
hi def link gmBoolean Boolean
hi def link lolaNumber Number
hi def link comma SpecialChar
hi def link lolaprefix Comment
hi def link tokens Number
hi def link node String
hi def link markingDef Statement
hi def link markingDef2 Statement
hi def link placeDef Statement
hi def link placeDef2 Statement
hi def link transitionDef Statement
hi def link consumeDef Statement
hi def link consumeDef2 Statement
hi def link produceDef Statement
hi def link produceDef2 Statement
hi def link lolaKeyWords Function
hi def link lolaOperator Operator
hi def link lolaOpKeywords Operator
hi def link lolaBrackets Delimiter
hi def link lolaComment Comment
