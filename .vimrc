set nocompatible " must be first line

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after,$HOME/.vim/bundle/ctrlp.vim
        endif
    " }
"if version>=700

"execute pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#incubate()
"call pathogen#helptags()


" just for practice
"noremap hh <NOP>
"noremap jj <NOP>
"noremap kk <NOP>
"noremap ll <NOP>

"endif
"filetype off
"filetype plugin indent on

	syntax on                                           " syntax highlighting

	set t_Co=256
	set background=dark
	"color molokai                                      " load a colorscheme
	color molokai_jeq                                   " load a colorscheme
	                                                    " colorscheme Benokai
	let term=$TERM
	set encoding=utf-8
	set termencoding=utf-8
	scriptencoding utf-8
	set ruler                                           " show the ruler
	set showcmd                                         " show partial commands in status line and  selected characters/lines in visual mode
	set showmode                                        " display the current mode
	set laststatus=2

	set nu
	set mouse=a                                         " automatically enable mouse usage
	set shortmess+=filmnrxoOtT                          " abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash     " better unix / windows compatibility
	"set virtualedit=onemore                            " allow for cursor beyond last character
	set history=100                                     " Store a ton of history (default is 20)
	set lazyredraw                                      " don't redraw while executing macros (good performance)
	set showmatch                                       " show matching brackets/parenthesis
	syn match Braces display '[{}()\[\]]'
	hi MatchParen cterm=none ctermbg=green ctermfg=blue


	set backspace=indent,eol,start                      " backspace for dummys
	set linespace=0                                     " No extra spaces between rows
	set undolevels=20                                   " maximum number of changes that can be undone

	"set mat=2                                          " how many tenths of a second to blink when matching brackets
	set incsearch                                       " find as you type search
	"set hlsearch                                       " highlight search terms
	set winminheight=0                                  " windows can be 0 line high
	set ignorecase                                      " case insensitive search
	set smartcase                                       " case sensitive when uc present
	set wildmenu                                        " show list instead of just completing
	set wildmode=list:longest,full                      " command <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]                       " backspace and cursor keys wrap to
	set scrolljump=5                                    " lines to scroll when cursor leaves screen
	set scrolloff=3                                     " minimum lines to keep above and below cursor
	set foldenable                                      " auto fold code
	"set gdefault                                       " the /g flag on :s substitutions by default

	" view whitespace
	highlight NonText guifg=#4a4a59 " color list tab
	highlight SpecialKey guifg=#4a4a59 " color list eol

	autocmd FileType * setlocal formatoptions-=ro " turn off auto comment feature

	set hidden
	set ttyfast
	"set visualbell
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500
	set timeout timeoutlen=1000 ttimeoutlen=10
" }

" Formatting {
	set wrap                         " wrap long lines
	set textwidth=79
	set formatoptions=qrn1
	set autoindent                   " indent at the same level of the previous line
	set smartindent
	set shiftwidth=4                 " use indents of 4 spaces
	"set expandtab                   " tabs are spaces, not tabs
	set tabstop=4                    " an indentation every four columns
	set softtabstop=4                " let backspace delete indent
	"set matchpairs+=<:>             " match, to be used with %
	set comments=sl:/*,mb:*,elx:*/   " auto format comment blocks
	set backup                       " backups are nice ...
	set backupdir=$HOME/.vimbackup// " but not when they clog .
	set directory=$HOME/.vimswap//   " Same for swap files
	set viewdir=$HOME/.vimviews//    " same for view files
	" Remove trailing whitespaces and ^M chars
	"autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
	"autocmd FileType qf wincmd J
" }

