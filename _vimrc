" VIMRC CROSS-PLATFORM {
"
"       \    |  |     \  | \ \  /  \ \   / _ _|   \  | 
"      _ \   __ |    |\/ |  \  /    \ \ /    |   |\/ | 
"    _/  _\ _| _|   _|  _|   _|      \_/   ___| _|  _|
"
"    github.com/whatsrtos/ah-my-vim
"
"  #Custom Shortcuts :
"    <leader> : ,
"    \t<space> | F1 : Toggle TagList
"    \b<space> | F2 : Toggle BufExplorer
"    \n<space> | F3 : Toggle NERDTree
"    \gg | F4 : Rgrep
"    \gv : Quick Vimgrep
"    \co : Open Quickfix
"    \cx : Close Quickfix
"    \cc : Comment Lines
"    \cu : Uncomments Lines
"    \tg : Generate tags
"    \\s : EasyMotion
"    <C-\>s : Find this C symbol
"    <C-\>c : Find functions calling this function
"    \c<space> : Toggles the comment state
"    \rn | F9 : Execute current buffer(php or python)
"
"  #Useful Functions :
"  * CreateTag / LoadTag
"  * SaveSession / LoadSession
"
"  #How to Use :
"  * Follow this tutorial to install vundle:
"     https://github.com/VundleVim/Vundle.vim
"  * Open vim and enter the following command:
"    :PluginInstall
"
"  #You also need install :
"  * Cygwin
"  * Flake8 or Pylint
"  * PHP or PHPCS
"  * Node.js, npm, JSLint or JSHint
" }

" Environment {
    silent function! OSX()
        return has('macunix')
    endfunction
    silent function! LINUX()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
    silent function! WINDOWS()
        return (has('win16') || has('win32') || has('win64'))
    endfunction
" }

" Set project root directory
let g:project_root=getcwd()

" Set the runtime path to include Vundle and initialize
if WINDOWS()
    set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$VIM/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'

" Brief help {
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" }

" Vundle plugins: {
    " awesome color scheme {
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'lifepillar/vim-solarized8'
    Plugin 'tomasr/molokai'
    Plugin 'gosukiwi/vim-atom-dark'
    Plugin 'colepeters/spacemacs-theme.vim'
    " }

    " original repos on GitHub {
    Plugin 'bling/vim-airline'
    Plugin 'ervandew/supertab'
    Plugin 'kien/ctrlp.vim'
    Plugin 'lrvick/Conque-Shell'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'majutsushi/tagbar'
    Plugin 'mhinz/vim-startify'
    Plugin 'tpope/vim-fugitive'
    "Plugin 'joonty/vdebug.git'
    Plugin 'whatsrtos/findstr.vim'
    Plugin 'whatsrtos/grep.vim'
    " }

    " vim-scripts repos {
    Plugin 'bufexplorer.zip'
    Plugin 'The-NERD-tree'
    Plugin 'The-NERD-Commenter'
    " }

    " completions {
    Plugin 'Shougo/neocomplcache'
    Plugin 'vim-scripts/OmniCppComplete'
    " }

    " snippets {
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'honza/vim-snippets'
    Plugin 'garbas/vim-snipmate'
    " }

    " syntax & indentation {
    Plugin 'vim-scripts/Pydiction'
    Plugin 'vim-scripts/python.vim--Vasiliev'
    "Plugin 'kevinw/pyflakes-vim'
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'scrooloose/syntastic'
    "}
" }

call vundle#end()

