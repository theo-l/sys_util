
"abbrev for sh script edit"
function! SHAbbrevs()

    iabbrev <buffer> iif            if  [[  ]]; then<C-J><C-J>fi<Esc>2k2f[a
    iabbrev <buffer> iffileexists   if  [[ -f $file ]]; then <C-J><C-J>fi<Esc>2kf$
    iabbrev <buffer> ifdirexists    if  [[ -d $dir ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> iffileread     if  [[ -r $file ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> iffileempty    if  [[ -s $file ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> iffilewrite    if  [[ -w $file ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> iffilerun      if  [[ -x $file ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> iffileequal    if  [[ $file1 -ef $file2 ]]; then <C-J><C-J>fi<Esc>2kf$   
    iabbrev <buffer> iffile1newer   if  [[ $file1 -nf $file2 ]]; then <C-J><C-J>fi<Esc>2kf$   
    iabbrev <buffer> iffile1older   if  [[ $file1 -of $file2 ]]; then <C-J><C-J>fi<Esc>2kf$   
    iabbrev <buffer> ifoptenabled   if  [[ -o $optname ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifvarexists    if  [[ -v $varname ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifstremt       if  [[ -z $str ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifstrnem       if  [[ -n $str ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifstreq        if  [[ $str1 == $str2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifstrne        if  [[ $str1 != $str2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumeq        if  [[ $num1 -eq $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumne        if  [[ $num1 -ne $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumgt        if  [[ $num1 -gt $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumge        if  [[ $num1 -ge $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumlt        if  [[ $num1 -lt $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  
    iabbrev <buffer> ifnumle        if  [[ $num1 -le $num2 ]]; then <C-J><C-J>fi<Esc>2kf$  

    iabbrev <buffer> ilist  #declare -a listVar; listVar=(value1 ...)<Esc>odeclare -a $listVar<Esc>F$
    iabbrev <buffer> idict  #declare -A dictVar; dictVar[name]=value<Esc>odeclare -A $dictVar<Esc>F$

      

    iabbrev <buffer> ifor       for  ((e1;e2;e3 ))  ;  do <C-J><C-J>; <C-J>done <Esc>3kfe
    iabbrev <buffer> iforin     for $var in ${array[@]} ; do <C-J><C-J>statement; <C-J>done <Esc>3k0f$ 
    iabbrev <buffer> iwhile     while  [ test ]  ;  do <C-J><C-J>; <C-J>done <Esc>3kft   
    iabbrev <buffer> iuntil     until  [ test ]  ;  do <C-J><C-J>; <C-J>done<Esc>3kft
    iabbrev <buffer> icase      case  $varName  in  <C-J>op1 \| op2 ) statement ;;<C-J> *) statement ;;<C-J>esac<Esc>3kf$

    iabbrev <buffer> idoc       <Esc>50i#<Esc>o#<C-J><Esc>50i#<Esc>kf#a
endfunction


function! SHMappings()

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


"sh filetype specific configuration
function! SHCommonConfig()
    call SHAbbrevs()
    call SHMappings()
endfunction
