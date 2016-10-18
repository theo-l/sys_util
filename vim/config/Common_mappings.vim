" 常用的Vim操作键映射

"########################################"
" 使用 空格键作为 leader 键
"########################################
let mapleader = "\<Space>"
inoremap <Space><Space> <Space>

"########################################"
"Vim 窗口导航键映射
"########################################
map <c-h> <c-w>h
map <c-l> <c-w>l
map <c-j> <c-w>j
map <c-k> <c-w>k

"########################################"
"Vim 行移动映射
"########################################
nmap ,b  0zz
nmap ,e  $zz


"########################################"
"Django manage.py configurations
"########################################
nnoremap <leader>pmm :!python manage.py makemigrations
nnoremap <leader>pcm :!python manage.py migrate<CR>
nnoremap <leader>ps  :!python manage.py shell<CR>
nnoremap <leader>prs :!python manage.py runserver<CR>

"########################################"
"vim tab navigation mappings
"########################################
"nnoremap <c-Left> :tabprevious<CR>
"nnoremap <c-Right> :tabnext<CR>
"inoremap <c-Left> <Esc>:tabprevious<CR>
"inoremap <c-Right> <Esc>:tabnext<CR>
""nnoremap <C-u> :tabprevious<CR>
""nnoremap <C-n> :tabnext<CR>
""inoremap <C-u> <Esc>:tabprevious<CR>
""inoremap <C-n> <Esc>:tabnext<CR>

"########################################"
"Quote Match pairs 
"########################################
"nmap <leader>pa %


"########################################"
"Line insert Mappings
"########################################
"nnoremap 2o o<CR><Esc>ki
"nnoremap o o<c-o>zz

"########################################"
"Window adjust Mappings
"########################################
nmap n nzz
nmap N Nzz
nmap gg ggzz 
nmap G  Gzz


"########################################"
"Save Mappings
"########################################
nnoremap <leader>w   :w<CR>

"########################################"
"Delete Mappings
"########################################
nnoremap de d$
nnoremap db d0
nnoremap dd dd
"inoremap dd <Esc>dd

"########################################"
"Copy&Paste Mappings
"########################################
"copy all the buffer content
map <leader>ya  <Esc>ggvG$"+y
"copy until the end of line
nnoremap ye y$
"copy until the beginning of line
nnoremap yb y^
"copy all the content into system clipboad
map <leader>ys "+yy
"paste the content from system clipboard
map <leader>p "+p


"########################################
"Esc key Mappings
"########################################
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>


"########################################
"Exits Mappings
"########################################
inoremap ,w	 <Esc>:w<CR>
nnoremap ,w	 :w<CR>

" 将每次退出时的状态写入到 ~/.vim/session.vim 文件中
nnoremap ,q :mksession! ~/.vim/session.vim<CR>:q<CR>
nnoremap ,qa :mksession! ~/.vim/session.vim<CR>:qa<CR>
nnoremap ,wq :mksession! ~/.vim/session.vim<CR>:wq<CR>
nnoremap ,wqa :mksession! ~/.vim/session.vim<CR>:wqa<CR>

" 恢复之前退出 Vim 时的状态
nnoremap ,ss :source ~/.vim/session.vim<CR>

"########################################"
" 将字母转换为小写
"########################################
nnoremap gle gu$
nnoremap glb gu^
nnoremap glw guw

"########################################"
" 将字母转换为大写
"########################################
nnoremap gue gU$
nnoremap gub gU^
nnoremap guw gUw

"########################################"
"Update Actions 
"########################################
map <leader>e :e<CR>
map <leader>x :x<CR>


"########################################"
"Search Actions
"########################################
map <leader>f :tabfind 


"########################################"
"Turn off disturb message prompt
"########################################
map  q: :q



"########################################"
" 命令行相关的键映射
"########################################
"enter shell command line
map <leader>c :!

"executing current line as shell command
map <leader>cl :.w !bash<CR>

"executing current executable script file
map <leader>cs :call RunCurrentScript()<CR>


"########################################"
"Git Mappings
"########################################
"upload local repo to remote repo
nnoremap <leader>gu :!git add -A;git commit -m 'updated';git push origin master<CR>
"fetch remote repo to local repo
nnoremap <leader>gl :!git fetch origin ; git pull origin master<CR>