" General {
    " Basic
    set nocompatible                " be iMproved
    filetype plugin indent on       " automatically detect file types.
    syntax on                       " syntax highlight
    set cscopeverbose               " show tips when adding cscope database
    set history=50                  " keep 50 lines of command line history
    set mouse=a                     " enable mouse in GUI mode
    set mousehide                   " hide the mouse cursor while typing
    set number                      " show line numbers
    set ruler                       " show cursor position all the time
    "autocmd BufEnter * silent! lcd %:p:h " auto changes the window-local directory
    set noswapfile
    autocmd BufLeave,FocusLost * silent! wall    " auto save changes

    " UI
    set laststatus=2                " always show status line.
    set showcmd                     " display an incomplete command in statusline
    set showmode                    " display the current mode
    set wildmenu                    " show list instead of just completing
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too

    " GUI
    "set cursorline                  " hight current line
    if has('gui_running')
        set guioptions-=T           " remove toolbar
        set lines=50 columns=170    " resize windows
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " enable 256 colors
        endif
    endif

    " Fonts, use powerline-fonts, for the nice looking powerline symbols to appear
    if OSX() && has("gui_running")
        set guifont=Fantasque\ Sans\ Mono:h15
        "set guifont=set guifont=Source\ Code\ Pro:h14
        "set guifont=Microsoft\ YaHei\ Mono:h14
    elseif LINUX() && has("gui_running")
        set guifont=Fantasque\ Sans\ Mono\ 14
    elseif WINDOWS() && has("gui_running")
        "set guifont=Consolas:h12
        set guifont=Fantasque\ Sans\ Mono:h12:cANSI
    endif

    " Encoding
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,chinese,gb2312,gbk,cp936
    language messages zh_CN.utf-8

    set backspace=indent,eol,start  " allow backspacing over everything in insert mode

    " Indent &tab &wrap
    set autoindent                  " preserve current indent on new lines
    set expandtab                   " convert all tabs typed to spaces
    set tabstop=4                   " indentation levels every four columns
    set shiftwidth=4                " indent/outdent by four columns
    set shiftround                  " indent/outdent to nearest tabstop
    set nowrap                      " not wrap long lines

    " Folding
    set foldenable                  " turn on folding
    set foldmethod=marker foldmarker={,} foldlevel=99
    autocmd BufRead,BufNewFile *.py,*.pyw set foldmethod=indent

    " Buffer
    set autoread                    " auto reload modified files
    set autowrite                   " auto write unsaved buffers
    set hidden                      " current buffer can be put to the background without writing to disk

    " Searching
    set hlsearch                    " highlight search terms
    set incsearch                   " find as you type search
    set nowrapscan                  " disable search loop
    set noshowmatch                 " disable show matching brackets/parenthesis
    set ignorecase
    set smartcase

    " Sessions
    set sessionoptions-=curdir
    set sessionoptions-=folds
    set sessionoptions-=options
    set sessionoptions+=sesdir
    set sessionoptions+=unix,slash

    " Exclude files and directories
    set wildignore+=*.swp,*.zip,*.rar,*.gz,*.o,*.so,*.a,*.bin,*.dat,*.map,*.out,*.class,cscope.*,*/.svn/*,*.tags

    " Set chinese character with utf-8 encoding
    language messages zh_CN.utf-8

    " Highlight
    highlight link phpheredoc string
    highlight link cComment Question
" }

" Load color scheme {
    set background=dark
    if has('gui_running')
        "colorscheme solarized8
        "colorscheme atom-dark-256
        colorscheme spacemacs-theme
    else
        colorscheme desert
    endif
" }

" 120 column limit {
    "highlight ColorColumn ctermbg=235 guibg=#073642 "solarized dark
    "highlight ColorColumn ctermbg=235 guibg=#1c1c1c "atom dark
    highlight ColorColumn ctermbg=235 guibg=#212026 "spacemacs dark
    if v:version >= 703
        let &colorcolumn=join(range(119,999),",")
    endif
" }

" Key mapping {
    " Leader Key
    " let mapleader = ","

    " :)
    " nnoremap <Up> zzk
    " nnoremap <Down> zzj

    " Clear Highlight Searching
    nnoremap <esc> :nohl<cr>

    " Copy & Paste & Cut
    vmap <leader>y "+y
    vmap <leader>d "+d
    vmap <leader>p c<ESC>"+p
    imap <leader>p <C-r><C-o>+
    nmap <leader>p "+p

    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " Switch buffers like chrome:)
    noremap <C-PageUp> :bp<CR>
    noremap <C-PageDown> :bn<CR>

    " Useful mappings for managing tabs
    map <leader>tn :tabnew<CR>
    map <leader>to :tabonly<CR>
    map <leader>tc :tabclose<CR>
    map <leader>tm :tabmove

    " Switch CWD to the directory of the open buffer
    nmap <leader>cd :lcd %:p:h<CR>:pwd<CR>

    " Toggle ignore case
    nmap <leader>i :set ignorecase! \| set ignorecase?<CR>

    " Toggle folding
    nmap <leader>z @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

    " Run a PHP or Py file from within vim
    autocmd FileType php nmap <leader>rn :w!<CR>:!php %<CR>
    autocmd FileType python nmap <leader>rn :w!<CR>:!python %<CR>

    " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
    nmap <M-j> mz:m+<cr>`z
    nmap <M-k> mz:m-2<cr>`z
    vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
    vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

    " Key for Plugins {
    nmap <leader>w  :w<CR>
    nmap <leader>x  :x<CR>
    nmap <leader>o  :enew<CR>
    nmap <leader>t<space> :TagbarToggle<CR>
    nmap <leader>b<space> :BufExplorer<CR>
    nmap <leader>n<space> :NERDTreeToggle<CR>
    nmap <leader>gv :execute "vimgrep /" . expand("<cword>") . "/j **/*.*" <Bar> cw<CR>
    nmap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nmap <leader>tg :CreateTags<CR>
    nmap <leader>co :botright copen<CR>
    nmap <leader>cx :cclose<CR>
    if WINDOWS()
        nmap <leader>gg :VimFindstr<CR>
        nmap <leader>ff :EasyFindStr<CR>
        nmap <leader>ct :ConqueTerm powershell<CR>
    else
        nmap <leader>gg :VimGrepStr<CR>
        nmap <leader>go :SetGrepOpt<CR>
        nmap <leader>ct :ConqueTerm bash<CR>
    endif

    " Recursive mapping to Function Keys
    map <F1> <leader>t<space>
    map <F2> <leader>b<space>
    map <F3> <leader>n<space>
    map <F4> <leader>gg
    map <F9> <leader>rn

    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" }

