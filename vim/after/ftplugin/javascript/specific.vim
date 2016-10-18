function! JavaScriptMaps()

    inoremap <buffer> ( ()<Esc>i
    inoremap <buffer> [ []<Esc>i
    inoremap <buffer> { {}<Esc>i
    inoremap <buffer> < <><Esc>i
    inoremap <buffer> ) <c-r>=ClosePair(')')<C-J>
    inoremap <buffer> ] <c-r>=ClosePair(']')<C-J>
    inoremap <buffer> > <c-r>=ClosePair('>')<C-J>
    inoremap <buffer> } <c-r>=ClosePair('}')<C-J>
    inoremap <buffer> " <c-r>=QuoteDelim('"')<C-J>
    inoremap <buffer> ' <c-r>=QuoteDelim("'")<C-J>
    
    "comment current line of java code
   	inoremap <buffer> <c-_> <c-r>=CStyleCommentToggle(".")<C-J><Esc>x
   	nnoremap <buffer> <c-_> i<c-r>=CStyleCommentToggle(".")<C-J><Esc>x
   	vnoremap <buffer> <c-_> <Esc>i<c-r>=CStyleVCommentToggle()<C-J><Esc>x
    
    
    "jump out from right bracket or quote
    inoremap  <buffer> <Tab> <c-r>=SkipBracket("[\\]\\)\\}>'`;\"]")<C-J>

endfunction


function! JavaScriptCommonConfig()

    call JavaScriptMaps()

endfunction


