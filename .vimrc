" Environment {
    " Basics {
        set nocompatible " must be first line
        set background=dark " Assume a dark background
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Setup Bundle Support {
        execute pathogen#infect()
        filetype off

    " The next two lines ensure that the ~/.vim/bundle/ system works
        runtime! autoload/pathogen.vim
        silent! call pathogen#helptags()
        silent! call pathogen#runtime_append_all_bundles()
    " }
        filetype plugin indent on

" }

" General {
    set background=dark               " Assume a dark background
    if has('gui_running') && has('win32')
        au GUIEnter * simalt ~x     " open maximized "
        set guioptions-=m           " remove menu "
        set guioptions-=T           " remove toolbar "
    endif
    if !has('win32') && !has('win64')
        set term=$TERM                " Make arrow and other keys work
    endif
    filetype plugin indent on         " Automatically detect file types.
    syntax on                         " syntax highlighting
    set mouse=a                       " automatically enable mouse usage
    "set autochdir " always switch to the current file directory.. Messes with some plugins, best left commented out
    " not every vim is compiled with this, use the following line instead
    " If you use command-t plugin, it conflicts with this, comment it out.
    "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    scriptencoding UTF-8
    set encoding=UTF-8

    " set autowrite                                            " automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT                      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore                         " allow for cursor beyond last character
    set history=1000                                " Store a ton of history (default is 20)
    " set spell                                                " spell checking on

    " Setting up the directories {
        set backup                                  " backups are nice ...
        set undolevels=1000                         " maximum number of changes that can be undone
        if version>=703
            set undofile                                " so is persistent undo ...
            set undoreload=10000                        " maximum number lines to save for undo on a buffer reload
        endif
    " Moved to function at bottom of the file
        " set backupdir=$HOME/.vimbackup//                         " but not when they clog .
        " set directory=$HOME/.vimswap//                           " Same for swap files
        " set viewdir=$HOME/.vimviews//                            " same for view files

        " Creating directories if they don't exist
        " silent execute '!mkdir -p $HVOME/.vimbackup'
        " silent execute '!mkdir -p $HOME/.vimswap'
        " silent execute '!mkdir -p $HOME/.vimviews'
        au BufWinLeave * silent! mkview             " make vim save view (state) (folds, cursor, etc)
        au BufWinEnter * silent! loadview           " make vim load view (state) (folds, cursor, etc)
    " }
" }

" Vim UI {
    color molokai                               " load a colorscheme
    set tabpagemax=15                           " only show 15 tabs
    set showmode                                " display the current mode

    set cursorline                              " highlight current line
    "hi cursorline guibg=#333333                " highlight bg color of current line
    "hi CursorColumn guibg=#333333              " highlight cursor

    if has('cmdline_info')
        set ruler                                          " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                                        " show partial commands in status line and  selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                    " Filename
        set statusline+=%w%h%m%r                " Options
        set statusline+=\ [%{&ff}/%Y]           " filetype
        set statusline+=\ [%{getcwd()}]         " current dir
        "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
    endif

    set backspace=indent,eol,start              " backspace for dummys
    set linespace=0                             " No extra spaces between rows
    if version>=703
        set rnu                                      " Line numbers on
        au FocusLost * :set number                  " set to absolute number when focus is lost
        au FocusGained * :set relativenumber        " set to relative number when focus is gained
        autocmd InsertEnter * :set number           " set to absolute number in insert mode
        autocmd InsertLeave * :set relativenumber   " set to relative mode when leaving insert mode
        set colorcolumn=85
    else
        set nu
    endif
    set showmatch                               " show matching brackets/parenthesis
    set incsearch                               " find as you type search
    set hlsearch                                " highlight search terms
    set winminheight=0                          " windows can be 0 line high
    set ignorecase                              " case insensitive search
    set smartcase                               " case sensitive when uc present
    set wildmenu                                " show list instead of just completing
    set wildmode=list:longest,full              " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]               " backspace and cursor keys wrap to
    set scrolljump=5                            " lines to scroll when cursor leaves screen
    set scrolloff=3                             " minimum lines to keep above and below cursor
    set foldenable                              " auto fold code
    set gdefault                                " the /g flag on :s substitutions by default
    set list
    set listchars=tab:\|\ ,eol:¬,trail:.,extends:#,nbsp:. " Highlight problematic whitespace
    "set listchars=tab:>.,eol:¬,trail:ṁ,extends:#,nbsp:. " Highlight problematic whitespace

    set hidden
    set visualbell
    set ttyfast
    "set makeprg
" }

" Formatting {
    set wrap                              " wrap long lines
    set textwidth=79
    set formatoptions=qrn1
    set autoindent                          " indent at the same level of the previous line
    set shiftwidth=4                        " use indents of 4 spaces
    set expandtab                           " tabs are spaces, not tabs
    set tabstop=4                           " an indentation every four columns
    set softtabstop=4                       " let backspace delete indent
    "set matchpairs+=<:>                    " match, to be used with %
    set pastetoggle=<F12>                   " pastetoggle (sane indentation on pastes)
    set comments=sl:/*,mb:*,elx:*/         " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }

" Key (re)Mappings {

  "The default leader is '\', but many people prefer ',' as it's in a standard
  "location
  let mapleader = ','

  " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
      nnoremap ; :

  " Easier moving in tabs and windows
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

  "map <f5> :make | copen

  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

  " Wrapped lines goes down/up to next row, rather than next line in file.
  nnoremap j gj
  nnoremap k gk

  " visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv     

  nnoremap / /\v
  vnoremap / /\v
  nnoremap <leader><space> :noh<cr>
  nnoremap <tab> %
  vnoremap <tab> %
  nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>    " open ~/.vimrc file
  nnoremap <leader>v V`]

  inoremap <Leader><Leader>c           /**/<Left><Left>
  inoremap <Leader><Leader>c<Space>    /*<Space><Space>*/<Left><Left><Left>
  inoremap <Leader><Leader>c<CR>       /*<CR>*/<Esc>O
  nnoremap <Leader><Leader>cO           O/**/<Left><Left>
  nnoremap <Leader><Leader>cO<Space>    O/*<Space><Space>*/<Left><Left><Left>
  nnoremap <Leader><Leader>cA           A<tab>/**/<Left><Left>
  nnoremap <Leader><Leader>cA<Space>    A<tab>/*<Space><Space>*/<Left><Left><Left>

  function! ConditionalPairMap(open, close)
      let line = getline('.')
      let col = col('.')
      if col < col('$') || stridx(line, a:close, col+1) != -1
          return a:open
      else
          return a:open . a:close . repeat("\<left>", len(a:close))
      endif
  endf
"}

" NerdTree {
  map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
  map <leader>e :NERDTreeFind<CR>
  nmap <leader>nt :NERDTreeFind<CR>

  let NERDTreeShowBookmarks=1
  let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
  let NERDTreeChDirMode=0
  let NERDTreeQuitOnOpen=1
  let NERDTreeShowHidden=1
  let NERDTreeKeepTreeInNewTab=1
  let g:NERDTreeDirArrows=0
" }

" FuzzyFinder {
  nmap <leader>ff :FufFile **/<CR>
  nmap <leader>ft :FufFile<CR>
  nmap <leader>fb :FufBuffer<CR>
  nmap <leader>fl :FufLine<CR>
  nmap <leader>fr :FufRenewCache<CR>
" }

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    if version>=703
        let dir_list = {
            \ 'backup': 'backupdir',
            \ 'views': 'viewdir',
            \ 'swap': 'directory',
            \ 'undo': 'undodir' }
    else
        let dir_list = {
            \ 'backup': 'backupdir',
            \ 'views': 'viewdir',
            \ 'swap': 'directory'}
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