" Plugin {
    " plugin::grep.vim {
    let Grep_Default_Options = '-s -w'
    let Grep_Skip_Dirs = '.git .svn cvs rcs sccs'
    let Grep_Skip_Files = 'tags *.bak *~ cscope.* *.a *.o *.pyc *.bak *.swp'
    " }

    " plugin::findstr.vim {
    let Findstr_Exclude_Dir = '.git\\ .svn\\ cvs\\ rcs\\ sccs\\'
    "}

    " plugin::taglist {
    let g:tagbar_autofocus = 1
    let g:tagbar_left = 1
    let g:tagbar_sort = 0
    let g:tagbar_width = 30
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : ['h:headings'],
        \ 'sort' : 0
        \ }
    " }

    " plugin::nerdtree {
    let g:NERDTreeWinPos="right"
    let NERDChristmasTree=1
    let NERDTreeChDirMode=1
    let NERDTreeIgnore=['\.o$', '\.ko$', '\~$', '\.dir$']
    " }

    " plugin::ctrlp {
    let g:ctrlp_root_markers = ['.ctrlp']  " Create file '_ctrlp' to mark root directory
    let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$|.dir$'
    let g:ctrlp_follow_symlinks=1          " Follow but ignore looped internal symlinks
    let g:ctrlp_map = '<c-p>'              " Default key mapping
    let g:ctrlp_match_window_bottom=1
    let g:ctrlp_match_window_reversed=0
    let g:ctrlp_max_height=15
    let g:ctrlp_mruf_max=500
    "}

    " plugin::vim-airline {
    let g:airline_powerline_fonts=1
    let g:airline_section_c = '%f'
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#syntastic#enabled = 1
    " }

    " plugin::SuperTab {
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabDefaultCompletionType="<C-X><C-O>"
    " }

    " plugin::OmniCppComplete {
    let OmniCpp_NamespaceSearch = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess = 1          " show access information ('+', '#', '-')
    let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
    let OmniCpp_MayCompleteDot = 1      " autocomplete after .
    let OmniCpp_MayCompleteArrow = 1    " autocomplete after ->
    let OmniCpp_MayCompleteScope = 1    " autocomplete after ::
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest,preview
    " }

    " plugin::neocomplcache {
    let g:neocomplcache_enable_at_startup=1
    let g:neocomplcache_enable_smart_case=1
    let g:neoComplcache_disableautocomplete=1
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplcache_min_syntax_length  = 4
    let g:neocomplcache_min_keyword_length = 4
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
    let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'
    if WINDOWS()
        let g:neocomplcache_dictionary_filetype_lists = { 
            \ 'default' : '', 
            \ 'php' : $VIM.'/raw/dict/php_funclist.txt',
            \ 'javascript' : $VIM.'/raw/dict/javascript.dict' 
            \ }
    else
        let g:neocomplcache_dictionary_filetype_lists = { 
            \ 'default' : '', 
            \ 'php' : $HOME.'/.vim/raw/dict/php_funclist.txt',
            \ 'javascript' : $HOME.'/.vim/raw/dict/javascript.dict' 
            \ }
    endif
    " }

    " plugin:: omni completion(optional) {
    autocmd FileType c setlocal omnifunc=ccomplete#Complete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " }

    " plugin::YouCompleteMe {
    let g:ycm_global_ycm_extra_conf = '~/.vim/raw/ycm_extra_conf.py'
    let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
    let g:ycm_min_num_of_chars_for_completion = 4
    let g:ycm_semantic_triggers =  {
        \ 'c' : ['->', '.'],
        \ 'objc' : ['->', '.'],
        \ 'cpp,objcpp' : ['->', '.', '::'],
        \ 'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
        \}
    " }

    " plugin::minibufexpl.vim {
    let g:miniBufExplMaxSize=1
    let g:miniBufExplMapCTabSwitchBufs=1
    let g:miniBufExplorerMoreThanOne=0

    " plugin::vim-javascript-syntax {
    "autocmd FileType javascript call JavaScriptFold()
    let javascript_enable_domhtmlcss=1
    "}

    " plugin::Pydiction {
    if WINDOWS()
        let g:pydiction_location = $VIM.'\vimfiles\bundle\Pydiction\complete-dict'
    else
        let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'
    endif
    let g:pydiction_menu_height = 10
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    " }

    " plugin::syntastic {
    "let g:syntastic_check_on_open=1
    let g:syntastic_enable_signs=1
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["python", "php", "javascript"], "passive_filetypes": ["html"]}
    let g:syntastic_php_checkers = ['php', 'phpmd']
    let g:syntastic_python_checkers = ['python', 'pyflakes', 'flake8']
    let g:syntastic_javascript_checkers = ['jshint']
    "}

    " plugin::vdebug {
    let g:vdebug_options = {
    \  "port" : 9000,
    \  "timeout" : 20,
    \  "break_on_open" : 0,
    \  "ide_key" : 'vim.xdebug'
    \}
    " }
