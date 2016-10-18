"abbrev for sh script edit"
function! ZSHAbbrevs()
    iabbrev <buffer> iif #if ((condition)){statements}<Esc>o<Esc>xiif  ((    ))  {}<Esc>F{a<C-J><C-J><Esc>2k0f)2hi
    iabbrev <buffer> iiff #if [[condition]]{statements} file condition<Esc>o<Esc>xiif  [[    ]]  {}<Esc>F{a<C-J><C-J><Esc>2k0f]2hi
    iabbrev <buffer> iifs #if [[condition]]{statements} string condition<Esc>o<Esc>xiif  [[    ]]  {}<Esc>F{a<C-J><C-J><Esc>2k0f]2hi
    iabbrev <buffer> ifor #for ((e1;e2;e3)){statements}<Esc>o<Esc>xifor  (( e1; e2; e3 )) {}<Esc>F{a<C-J><C-J><Esc>2k0fedwi
    iabbrev <buffer> iforeach #for element (e1 e2 e3){statements}<Esc>o<Esc>xifor  element  ( ) {}<Esc>F{a<C-J><C-J><Esc>2k0f(a
    iabbrev <buffer> iwhile  #while  ((condition)){statements}<Esc>o<Esc>xiwhile  ((  )) {}<Esc>F{a<C-J><C-J><Esc>2k0f)hi
    iabbrev <buffer> iuntil #untile ((condition)){statements}<Esc>o<Esc>xiuntil  ((  )) {}<Esc>F{a<C-J><C-J><Esc>2k0f)hi
    iabbrev <buffer> iselect #select e (e1 e2 e3) {statements}<Esc>o<Esc>xiselect element  (  ) {}<Esc>F{a<C-J><C-J><Esc>2k0f(a
    iabbrev <buffer> irepeat #repeat num[;]{statements}<Esc>o<Esc>xirepeat  ; {}<Esc>F{a<C-J><C-J><Esc>2k0f;hi
    iabbrev <buffer> icase #case exp in pattern) statements;;/case exp {pattern) statement;;..}<Esc>o<Esc>xicase  exp  {}<Esc>F{a<C-J><C-J><Esc>kopattern) statement;;<Esc>2k0f  

    iabbrev <buffer> iarr typeset -a varname<Esc>b
    iabbrev <buffer> iArr typeset -A varname<Esc>b

endfunction


function! ZSHMappings()

    "auto match bracks
    inoremap <buffer>  ( ()<Esc>i
    inoremap <buffer>  [ []<Esc>i
    inoremap <buffer>  { {}<Esc>i
    inoremap <buffer>  < <><Esc>i
    inoremap <buffer>  ) <c-r>=ClosePair(')')<C-J>
    inoremap <buffer>  ] <c-r>=ClosePair(']')<C-J>
    inoremap <buffer>  > <c-r>=ClosePair('>')<C-J>
    inoremap <buffer>  } <c-r>=ClosePair('}')<C-J>
    inoremap <buffer>  " <c-r>=QuoteDelim('"')<C-J>
    inoremap <buffer>  ' <c-r>=QuoteDelim("'")<C-J>
    
    "jump out from right bracket or quote
    inoremap <buffer>   <Tab> <c-r>=SkipBracket("[\\]\\)\\}>'\"`;]")<C-J>

    "comment current line of bash code
    inoremap <buffer>  <c-_> <c-r>=ScriptCommentToggle(".")<C-J><Esc>x
    nnoremap <buffer>  <c-_> i<c-r>=ScriptCommentToggle(".")<C-J><Esc>x
    vnoremap <buffer>  <c-_> <Esc>i<c-r>=ScriptVCommentToggle()<C-J><Esc>x

endfunction


"zsh filetype specific configuration
function! ZSHCommonConfig()
    call ZSHAbbrevs()
    call ZSHMappings()
endfunction