"########################################"
" Autocomplete match bracks
"########################################
inoremap <leader>( ()<Esc>i
inoremap <leader>[ []<Esc>i
inoremap <leader>{ {}<Esc>i
inoremap <leader>< <><Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap > <c-r>=ClosePair('>')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap <leader>" <c-r>=QuoteDelim('"')<CR>
inoremap <leader>' <c-r>=QuoteDelim("'")<CR>
inoremap <leader>` <c-r>=QuoteDelim("`")<CR>

"inoremap  <Tab> <c-r>=SkipBracket()<CR>

"########################################"
"Run Config Command Mapping
"########################################
"executing the vim configuration file and reload system .vimrc file
nnoremap <leader>vc :!./config.sh<CR>:source $MYVIMRC<CR><CR>
"reload the .vimrc configuration file


"########################################"
" 安装插件的相关配置
"########################################


"########################################"
"NERDTree configuration
"########################################
let g:nerdtree_tabs_open_on_console_startup=0		
let g:nerdtree_tabs_open_on_gui_startup=0		
let NERDTreeMapOpenInTab='<Enter>'
map <leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc']

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"########################################"
"Taglist configuration
"########################################
map <leader>tl :TlistToggle<CR>
let Tlist_Use_Right_Window=1



"########################################"
"pydiction configuration
"########################################
"let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height=5



"########################################"
"Java complete configuration
"########################################
"nnoremap <silent> <buffer> <leader>i :JavaImport<CR>
"noremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<CR>
"nnoremap <silent> <buffer> <CR> :JavaSearchContext<CR>


"########################################"
"Enable air-powerline for vim
"########################################
set laststatus=2
set noshowmode  "hide the default mode text 

"enable use airline sybmols"
let g:airline_powerline_fonts = 1 

"enable smater tab line
let g:airline#extensions#tabline#enabled = 1

"########################################"
"Ctrlp configuration
"########################################
let g:ctrlp_map='<c-f>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_cache_dir=$HOME.'/.cache/ctrlp'
let g:ctrlp_working_path_mode = 'rw'
"let g:ctrlp_working_path_mode = 2
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|class|svn-base|swp)[\/]*$'
let g:ctrlp_custom_ignore = { 
            \ 'dir':  '\v[\/](\.(git|hg|svn))|(deploy|tmp|lib)$',  
            \ 'file':  '\v[\/]\.(git|hg|svn|class|svn-base|swp)$',  
            \ 'link': 'some_bad_symbolic_links', 
            \ }
"use a custom file listing command
"let g:ctrlp_user_command = 'find %s -type f| grep -v -E \"(\.git\/)|(\.svn\/)|(\.settings\/)|(deploy\/)|(tmp\/)|(dist\/)|(lib\/)|(build\/)|(bin\/)"' 
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif


if executable('ag')
    "using ag as file searcher
    let g:ctrlp_user_command = 'ag  %s --files-with-matches -g "" --ignore "\.git$\|.hg$\|.svn$"' 
    let g:ctrlp_use_caching =0
else
 " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif






"########################################"
"jedi configuration
"########################################
"Jedi is by default automatically initialized. use follow to disable it 
"let g:jedi#auto_initialization = 0
"There are also some VIM options (like completeopt and key defaults) which are automatically initialized, but you can skip this:
let g:jedi#auto_vim_configuration = 1
"If you are a person who likes to use VIM-buffers not tabs, you might want to put that in your .vimrc:
let g:jedi#use_tabs_not_buffers = 0
"If you are a person who likes to use VIM-splits, you might want to put this in your .vimrc:
"This options could be "left", "right", "top", "bottom" or "winwidth". It will decide the direction where the split open.
let g:jedi#use_splits_not_buffers = "left"
" Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:           
let g:jedi#popup_on_dot = 1
"Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
let g:jedi#popup_select_first = 0
"Jedi displays function call signatures in insert mode in real-time, highlighting the current argument. The call signatures can be displayed as a pop-up in the buffer (set to 1, the default), which has the advantage of being easier to refer to, or in Vim's command line aligned with the function call (set to 2), which can improve the integrity of Vim's undo history.
let g:jedi#show_call_signatures = "1"
"Here are a few more defaults for actions, read the docs (:help jedi-vim) to get more information. If you set them to "", they are not assigned.
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#smart_auto_mappings =0
"used to disable jedi autocomplete"
"let g:jedi#completions_enabled = 0
"

"########################################"
" Solarized color config
"########################################
let g:solarzied_termcolors=256


"########################################"
"javascript configuration
"########################################
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"


"########################################"
" Youcompleteme
"########################################
let g:ycm_filetype_whitelist={'*': 1}
let g:ycm_auto_trigger = 1


"########################################"
" Emmet 
"########################################
" setting which mode should emmet work in
"let g:user_emmet_mode="n"
let g:user_emmet_mode="inv"
"let g:user_emmet_mode="a"

"enable emmet only for html/css file
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall


"remapping emmet trigger key
let g:user_emmet_leader_key="<C-E>"
"let g:user_emmet_leader_key="<C-Y>" "default trigger key






" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<enter>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
