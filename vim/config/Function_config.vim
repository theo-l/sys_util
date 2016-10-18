"Vim 个人定制函数

"########################################"
" 在编辑时跳过一些特殊的字符
"########################################
function! SkipBracket(pattern)
	let line=getline('.')
	let col=col('.')
	let target=line[col-1]
	echo target
"	if match(target,"[\\]\\)\\}>'\"`,\\.:]") <0
	if match(target,a:pattern) <0
		echo target "not matched"
		return "\<Tab>"
	else
		echo target "matching"
		return "\<Right>"
	endif 
endfunction


"########################################"
" 避免键入右括号
"########################################
function! ClosePair(char)
	if getline('.')[col('.')-1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"########################################"
" 检查当前系统的时间是白天还是晚上
"########################################
function! IsDay()
    let current_h = strftime("%H")
    if current_h > 6
        if current_h < 18
            return 1
        endif
    endif
    return 0
endfunction


"########################################"
"Used for quote chars pair or jump
"########################################
function! QuoteDelim(char)
	let line=getline('.')
	let col=col('.')
	if line[col - 2] == "\\"
		return "\<Right>"
	elseif line[col - 1] == a:char
		return "\<Right>"
	else
		return a:char.a:char."\<Esc>i"
	endif
endfunction


"########################################"
" 用来单行注释 (x)[ht]ml 文件类型
"########################################
function! XmlCommentToggle()
	let line=getline(".")
	if line =~ '^\s*<!--'
			return "\<Esc>0d2f-\<Esc>$2F-d$"
	else
			return "\<Esc>0i<!--\<Esc>$a -->"
	endif

endfunction


"########################################"
" 用来多行注释 (x)[ht]ml 文件类型
"########################################
function! XmlVCommentToggle()
    
    let [row1,col1] = getpos("'<")[1:2]
    let [row2, col2] = getpos("'>")[1:2]
    
    if row1 != row2 
        let line1 = getline(row1)
        let line2 = getline(row2) 
        
        if line1=~ '^<!--' && line2 =~ '-->$'
            let comment_start_index=stridx(line1,'<!--')
            let comment_new_start_line=strpart(line1,comment_start_index+4)
            call setline(row1,comment_new_start_line)

            let comment_end_index=stridx(line2,'-->')
            let comment_new_end_line=strpart(line2,0,comment_end_index)
            call setline(row2, comment_new_end_line) 
        else
            call setline(row1, "<!-- ".line1)
            call setline(row2,line2." -->")
        endif
        

    else
        let line=getline(row1) 
        
        call setline(row1,"<!-- ".line." -->") 
    endif
endfunction


"Linux 脚本文件单行注释开关--在插入模式中
function! ScriptCommentToggle(row)
	let line=getline(a:row)
    if line =~ '^#'
        let comment_start_index=stridx(line,"#")
        let new_line=strpart(line, comment_start_index+1)
        call setline(a:row,new_line)
    else
        call setline(a:row,"#".line)
    endif
	
endfunction

"Linux 脚本文件多行注释-在插入模式中
function! ScriptVCommentToggle()

    let [row1, col1] = getpos("'<")[1:2]
    let [row2, col2] = getpos("'>")[1:2]
   
    if row1 != row2
        for line_index in range(row1, row2)
            call ScriptCommentToggle(line_index) 
        endfor
    else
        call ScriptCommentToggle(row1)
    endif
endfunction

"C语言风格的单行注释-在插入模式中
function! CStyleCommentToggle(row)
	let line=getline(a:row)

	if line =~ '^//'
        let comment_start_index = stridx(line, '//')
        let new_line = strpart(line, comment_start_index+2)
        call setline(a:row, new_line)
	else
	    call setline(a:row,'//'.line)
	endif
endfunction

"C语言风格的多行注释-在插入模式中
function! CStyleVCommentToggle()
    
    let [row1, col1] = getpos("'<")[1:2]
    let [row2, col2] = getpos("'>")[1:2]

    if row1 != row2

       for line_index in range(row1, row2)
           call CStyleCommentToggle(line_index) 
       endfor
    else
        call CStyleCommentToggle(row1)
    endif
    
endfunction

"Vim脚本语言的单行注释
function! VimCommentToggle(row)
	let line=getline(a:row)
	if line =~ '^"'
            let comment_start_index = stridx(line, '"')
            let new_line = strpart(line, comment_start_index+1)
            call setline(a:row, new_line)
	else
            call setline(a:row,'"'.line)	
	endif

endfunction

"Vim脚本语言的多行注释
function! VimVCommentToggle()

    let [row1, col1] = getpos("'<")[1:2]
    let [row2, col2] = getpos("'>")[1:2]
    
    if row1 == row2
        call  VimCommentToggle(row1)
    else
        
        for line_index in range(row1, row2)
           call VimCommentToggle(line_index) 
        endfor
    endif
endfunction







"########################################"
"执行当前的可执行脚本文件
"
"Support:
"
"   sh     script
"   zsh    script
"   python script
"   perl   script
"########################################
function! RunCurrentScript()

    if &filetype == "sh"
       execute "!bash %" 
    elseif &filetype == "zsh"
        execute "!zsh %"
    elseif &filetype == "python"
        execute "!python %"
    elseif &filetype == "perl"
        execute "!perl %"
    else
        echo "filetype : ".&filetype." is not an recogonised script file"
    endif
endfunction

