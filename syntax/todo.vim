"     What: todo.vim
" Language: TODO
"   Author: Magnus Woldrich <m@japh.se>
"     Date: 2019-03-19 14:34:13

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
syn match  todoremember    /REMEMBER/
syn match  tododate        /\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\)\s\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\{2}/
syn match  todotime        /\d\{2}:\d\{2}:\d\{2} .\{3,} \d\{4}/
syn region done            start=/\*\*DONE/ end=/\*\*/
syn region inprogress      start=/\*\*INPROGRESS/ end=/\*\*/
syn region matttodo        start=/\*\*TODO/ end=/\*\*/
syn region majorpoint      start=/==>/ end=/<==/me=s-3 contains=ALL
syn region comment         start=/\v#|\>/ end=/\n/
syn match  minorpoint      /--/
syn match  minipoint       /---/
syn match  todobullet      /·/
syntax match todoURL       /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/
syn region todomodified    start=/Modified:/ end=/$/


" dim finished tasks
" %3>l  = match after 3rd line
syn match todoLevel1 /\v\s*·?\s*\zs.*\zeDONE/ contains=tododone
hi todoLevel1 ctermfg=240 cterm=italicbold

syn match todoLevel2 /%3>l.*\zeNOTE/ contains=todonote
hi todoLevel2  cterm=bold


sy region dash1 matchgroup=dash1 start=/\---/ end=/\v\n/ contains=dash2 keepend
sy region dash2 matchgroup=dash2 start=/\---/ end=/\v\n/ contains=dash3 keepend
sy region dash3 matchgroup=dash3 start=/\---/ end=/\v\n/ contains=dash1 contained keepend
hi dash1 ctermfg=240
hi dash2 ctermfg=244
hi dash3 ctermfg=248

hi todoremember ctermfg=197 ctermbg=53 cterm=boldunderlinereverse


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
    hi default tMajor ctermfg=197 cterm=bold

  hi link todonote tTodonote
    hi default tTodonote ctermfg=197 cterm=bold

  hi link minorpoint tMinor
   hi default tMinor ctermfg=29 cterm=bold

  hi link minipoint tMini
    hi default tMini ctermfg=154 cterm=bold

  hi link tododate tDate
  hi link todomodified tDate
  hi default tDate ctermfg=245 ctermbg=233 cterm=bold

  hi link todotime tTime
  hi link todomodified tTime
  hi default tTime ctermfg=238 cterm=bold

  hi Normal ctermfg=255

  hi todoURL ctermfg=39

  hi todobullet ctermfg=160 cterm=bold
endif

let b:current_syntax="todo"
