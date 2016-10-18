
"======================================java functions======"

"abbreviations for java file edit
function! JavaAbbrevs()

    "main method abbrev
    iabbrev <buffer> imain public static void main(String[] args){}<Esc>i<C-J><Esc>ko
    "print statement abbrev
    iabbrev <buffer> iout System.out.println();<Esc>2h
    "simple if statement
    iabbrev <buffer> iif if(){<C-J><C-J><Esc>2k0f(a
    "if else if statement
    iabbrev <buffer> ielf if(){<C-J><C-J><Esc>f}a else if(){<C-J><C-J><Esc>4k0f(a
    "simple if else statement
    iabbrev <buffer> ife if(){<C-J><C-J><Esc>f}a else{<C-J><C-J><Esc>4k0f(a
    "while statement abbreve
    iabbrev <buffer> iwhile while(){<C-J><C-J><Esc>2k0f(a
    "for statement abbrev
    iabbrev <buffer> ifor for(){<C-J><C-J><Esc>2k0f(a
    "try catch statement abbrev
    iabbrev <buffer> itry try{<C-J><C-J><Esc>f}a catch(Exception e){<C-J><C-J><Esc>4ko
    "catach statement in try statement
    iabbrev <buffer> icatch catch(){<C-J><C-J><Esc>2k0f(a
    "switch statement abbrev
    iabbrev <buffer> iswitch switch(){<C-J><Esc>ko case : break<Esc>k0f(a

    "keywords correct
    iabbrev <buffer> publci public
    iabbrev <buffer> pubic  public
    iabbrev <buffer> publc  public

    iabbrev <buffer> priate private
    iabbrev <buffer> priveta private
    iabbrev <buffer> privat private

    iabbrev <buffer> statci static

    iabbrev <buffer> viod  void

    iabbrev <buffer> calss class

    iabbrev <buffer> abstarct abstract

    iabbrev <buffer> interfaec interface

    iabbrev <buffer> Sting String

endfunction


"auto match bracks
function! JavaMaps()

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

"all configuration for java 
"this method will be called in .vimrc augroup JavaCommon
function! JavaCommonConfig()

    call JavaAbbrevs()
    call JavaMaps()

endfunction

"===========================================================