" }

" Generate tags & cscope database for C/C++ {
function s:ctags_cpp()
    silent execute "!ctags -R -f tags --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.svn --exclude=.git ."
    if WINDOWS()
        silent execute "!dir /s /b *.h *.hpp *.c *.cpp *.cc > cscope.files"
    else
        silent execute "!find -L `pwd` -name '*.h' -o -name '*.hpp' -o -name '*.c' -o -name '*.cpp' -o -name '*.cc' > cscope.files"
    endif
    silent execute "!cscope -b"
endfunction
function s:ctags_c()
    call s:ctags_cpp()
endfunction
" }

" Generate tags & cscope database for PHP {
function s:ctags_php()
    silent execute "!ctags -R -f tags --languages=php --php-kinds=+cfv --langmap=PHP:+.inc --exclude=.svn --exclude=.git ."
    if WINDOWS()
        silent execute "!dir /s /b *.php > cscope.files"
    else
       silent execute "!find -L `pwd` -name '*.php' > cscope.files"
    endif
    silent execute "!cscope -b"
endfunction
" }

" Generate tags & cscope database for Python {
function s:ctags_py()
    silent execute "!ctags -R -f tags --languages=python --python-kinds=-iv --exclude=.svn --exclude=.git ."
    if WINDOWS()
        silent execute "!dir /s /b *.py > cscope.files"
    else
        silent execute "!find -L `pwd` -name '*.py' > cscope.files"
    endif
    silent execute "!cscope -b"
