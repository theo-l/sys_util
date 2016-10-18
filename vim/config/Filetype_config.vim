" 文件类型相关的配置

"Markdown
au BufNewFile,BufRead *.md setf markdown
augroup MarkdownCommon
    autocmd!
    autocmd FileType markdown call MarkdownCommonConfig()
augroup END

"enable code folding 
"au FileType javascript call JavaScriptFold()

"xhtml 
au BufNewFile,BufRead *.xhtml setf xhtml
augroup XhtmlCommon
    autocmd!
    autocmd FileType xhtml call XhtmlCommonConfig()
augroup END

"html 
au BufNewFile,BufRead *.html setf html
augroup HtmlCommon
    autocmd!
    autocmd FileType html call HtmlCommonConfig()
augroup END

"xml 
au BufNewFile,BufRead *.xml setf xml
augroup XmlCommon
    autocmd!
    autocmd FileType xml call XmlCommonConfig()
augroup END



"java 
au BufNewFile,BufRead *.java setf java
augroup JavaCommon
    autocmd!
    autocmd FileType java call JavaCommonConfig()
augroup END

"python 
au BufNewFile,BufRead *.py setf python
augroup PythonCommon
    autocmd!
    autocmd FileType python call PythonCommonConfig()
augroup END

"xml
au BufNewFile,BufRead *.xml setf xml
augroup XmlCommon
    autocmd!
    autocmd FileType xml call XmlCommonConfig()
augroup END

"vim
au BufNewFile,BufRead *.vim setf vim
augroup VimCommon
    autocmd!
    autocmd FileType vim call VimCommonConfig()
augroup END

"sh
au BufNewFile,BufRead *.sh setf sh
augroup SHCommon
    autocmd!
    autocmd FileType sh call SHCommonConfig()
augroup END

"zsh
au BufNewFile,BufRead *.zsh setfiletype zsh
augroup ZSHCommon
    autocmd!
    autocmd FileType zsh call ZSHCommonConfig()
augroup END

"javascript
au BufNewFile, BufRead *.js setfiletype javascript
augroup JavascriptCommon
    autocmd!
    autocmd Filetype javascript call JavaScriptCommonConfig()
augroup END

