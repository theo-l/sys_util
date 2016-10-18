"Vim 本身选项的设置

syntax on "enable vim to detective the file`s syntax
filetype plugin on "load filetype plugin
filetype indent on "load related indent file for specific filetype

set incsearch "increment search
set hlsearch "highlight search
set number "show line number
set ruler "show a ruler in the bottom of vim
"set rulerformat "custome the format of rule display
"set showtabline=1 "where display line of tab page
set wrap "long line will display in second line
set showcmd "show command 
set wildmenu "improve vim command-line complete
set wildmode=list:longest,full
"set balloondelay "the time delay before popup out mill-second
"set ballooneval "enable popup expression evaluate
"set balloonexpr "calculate the expression on popup display
"set binary "read/write/edit file in binary format
"set browsedir "the dir start to browse file
"set bufhidden "the behavior when the buffer dont display on window
"set buflisted "is buffer displayed on buffer list
"set buftype "the special type of buffer
"set casemap "specify how to change letter`s case
"set cedit "the key to open command line window
"set charconvert "expression to finish char encoding
set clipboard=unnamedplus "use clipboard as an unnamed register
"set cmdheight "set the line number of command line use
"set cmdwinheight "set the height of command line window
"set columns "set the columns of screen display
"set colorcolumn "highlight specified column
"set comments "set the pattern to start comment line
"set commentstring "set comment template,logo to folder"
"set compatible "make vim works compatible as vi
"set complete "specify how auto-complete works on Insert mode
"set completefunc "the function used to complete on Insert mode
set completeopt=longest,menu "the options for complete on Insert mode
"set concealcursor "whether hidden the text in the cursor line that is hiddenable
"set conceallevel "whether to display hiddenable text
"set list "show unprintable chars
"set listchars=tab:\ ,trail:*,extends:#,nbsp:. "highlight problematic whitespace
set nojoinspaces "prevents inserting two spaces after punctuation on a join
set splitright "puts new vsplit windows to the right side
set splitbelow "puts new split windows to the bottom of the current 
"set statusline "custome format of status line
"set term "name of terminal
"set termencoding "encoding of terminal
"set terse "simplify some message
"set textwidth "the maximum width of text width
"set title "let vim to set window's title

"保存历史记录的个数
set history=1000

"set spell "check spell
"set spellfile "the file to store zg/zw words
set autoindent "decided the new line indent by the upper line
set tabstop=4 "make all <tab> be 4 space width
set softtabstop=4
set shiftwidth=4
set expandtab "don't use space to replace <tab>
set smarttab "using <tab> in the beginning of line or paragraph
set ignorecase  "let vim don't be case sensitive
set smartcase "if you type an Upper case, will let search be case-sensitive
set mouse=a "let mouse can be used in vim
set mousemodel=popup 
set mousehide "hide the mouse cursor when typing
set backspace=indent,eol,start " backspace for dummies
set linespace=0 "no extra spaces between rows
set viewoptions=folds,options,cursor,unix,slash

"兼容unix和windows文件格式
set fileformats=unix,mac,dos "compatibility for unix/windows
set hidden "allow buffer switching without saving
"set backup "backup is nice, do not like keep backup files in system
"set backupcopy "backup using copy not change the file name
"set backupext "the extend for backup file name
"set backupskip "don't backup file when match the given patterns'
"
"根据系统时间来设置背景主题
if IsDay()
    set background=light
else
    set background=dark
endif

"set diff "use diff mode on current window
"set diffexpr "get expression that diff file using
"set diffopt "use diff mode option
set backupdir=~/.swp "the dir name used to backup file
set directory=~/.swp "the dir name list for swap files
"set encoding "the encoding method used internal
"set endofline "write new-line char in the end of file
"set equalalways "make all windows have the same size automaticaly
"set equalprg "the outter command used by =
"set errorbells "ring a bell when has error messages
"set fileencoding "encoding format for multiple byte text
"set fileencodings "encoding formats used to participate auto detect 
"set foldopen "set the command to open fold
"set foldtext "display expression used to close fold
set icon "allow vim to set text of window icon
"set iconstring "the string vim text icon using
"set iskeyword "the chars that keywords can use
"set isfname "the chars that filename can use
"set isident "set the chars that identifers can use
"set isprint "chars that can display
"set key "the key used to encode
"set lines "display lines of screen
"set lisp "auto lisp indent
"set linebreak "
"set loadplugins "invoke plugin script when start
"
if has('nvim')
    set shada='20,<50,s10
else
    set viminfo+=! "keep global variables
endif

set visualbell "make bell visual instead of ring
"set cursorbind "when move cursor also move in other window
set cursorline "highlight current line
"set cursorcolumn "highlight current column
set shortmess=atI "don't show the default vim startup
set autoread "auto load file when it's changed outside of vim
set autowrite "auto save file when file has something changed
set magic "change the special chars used in search pattern
set confirm "confirm when process unsaved or readonly file
set showmatch "highlight matched brace
set matchtime=1
"set matchpairs "the char pair that % can match
"set modeline "mode line number in the begin/end of the file
"set modelines "the lines modeline checks
"set modifiable "if can modify text
"set modified "if buffer been modified
"linux Mac
"set wildignore+=*/tmp/**,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*/.git/**,*/.svn/**,*.svn-base
set wildignorecase "ignore case when match filename
set wildignore=*.o,*.obj,*~,*.pyc "stuff to ignore when tab completing
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.env-pypy
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=.webassets-cache/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=.vagrant/**
set wildignore+=.coverage/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

set tags+=./tags,tags,~/.vimtags " set tags file place
set scrolloff=3 "cursor move to the top or bottom keep 3 line space

if version >= 603
		set helplang=cn "show chinese language help doc
endif 

if &term == 'xterm' || &term == 'screen' || &term == 'xterm-256color' || &term == 'screen-256color'
    set t_Co=256 "enable 256 colors for vim console
endif

highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

set relativenumber

"autocmd BufRead * :set relativenumber "using relative number for line when in normal mode

"    autocmd InsertEnter * :set norelativenumber "using norelative number for line when in normal mode

"    autocmd InsertLeave * :set relativenumber "using relative number for line when in normal mode





"########################################"
"  Config vim Enviroment variables
"########################################"
set path+=$PWD/**/*



"########################################"
" Gvim options Configurations 
"########################################"
set guioptions-=m "hide gvim menu bar
set guioptions-=T "hide gvim toolbar
"set guioptions-=r "hide gvim right-hand scroll bar
"set guioptions-=L "hide gvim left-hand scroll bar
"set guicursor "set cursor shape and blash
"set guipty "set :! to imitate terminal
"set guitablabel "custome tab pages tag

"设置GUI的字体
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10

set shell=/bin/bash
"set shellcmdflag+=i
"
"########################################
" config vim colorscheme
if has('gui_running')
    colorscheme molokai
else
    if IsDay()
        colorscheme solarized
    else
        colorscheme molokai
    endif
endif
"########################################


























