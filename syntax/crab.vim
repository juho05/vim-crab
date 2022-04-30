if exists("b:current_syntax")
    finish
endif

syntax keyword crabTodo TODO FIXME NOTE

syntax match crabComment "\v\/\/.*$"
      \ contains=crabTodos,@Spell oneline
syntax region crabComment start="/\*" end="\*/"
      \ contains=crabTodos,@Spell fold

syntax keyword crabBoolean
      \ true
      \ false

syntax keyword crabNull null

syntax keyword crabKeyword
	\ var
	\ if
	\ else
	\ while
	\ for
	\ break
	\ continue
	\ return
	\ try
	\ catch
	\ throw
	\ throws

syntax match crabOperator "\v\+"
syntax match crabOperator "\v-"
syntax match crabOperator "\v\*"
syntax match crabOperator "\v\*\*"
syntax match crabOperator /\/\%(=\|\ze[^/*]\)/
syntax match crabOperator "\v\%"
syntax match crabOperator "\v\|\|"
syntax match crabOperator "\v\&\&"
syntax match crabOperator "\v\^\^"
syntax match crabOperator "\v\="
syntax match crabOperator "\v\<"
syntax match crabOperator "\v\>"
syntax match crabOperator "\v\?"
syntax match crabOperator "\v\!"

syntax match crabNumber "\d\+"
syntax match crabNumber "[-+]\d\+"
syntax match crabNumber "[-+]\?\d\+\.\d*"

syntax region crabString start=/"/ skip=/\\"/ end=/"/ oneline

syntax match crabDeclaration       /\<func\>/ nextgroup=crabFunction skipwhite skipnl
syntax match crabFunction          /\w\+/ contained skipwhite skipnl
syntax match crabFunctionCall /\w\+\ze\%(\[\%(\%(\[]\)\?\w\+\(,\s*\)\?\)\+\]\)\?(/

syntax region crabBody start="{" end="}" fold transparent

highlight default link crabTodo Todo
highlight default link crabComment Comment
highlight default link crabBoolean Boolean
highlight default link crabNumber Number
highlight default link crabString String
highlight default link crabOperator Operator
highlight default link crabKeyword Keyword
highlight default link crabNull Type
highlight default link crabDeclaration Keyword
highlight default link crabFunction Function
highlight default link crabFunctionCall Type

let b:current_syntax = "crab"
