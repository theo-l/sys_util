function! XmlCommonMap()

   	inoremap <buffer> <c-_> <c-r>=XmlCommentToggle()<CR>
   	nnoremap <buffer> <c-_> i<c-r>=XmlCommentToggle()<CR><Esc>
   	vnoremap <buffer> <c-_> <Esc>i<c-r>=XmlVCommentToggle()<CR><Esc>x
 
endfunction

"function to include all configuration for xhtml file
function! XmlCommonConfig()
    call XmlCommonMap()
endfunction


