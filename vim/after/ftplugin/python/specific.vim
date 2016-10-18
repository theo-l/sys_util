"python abbrev definitions
function! PythonAbbrevs()

    iabbrev <buffer> imain if __name__ == "__main__":<Esc>a<C-J>
    abbrev <buffer> istr def __str__(self):<C-J>
    iabbrev <buffer> iutf8 #-*- encoding:utf8 -*-
   iabbrev <buffer> iso8859 #-*- encoding:iso-8859-1 -*-<C-J>

    iabbrev <buffer> idoc <Esc>50i#<Esc>o#<C-J><Esc>50i#<Esc>kA

endfunction 

"python specific mapping configurations
function! PythonMappings()

"    nmap <buffer> <leader>py :!python

    "auto match bracks
    inoremap <buffer> ( ()<Esc>i
    inoremap <buffer> [ []<Esc>i
    inoremap <buffer> { {}<Esc>i
"    almost  dont use <> in python source code
"    inoremap <buffer> < <><Esc>i
    inoremap <buffer> ) <c-r>=ClosePair(')')<C-J>
    inoremap <buffer> ] <c-r>=ClosePair(']')<C-J>
    inoremap <buffer> > <c-r>=ClosePair('>')<C-J>
    inoremap <buffer> } <c-r>=ClosePair('}')<C-J>
    inoremap <buffer> " <c-r>=QuoteDelim('"')<C-J>
    inoremap <buffer> ' <c-r>=QuoteDelim("'")<C-J>

"    operater sybmol map all these maps will make vim slow
"    inoremap <buffer> = <Space>=<Space>
"    inoremap <buffer> + <Space>+<Space>
"    inoremap <buffer> - <Space>-<Space>
"    inoremap <buffer> / <Space>/<Space>
"    inoremap <buffer> % <Space>%<Space>
"    inoremap <buffer> ** <Space>**<Space>
"    inoremap <buffer> >= <Space>>=<Space>
"    inoremap <buffer> == <Space>==<Space>
"    inoremap <buffer> <= <Space><=<Space>
"    inoremap <buffer> != <Space>!=<Space>
"    inoremap <buffer> -*- -*-

    "used to just from right bracket or quote
    inoremap <buffer> <Tab> <c-r>=SkipBracket("[\\]\\)\\}>'`;\"]")<C-J>
    
    "single line comment for python script
	inoremap <buffer> <c-_> <c-r>=ScriptCommentToggle(".")<C-J><Esc>x
	nnoremap <buffer> <c-_> i<c-r>=ScriptCommentToggle(".")<C-J><Esc>x
	vnoremap <buffer> <c-_> <Esc>i<c-r>=ScriptVCommentToggle()<C-J><Esc>x

endfunction 

"all configurations for python programming
function! PythonCommonConfig()

    call PythonAbbrevs()
    call PythonMappings()
endfunction 