endfunction
" }

" Automatic ctags {
function CreateTags()
    " return root directory
    let s:old_cwd = fnamemodify(".", ":p:h")
    silent execute "cd " . g:project_root
    
    " check language for project
    if !exists('g:project_lang')
        let g:project_lang=expand('%:e')
    endif
    if (g:project_lang != "c" || g:project_lang != "cpp" || g:project_lang != "php" || g:project_root != "py")
        let g:project_lang = input("input project lang, e.g. c/cpp/php/py :", g:project_lang)
    endif
    
    echo "\rupdating..."
    call writefile([], './tags', 'b')
    if exists("*s:ctags_" . g:project_lang)
        execute 'call s:ctags_' . g:project_lang . '()'
    else
        execute "!ctags -R -f tags --exclude=.svn --exclude=.git ."
    endif
    silent execute "cd " . s:old_cwd
    echo "update tags finished !"
endfunction
" }

" Auto load tags & cscope database {
function LoadTags()
    " walk directory tree upto $HOME looking for tags,
    " note `;` sets the stop folder. `:h file-search`.
    execute 'set tags=./tags;"' . g:project_root . '"'
    autocmd FileType php execute "set tags+=~/.phptags"
    autocmd FileType python execute "set tags+=~/.pythontags"
    if filereadable("cscope.out")
        execute "cscope add cscope.out"
    endif
endfunction
silent execute "call LoadTags()"
" }

" Dictionary Completion, use C-X C-K {
function AddJavaScriptFuncList()
    set dictionary-=$VIM/raw/dict/javascript.dict dictionary+=$VIM/raw/dict/javascript.dict
    set complete-=k complete+=k
endfunction
"autocmd FileType javascript call AddJavaScriptFuncList()
function AddPHPFuncList()
    set dictionary-=$VIM/raw/dict/php_funclist.txt dictionary+=$VIM/raw/dict/php_funclist.txt
    set complete-=k complete+=k
endfunction
"autocmd FileType php call AddPHPFuncList()
" }

" Session {
let s:session_f = ".session.vim"
function! SaveSession()
    execute 'NERDTreeClose'
    execute "mksession! " . g:project_root . "/" . s:session_f
endfunction
function! LoadSession()
    execute "source " . g:project_root . "/" . s:session_f
endfunction
if filereadable(s:session_f)
    autocmd VimLeave * call SaveSession()
    autocmd VimEnter * nested call LoadSession()
endif
" }

" Addition Menu configuration {

if WINDOWS()
    if filereadable($VIM."/_vimrc_menu")
        execute "source ".$VIM."/_vimrc_menu"
    endif
else
    if filereadable(expand("~/.vim/_vimrc_menu"))
        execute "source ~/.vim/_vimrc_menu"
    endif
endif
" }

" Register function {
command! -nargs=* -complete=file CreateTags
    \ call CreateTags()
command! -nargs=* -complete=file LoadTags
    \ call LoadTags()
command! -nargs=* -complete=file SaveSession
    \ call SaveSession()
command! -nargs=* -complete=file LoadSession
    \ call LoadSession()
" }
