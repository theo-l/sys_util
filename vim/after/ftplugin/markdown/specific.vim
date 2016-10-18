
function! MarkdownCommonSettings()

    setlocal textwidth=120
    setlocal iskeyword+=-
    setlocal nospell

endfunction

"use <tab> will jump the following chars
function! MarkdownSkipBracket()
	let line=getline('.')
	let col=col('.')
	let target=line[col-1]
	echo target
	if match(target,"[\\]\\)\\}>'\"`,\\.:]") <0
		echo target "not matched"
		return "\<Tab>"
	else
		echo target "matching"
		return "\<Right>"
	endif 
endfunction

function! MarkdownMappings()
    
    "define title mapping
    "header 1 #
    map <buffer> mt1    o<ESC>2i#<ESC>i  <ESC>i
    "header 2 ##
    map <buffer> mt2	o<ESC>4i#<ESC>hi  <ESC>i
    "header 3 ###
    map <buffer> mt3	o<ESC>6i#<ESC>2hi  <ESC>i
    "header 4 #### 
    map <buffer> mt4	o<ESC>8i#<ESC>3hi  <ESC>i
    "header 5 ##### 
    map <buffer> mt5	o<ESC>10i#<ESC>4hi  <ESC>i
    "header 6 ######
    map <buffer> mt6	o<ESC>12i#<ESC>5hi  <ESC>i
    "header 7 ######
    map <buffer> mt7	o<ESC>14i#<ESC>6hi  <ESC>i

     "header 1 #
    imap <buffer> mt1  <ESC>2i#<ESC>i  <ESC>i
    "header 2 ##
    imap <buffer> mt2	<ESC>4i#<ESC>hi  <ESC>i
    "header 3 ###
    imap <buffer> mt3	<ESC>6i#<ESC>2hi  <ESC>i
    "header 4 #### 
    imap <buffer> mt4	<ESC>8i#<ESC>3hi  <ESC>i
    "header 5 ##### 
    imap <buffer> mt5	<ESC>10i#<ESC>4hi  <ESC>i
    "header 6 ######
    imap <buffer> mt6	<ESC>12i#<ESC>5hi  <ESC>i
    "header 7 ######
    imap <buffer> mt7	<ESC>14i#<ESC>6hi  <ESC>i
    
    
    " define emphasis
    map <buffer> ms1   i <ESC>2a*<ESC>i
    map <buffer> ms2   i <ESC>4a*<ESC>1hi
    map <buffer> ms3   i <ESC>6a*<ESC>2hi

    nnoremap <buffer> as1 bi*<Esc>wea*<Esc>
    nnoremap <buffer> as2 bi**<Esc>wea**<Esc>
    
    " define emphasis
    imap <buffer> ms1    <ESC>2a*<ESC>i
    imap <buffer> ms2    <ESC>4a*<ESC>1hi
    imap <buffer> ms3    <ESC>6a*<ESC>2hi

    " define paragraph
    map <buffer> <leader>mp o> 
    
    
    " define order list
    
    
    " define unorder list
    " star list
    map <buffer> <leader>msl  o* 
    "plus list
    map <buffer> <leader>mps  o+ 
    "minus list
    map <buffer> <leader>mml  o- 
    
    
    " define code block
    " define single code block
    map <buffer> <leader>msc o`  `<ESC>2hi
    
    " define multiple line code blcok
    map <buffer> <leader>mmc o```  <ESC>o```<ESC>O
    
    
    
    "define link block
    map <buffer> <leader>ml i[]<ESC>i
    
    
    "autocomplete match bracks
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
    inoremap <buffer> ` <c-r>=QuoteDelim("`")<C-J>
    
    "jump out from right bracket or quote
    inoremap  <buffer> <Tab> <c-r>=MarkdownSkipBracket()<C-J>

endfunction


function! MarkdownCommonConfig()
        call MarkdownCommonSettings()
        call MarkdownMappings()
endfunction
