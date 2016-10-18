"auto match bracks
function! HtmlMappings()
    inoremap <buffer> ( ()<Esc>i
    inoremap <buffer> [ []<Esc>i
    inoremap <buffer> { {}<Esc>i
    inoremap <buffer> < <><Esc>i
    inoremap <buffer> " ""<Esc>i
    inoremap <buffer> ) <c-r>=ClosePair(')')<C-J>
    inoremap <buffer> ] <c-r>=ClosePair(']')<C-J>
    inoremap <buffer> > <c-r>=ClosePair('>')<C-J>
    inoremap <buffer> } <c-r>=ClosePair('}')<C-J>
    inoremap <buffer> <leader>" <c-r>=QuoteDelim('"')<C-J>
    inoremap <buffer> <leader>' <c-r>=QuoteDelim("'")<C-J>


    "jump out from right bracket or quote
    inoremap <buffer> <Tab> <c-r>=SkipBracket("[\\]\\)\\}>\"'`;]")<C-J>

    "comment current line of vim code
    inoremap <buffer> <c-_> <c-r>=XmlCommentToggle()<C-J>
    nnoremap <buffer> <c-_> i<c-r>=XmlCommentToggle()<C-J><Esc>
    vnoremap <buffer> <c-_> <Esc>i<c-r>=XmlVCommentToggle()<C-J><Esc>x

endfunction

"add comment line
function! HtmlCommonMap()
endfunction


"all configurations for vim script edit
function! HtmlCommonConfig()
    call HtmlCommonMap()
    call HtmlMappings()
endfunction
 
