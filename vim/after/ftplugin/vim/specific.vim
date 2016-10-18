
"########################################
" Abbrev configurations for vim script 
"
" 1. basic script statement configuration
" 2. some useful code snippet configurations
"########################################
function! VimAbbres()

    iabbrev <buffer> iif if ()<C-J><C-J>endif<Esc>2kf(h
    iabbrev <buffer> ielseif elseif <C-J><C-J><Esc>2kffa
    iabbrev <buffer> iwhile while <C-J><C-J> endwhile <Esc>2kfea
    iabbrev <buffer> ifor for <C-J><C-J> endfor <Esc>2kfra
    iabbrev <buffer> def function! ()<C-J><C-J>endfunction<Esc>2k0f(h


    iabbrev <buffer> idoc "<Esc>40a#<Esc>o<C-J><Esc>40a#<Esc>ka

    "keyworks
"    iabbrev <buffer> func function
"    iabbrev <buffer> endfc endfunction

endfunction


"########################################
" Key Mapping configurations for vim script
"
"   1. mainly for some quote complete and jump
"   2. code commment
"########################################
function! VimMappings()

    inoremap <buffer> ( ()<Esc>i
    inoremap <buffer> [ []<Esc>i
    inoremap <buffer> { {}<Esc>i
    inoremap <buffer> < <><Esc>i
    inoremap <buffer> ) <c-r>=ClosePair(')')<C-J>
    inoremap <buffer> ] <c-r>=ClosePair(']')<C-J>
    inoremap <buffer> > <c-r>=ClosePair('>')<C-J>
    inoremap <buffer> } <c-r>=ClosePair('}')<C-J>
    inoremap <buffer> <leader>" <c-r>=QuoteDelim('"')<C-J>
    inoremap <buffer> <leader>' <c-r>=QuoteDelim("'")<C-J>


    "jump out from right bracket or quote
    inoremap <buffer> <Tab> <c-r>=SkipBracket("[\\]\\)\\}>'`;\"]")<C-J>

    "comment current line of vim code
    inoremap <buffer> <c-_> <c-r>=VimCommentToggle(".")<C-J><Esc>x
    nnoremap <buffer> <c-_> i<c-r>=VimCommentToggle(".")<C-J><Esc>x
    vnoremap <buffer> <c-_> <Esc>i<c-r>=VimVCommentToggle()<C-J><Esc>x

endfunction


"########################################
" Configuration method been called for vim script editting
"########################################
function! VimCommonConfig()
    setlocal iskeyword+=-
    call VimAbbres()
    call VimMappings()
endfunction
   
