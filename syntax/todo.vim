" Vim syntax file
" Language: TODO
" Author:   Magnus Woldrich <trapd00r@trapd00r.se>

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn match  tododone        /DONE/
syn match  todoinprogress  /INPROGRESS/
syn match  todotodo        /TODO/
syn match  todosomewhat    /SOMEWHAT/
syn match  todonote        /NOTE/
syn match  tododate        /\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\)\s\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\{2} \d\{2}:\d\{2}:\d\{2} CEST \d\{4}/
syn region done            start=/\*\*DONE/ end=/\*\*/
syn region inprogress      start=/\*\*INPROGRESS/ end=/\*\*/
syn region matttodo        start=/\*\*TODO/ end=/\*\*/
syn region majorpoint      start=/==>/ end=/-->/me=s-3 contains=ALL
syn region comment         start=/#/ end=/\n/
syn match  minorpoint      /'-->/
syn match  minipoint       /'--->/
syn region todomodified    start=/Modified:/ end=/$/

if !exists("did_todo_syntax_inits")
  let did_todo_syntax_inits = 1

  hi link tododone tDone
    hi link done tDone
    hi default tDone ctermfg=34 cterm=bold

  hi link todosomewhat tSomewhat
    hi link somewhat tSomewhat
    hi default tSomewhat ctermfg=208

  hi link todoinprogress tProgress
    hi link inprogress tProgress
    hi default tProgress ctermfg=226

  hi link todotodo tTodo
    hi link matttodo tTodo
    hi default tTodo ctermfg=160 ctermbg=233 cterm=bold

  hi link majorpoint tMajor
    hi default tMajor ctermfg=196

  hi link todonote tTodonote
    hi default tTodonote ctermfg=196

  hi link minorpoint tMinor
   hi default tMinor ctermfg=29 cterm=bold

  hi link minipoint tMini
    hi default tMini ctermfg=154 cterm=bold

  hi link tododate tdate
  hi link todomodified tdate
  hi default tdate ctermfg=244 cterm=bold
endif

let b:current_syntax="todo"