" Key (re)Mappings {
	nnoremap <F2> :set invpaste paste?<CR>
	set pastetoggle=<F2>
	"nnoremap <F8> :setl noai nocin nosi inde=<CR>

	" change leader from defaut ('\') to ','
	let mapleader = ','

	" change CWD to directory of current file
	"nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
	nnoremap <leader>cd :cd <C-R>=expand("%:p:h") . "/" <CR>
	cnoremap .. <esc>:cd ..<CR>:cd <C-R>=expand("`pwd`")<CR>

	" buffer manipulation
	"nmap <silent> <leader>bd :bp<bar>bd#<CR>  " delete buffer without closing window
	nmap <silent> <leader>bd :bn<CR>:bd#<CR>
	nmap <silent> <leader>bb :b#<CR>
	nmap <silent> <leader>bn :bn<CR>
	nmap <silent> <leader>bp :bp<CR>
	nmap <silent> <leader>bh :hide<CR>
	nmap <silent> <leader>bo :only<CR>
	nnoremap <silent> <leader>bv :vsp#<CR><C-w>R<C-w>w
	nnoremap <silent> <leader>bc :vsp%<CR><C-w>R<C-w>w
	nmap <silent> <leader>br <C-w>R

	" window manipulation
	nmap <leader>wh <C-w>H
	nmap <leader>wj <C-w>J
	nmap <leader>wk <C-w>K
	nmap <leader>wl <C-w>L
	nmap <leader>wo <C-w>o
	nmap <leader>ws <C-w>s
	nmap <leader>wv <C-w>v
	nmap <leader>wc <C-w>c
	nmap <leader>wr <C-w>R
	nmap <leader>wt <C-w>T
	nmap <leader>ww <C-w>|
	nmap <leader>we <C-w>=

	" quickfix open/close
	nmap <silent> <leader>qo :copen<CR><C-w>J
	nmap <silent> <leader>qc :cclose<CR>
	nmap <silent> <leader>qq :cexpr[]<CR>
	nmap <silent> [q :cprevious<CR>zz
	nmap <silent> ]q :cnext<CR>zz
	nmap <silent> [Q :cfirst<CR>
	nmap <silent> ]Q :clast<CR>
	autocmd! QuickfixCmdPost * call SortQuickfix('QfStrCmp')
	function! SortQuickfix(fn)
		call setqflist(sort(getqflist(), a:fn))
	endfunction
	function! QfStrCmp(e1, e2)
		let [t1, t2] = [a:e1.text, a:e2.text]
		return t1 <# t2 ? -1 : t1 ==# t2 ? 0 : 1
	endfunction

	" location open/close
	nmap <silent> <leader>lo :lopen<CR><C-w>J
	nmap <silent> <leader>lc :lclose<CR>
	nmap <silent> [l :lprevious<CR>zz
	nmap <silent> ]l :lnext<CR>zz
	nmap <silent> [L :lfirst<CR>
	nmap <silent> ]L :llast<CR>

	" allow deleting selection without updating the clipboard (yank buffer)
	nnoremap x "_x
	nnoremap X "_X
	vnoremap x "_x
	vnoremap X "_X

	" in visual mode paste from the yank only register (0)
	vnoremap p "0p
	"vnoremap p "_dP

	" exit insert mode and move up/down
	inoremap jj <esc>j
	inoremap kk <esc>k

	" line shifting
	"nnoremap <CR> i<CR><Esc>^
	"nnoremap <leader><CR> A<CR><Esc>^
	nnoremap <leader><CR> i<CR><Esc>^
	nnoremap <leader>o m`o<Esc>``
	nnoremap <leader>O m`O<Esc>``

	" search and replace word under cursor
	nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

	" done by vim-tmux-navigator plugin
	" Easier moving in tabs and windows
	"map <C-j> <C-w>j
	"map <C-k> <C-w>k
	"map <C-l> <C-w>l
	"map <C-h> <C-w>h

	" Wrapped lines goes down/up to next row, rather than next line in file.
	nnoremap j gj
	nnoremap k gk

	" deactivate arrow keys
	nnoremap <up>     <nop>
	nnoremap <down>   <nop>
	nnoremap <left>   <nop>
	nnoremap <right>  <nop>
	inoremap <up>     <nop>
	inoremap <down>   <nop>
	inoremap <left>   <nop>
	inoremap <right>  <nop>

	" visual shifting (does not exit Visual mode)
	vnoremap < <gv
	vnoremap > >gv

	" search related maps
	nnoremap / /\v
	vnoremap / /\v
	nnoremap <leader><space> :noh<cr>
	nmap n nzz
	nmap N Nzz

	" tab is connected to C-i; so it over-rides default C-i 
	"nnoremap <tab>  " tab is connected to C-i; so it over-rides default C-i%
	"vnoremap <tab> %
	nnoremap <leader>V V`]

	" quickly edit common files
	"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
	nnoremap <leader>ev <C-w><C-v><C-l>:e $HOME/.vimrc<cr>
	nnoremap <leader>et <C-w><C-v><C-l>:e $HOME/.vim/.vim_tips<cr>

	" quick c comments
	inoremap <Leader><Leader>c           /**/<Left><Left>
	inoremap <Leader><Leader>c<Space>    /*<Space><Space>*/<Left><Left><Left>
	inoremap <Leader><Leader>c<CR>       /*<CR>*/<Esc>O
	nnoremap <Leader><Leader>cO           O/**/<Left><Left>
	nnoremap <Leader><Leader>cO<Space>    O/*<Space><Space>*/<Left><Left><Left>
	nnoremap <Leader><Leader>cA           A<tab>/**/<Left><Left>
	nnoremap <Leader><Leader>cA<Space>    A<tab>/*<Space><Space>*/<Left><Left><Left>

	" Shortcut to rapidly toggle `set list`
	nmap <leader>ll :set list!<CR>

	if has("gui_running")
		set guioptions-=m  "remove menu bar"
		set guioptions-=T  "remove tool bar"
		set guioptions+=LlRrb  "remove menu bar"
		set guioptions-=LlRrb  "remove menu bar"
		nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

		set t_Co=256
	endif

if version>=700

	set cursorline                              " highlight current line
	set list
	set listchars=tab:▸\ ,eol:¬,nbsp:.,trail:.,extends:# 

	" Catch the transition to diff mode
	au FilterWritePre * if &diff | exe 'noremap ]c ]cz.' | exe 'noremap [c [cz.' | endif
	au FilterWritePre * if &diff | exe 'set diffopt+=filler,iwhite,context:3' | exe 'execute "normal \<c-w>\<c-w>"' | endif

	"set diffexpr=MyDiff()
	"function MyDiff()
		"let opt = ""
		"if &diffopt =~ "icase"
			"let opt = opt . "-i "
		"endif
		"if &diffopt =~ "iwhite"
			"let opt = opt . "-w -B "
		"endif
		"silent execute "!diff -a --binary " . opt .
					"\ v:fname_in . " " . v:fname_new . " > " . v:fname_out
	"endfunction


	" Setting up the directories {
		if version>=703
			set undofile                                " so is persistent undo ...
			"set undoreload=10000                        " maximum number lines to save for undo on a buffer reload
			set undodir=$HOME/.vimundo//                " but not when they clog .
		endif
	" Moved to function at bottom of the file

		au BufWinLeave * silent! mkview             " make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview           " make vim load view (state) (folds, cursor, etc)
	" }

	" Vim UI {
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
	"}

	" *********************************************
	" **************** PLUGINS ********************
	" *********************************************

	" grep.vim {
		nmap <leader>gr :Rgrep<CR>
	" }

	" omnicomplte {
		set omnifunc=syntaxcomplete#Complete
	" }

	" tagbar {
		let g:tagbar_autofocus   = 1
		let g:tagbar_autoclose   = 1
		let g:tagbar_autoshowtag = 1
		nnoremap <leader>tt :TagbarToggle<CR>
		let g:tagbar_type_cpp = {
			\ 'kinds' : [
				\ 'd:macros:1',
				\ 'g:enums',
				\ 't:typedefs:0:0',
				\ 'e:enumerators:0:0',
				\ 'n:namespaces',
				\ 's:structs',
				\ 'u:unions',
				\ 'f:functions',
				\ 'm:members:0:0',
				\ 'v:variables:0:0'
			\ ]
		\ }
		"highlight TagbarScope guifg=Blue ctermfg=Blue
		"highlight TagbarHighlight guifg=#A6E22E ctermfg=118 guibg=#008700
		highlight TagbarHighlight term=bold ctermfg=22 ctermbg=148 gui=bold guifg=#005f00 guibg=#afd700
		"highlight TagbarAccessPublic guifg=Red ctermfg=Red
		highlight TagbarSignature term=bold ctermfg=245 gui=italic guifg=#4a4a59

		function! ToggleSwitchTagbar()
			let w:jumpbacktohere = 1
			let tagbar_open = bufwinnr('__Tagbar__') != -1

			if tagbar_open
				execute window bufwinnr('__Tagbar__')
			else
				TagbarOpen
			endif
			
			"for window in range(1, winnr('$'))
				"execute window . 
				"if exists
					"unlet w:jumpbacktohere
					"break
				"endif
			"endfor
		endfunction

		nnoremap <leader>ts :call ToggleSwitchTagbar()<CR>

	" }

	" easytags {
		"filetype plugin on
		""let g:easytags_file = '~/projects/sc/tags'
		"let g:easytags_file = '~/.vimtags'
		"set tags=~/projects/sc/tags;~/.vimtags
		"let g:loaded_easytags = 1 " disable for now (1)
		let g:easytags_updatetime_warn = 0 " disable update time warning
		"set tags=./.tags;,~/projects/sc/tags,~/.vimtags
		nnoremap <leader>tu :UpdateTags<cr>
		nnoremap <leader>th :HighlightTags<cr>
		let g:easytags_updatetime_min = 15000
		let g:easytags_resolve_links = 1
		let g:easytags_by_filetype = "~/.vimtags_filetypes/"
		let g:easytags_cmd = "/usr/bin/ctags"
		let g:easytags_include_members = 1
		"let g:easytags_dynamic_files = 1
	"" }

	" easymotion {
		"let g:EasyMotion_leader_key = '<Leader>'
	" }

	let g:ctags_path='~/.vimtags'
	let g:ctags_statusline=1
	let g:ctags_title=1
	let g:ctags_regenerate = 0

	" cscope {
		if has("cscope")

			""""""""""""" standard cscope/vim boilerplate

			" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
			set cscopetag

			" check cscope for definition of a symbol before checking ctags: set to 1
			" if you want the reverse search order.
			set csto=0

			" always search cscope databases as well as tag files
			set cst

			" add any cscope database in current directory
			"if filereadable("cscope.out")
				"cs add cscope.out  
			"" else add the database pointed to by environment variable 
			"elseif $cscope_db != ""
				"cs add $cscope_db
			"endif

			" show msg when any other cscope db added
			set cscopeverbose
			set cscopequickfix=g+,s+,t+

			"   's'   symbol: find all references to the token under cursor
			"   'g'   global: find global definition(s) of the token under cursor
			"   'c'   calls:  find all calls to the function name under cursor
			"   't'   text:   find all instances of the text under cursor
			"   'e'   egrep:  egrep search for the word under cursor
			"   'f'   file:   open the filename under cursor
			"   'i'   includes: find files that include the filename under cursor
			"   'd'   called: find functions called by the function under cursor
			"nmap <leader>ss :cs find s <c-r>=expand("<cword>")<cr><cr>  
			"nmap <leader>ss /<c-r>=expand("<cword>")<cr><cr>:cs find s <c-r>=expand("<cword>")<cr><cr>
			nmap <leader>ss /<c-r>=expand("<cword>")<cr><cr>:cs find s <c-r>=expand("<cword>")<cr><cr>
			nmap <leader>sg :cs find g <c-r>=expand("<cword>")<cr><cr>  
			nmap <leader>sc :cs find c <c-r>=expand("<cword>")<cr><cr>  
			nmap <leader>st :cs find t <c-r>=expand("<cword>")<cr><cr>  
			nmap <leader>se :cs find e <c-r>=expand("<cword>")<cr><cr>  
			nmap <leader>sf :cs find f <c-r>=expand("<cfile>")<cr><cr>  
			nmap <leader>si :cs find i ^<c-r>=expand("<cfile>")<cr>$<cr>
			nmap <leader>sd :cs find d <c-r>=expand("<cword>")<cr><cr> 
			"nmap <leader># :vimgrep /<c-r>=expand("<cword>")<cr>/g %<cr>  
			nmap <leader># :vimgrep /<c-r>//gj %<cr>  

		   " nmap <leader>su :exe "!find " fnamemodify('.',':p') " -name '*.c' -o -name '*.h' >> ~/projects/sc/cscope.files"<CR>
		   "                \:!cscope -b -q -R -i ~/projects/sc/cscope.files -f ~/projects/sc/cscope.out<CR>
		   "                \:cs reset<CR>
			nmap <leader>su :!cscope -b -q -R -i ~/projects/sc/cscope.files -f ~/projects/sc/cscope.out<CR>
						   \:cs reset<CR>
			nmap <leader>sa :cscope add ~/projects/sc/cscope.out<cr> 
		endif
	" }

	" cctree {
			let g:CCTreeUseUTF8Symbols=1
			let g:CCTreeEnhancedSymbolProcessing=1
			"let g:CCTreeKeyCompressTree="oo"
			"let g:CCTreeKeyCompressTree="o"
			let g:CCTreeKeyCompressTree="x"
			nmap <silent> <leader>aa :CCTreeWindowToggle<cr>
			nmap <silent> <leader>af :CCTreeTraceForward<cr><cr>
			nmap <silent> <leader>ar :CCTreeTraceReverse<cr><cr>
			nmap <silent> <leader>aj :CCTreeRecurseDepthPlus<cr>
			nmap <silent> <leader>ak :CCTreeRecurseDepthMinus<cr>
			nmap <silent> <leader>al :CCTreeLoadDB $CSCOPE_DB<cr>
			nmap <silent> <leader>ax :CCTreeLoadXRefDB ~/projects/sc/xref.out<cr>
			nmap <silent> <leader>as :CCTreeSaveXRefDB ~/projects/sc/xref.out<cr>
			"let g:CCTreeRecurseDepthPlus='o'
			"let g:CCTreeRecurseDepthMinus='x'
	" }

	" yankring {
		"let g:yankring_replace_n_pkey = '<leader>yp'
		"let g:yankring_replace_n_nkey = '<leader>yn'
	" }

	" taghighlight {
		if ! exists('g:TagHighlightSettings')
			let g:TagHighlightSettings = {}
		endif
		let g:TagHighlightSettings['TagFileDirectory'] = '/home/jquis/'
		let g:TagHighlightSettings['TagFileName'] = '.vimtags'
		let g:TagHighlightSettings['CtagsExecutable'] = 'ctags'
		let g:TagHighlightSettings['CscopeFileDirectory'] = '/home/jquis/project/sc/'
		let g:TagHighlightSettings['CscopeFileName'] = 'cscope.out'
	" }

	" ctrlp {
		noremap <c-p> :CtrlP<cr>
		noremap <leader>pp :CtrlPMRUFiles<cr>
		"noremap <leader>pb :ctrlpbookmarkdir<cr>
		noremap <leader><c-p> :CtrlPBookmarkDir<cr>
		noremap <leader>tp :CtrlPTag<cr>
		noremap <leader>tl :let g:ctrlp_default_input = expand('')<cr>:CtrlPBufTag<cr>
		noremap <leader>Tl :let g:ctrlp_default_input = expand('')<cr>:CtrlPTag<cr>
		noremap <leader>bl :CtrlPBuffer<cr>
		"nn <silent> <leader>qq :let g:ctrlp_default_input = expand('<cword>')<cr>:CtrlPBufTag<cr>
		"nn <silent> <leader>qq :let g:ctrlp_default_input = expand('<cword>')<cr>:CtrlPBufTag<cr>:let g:ctrlp_default_input = expand('')<cr>
		"nn <silent> <leader>qa :let g:ctrlp_default_input = expand('<cword>')<cr>:CtrlPTag<cr>
		"nn <silent> <leader>q<space> :let g:ctrlp_default_input = expand('')<cr>

		let g:ctrlp_match_window_bottom = 0
		let g:ctrlp_match_window_reversed = 0
		let g:ctrlp_by_filename = 1  " 1- search by filename, 0- search by path
		let g:ctrlp_open_multiple_files = 'ij'
		let g:ctrlp_arg_map = 1
		let g:ctrlp_working_path_mode = 'wr'
	" }

	" nerdtree {
		"set autochdir
		"let nerdtreechdirmode=2
		"map <c-e> :nerdtree .<cr>
		map <silent> <c-e> :NERDTreeToggle<cr>:NERDTreeMirror<cr>
		map <leader>e :NERDTreeFind<cr>

		let nerdtreeshowbookmarks=1
		let nerdtreeignore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
		let nerdtreechdirmode=0
		let NERDTreeQuitOnOpen=1
		let nerdtreeshowhidden=1
		let nerdtreekeeptreeinnewtab=1
		let g:nerdtreedirarrows=1
	" }

	" fuzzyfinder {
		nmap <leader>ff :FufFile **/<cr>
		nmap <leader>ft :FufTag<cr>
		nmap <leader>ft :FufTagWithCursorWord<cr>
		nmap <leader>fb :FufBuffer<cr>
		nmap <leader>fB :FufBookmarkDir<cr>
		nmap <leader>fl :FufLine<cr>
		nmap <leader>fr :FufRenewCache<cr>
	" }

	" powerline {
		"let g:powerline_symbols = 'fancy'
	" }

	" airline {
		let g:airline_powerline_fonts = 1
		let g:airline#extensions#whitespace#show_message=0
		let g:airline_theme='badwolf'
	" }

	" tmuxline {
		"let g:tmuxline_preset='tmux'
	" }

	" goldenview 
		let g:goldenview__enable_default_mapping = 0
		nmap <silent> <leader>vs <plug>goldenviewsplit
		nmap <silent> <leader>vn <plug>goldenviewnext
		nmap <silent> <leader>vp <plug>goldenviewprevious
		nmap <silent> <leader>vm <plug>goldenviewswitchmain
		nmap <silent> <leader>vt <plug>goldenviewswitchtoggle
		nmap <silent> <leader>vl <plug>goldenviewswitchwithlargest
	" }

	" rainbow parentheses
		"let g:rbpt_colorpairs = [
			"\ ['brown',       'royalblue3'],
			"\ ['darkblue',    'seagreen3'],
			"\ ['darkgray',    'darkorchid3'],
			"\ ['darkgreen',   'firebrick3'],
			"\ ['darkcyan',    'royalblue3'],
			"\ ['darkred',     'seagreen3'],
			"\ ['darkmagenta', 'darkorchid3'],
			"\ ['brown',       'firebrick3'],
			"\ ['gray',        'royalblue3'],
			"\ ['black',       'seagreen3'],
			"\ ['darkmagenta', 'darkorchid3'],
			"\ ['darkblue',    'firebrick3'],
			"\ ['darkgreen',   'royalblue3'],
			"\ ['darkcyan',    'seagreen3'],
			"\ ['darkred',     'darkorchid3'],
			"\ ['red',         'orange'],
			"\ ]
			"\ ['red',         'firebrick3'],
		let g:rbpt_colorpairs = [
			\ ['173',        '#458588'],
			\ ['yellow',     '#cc241d'],
			\ ['lightblue',  '#d65d0e'],
			\ ['darkgreen',  '#b16286'],
			\ ]
		let g:rbpt_max = 16
		let g:rbpt_loadcmd_toggle = 0
		au vimenter * RainbowParenthesesToggle
		au syntax * RainbowParenthesesLoadRound
		au syntax * RainbowParenthesesLoadSquare
		au syntax * RainbowParenthesesLoadBraces
	" }

	" sessions {
		let g:session_autosave = 'no'
		let g:session_autoload = 'no'
	" }
endif
    
autocmd BufRead *.log source ~/.vim/log.vim

" Setup Bundle Support {
	filetype off
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	"call vundle#rc()
	Plugin 'gmarik/Vundle.vim'

	" Plugins
	Plugin 'scrooloose/nerdtree'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'xolox/vim-easytags'
	Plugin 'xolox/vim-misc'
	"Plugin 'zhaocai/GoldenView.vim'
	Plugin 'bling/vim-airline'
	Plugin 'kien/ctrlp.vim'
	Plugin 'kien/rainbow_parentheses.vim'
	Plugin 'majutsushi/tagbar'
	Plugin 'L9'
	Plugin 'FuzzyFinder'
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
	Plugin 'godlygeek/tabular'

	Plugin 'christoomey/vim-tmux-navigator'
	Plugin 'benjaminwhite/Benokai'
	""Bundle 'edkolev/tmuxline.vim'

	call vundle#end()
	filetype plugin indent on
" }
