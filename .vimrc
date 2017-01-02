" Removes vi-compatibility (mandatory !)
set nocp

" Pathogen conf
filetype off
execute pathogen#infect()

" File types and coloration have to be set here
syntax on
filetype plugin on
filetype indent on

set langmenu=en_US.UTF-8 " sets the language of the menu (gvim)

syntax enable
set t_Co=256
set background=light
colorscheme primary

" Platform
let s:path = expand('<sfile>:p:h')
let s:config_path = s:path . '/.vim'
if has('win32') || has('win64')
	let g:PLATFORM = 'win'
elseif has('macunix') || system('uname -o') =~? '^darwin'
	let g:PLATFORM = 'mac'
elseif has('win32unix')
	let g:PLATFORM = 'cygwin'
else
	let g:PLATFORM = 'other'
endif

if has("gui_running") " GUI mode
	let &guicursor = &guicursor . ",a:blinkon0"
	set guioptions-=e "No gui-like tabs
	set guioptions-=T "No toolbar
	set guioptions-=m "No menubar
	set guioptions-=r "No scroolbar (right)
	set guioptions-=L "No scroolbar (left)
	set guioptions+=c "Console dialogs (no popup)
	"set guioptions+=a "Gui visual w/ mouse (yank to "*)

	if has("gui_gtk2")
		set guifont=Inconsolata\ 12
	elseif has("gui_macvim")
		set guifont=Menlo\ Regular:h11
	elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
	endif
elseif has('gui') " A terminal with GUI support
	set termencoding=utf-8
else
	set termencoding=utf-8
	if g:PLATFORM =~ "mac"
		set t_ZH=[3m t_ZR=[23m " Set the italics code
	endif
endif

" Status line
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Highlight current line, no underline/bold/whatnot
set cursorline

" Indentation and tabs
set autoindent "Indent (based on above line) when adding a line
if 1
	set tabstop=4 " Tab size
	set shiftwidth=4 " Size of tab when using << and >>
else
	set shiftwidth=4 " Number of spaces to be inserted for tabs
	set softtabstop=4 "See 4 spaces per tab
	set expandtab " Use spaces instead of tabs
endif

autocmd FileType py setlocal shiftwidth=4 tabstop=4

set shiftround
set nosmartindent "Cindent is better (it is set in ftplugin)
set cinkeys-=0# " Otherwise, it prevents '#' from being indented
set indentkeys-=0#

" Editing layout
set formatoptions+=ln "See :h 'formatoptions' :)
set backspace=start,indent,eol "Fix backspace
set linebreak "Break lines at words, not chars
set scrolloff=4 "When moving vertical, start scrolling 4 lines before reaching bottom
set modeline "Vim mini-confs near end of file
set modelines=5
if g:PLATFORM =~ "mac"
	set lcs+=space:·
endif

set listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:%
let g:indentLine_leadingSpaceEnabled=1
set list
set fileformats+=mac
set nojoinspaces
:autocmd InsertEnter,InsertLeave * set cul!

" Search
set wrapscan "Continue to top after reaching bottom
set hlsearch "Highlight search
set incsearch "See results of search step by step
set ignorecase
set smartcase "Do not ignore case if there is a MAJ in pattern

" Parenthesis
set showmatch "Parenthesis matches
set matchtime=2 "Show new matching parenthesis for 2/10th of sec

" System
set vb t_vb="" "Removes the Fucking Bell Of Death...
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=
set history=1024 "Memorize 1024 last commands
set updatetime=1000 "Update swap (and showmark plugin) every 1 sec

" Windows and buffers
set splitright " Vsplit at right
set previewheight=8 "Height of preview menu (Omni-completion)
set hidden "To move between buffers without writing them.  Don't :q! or :qa! frivolously!

" Command mode options
set wildmenu "Completions view in ex mode (super useful !)
set wildmode=list:longest,full
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.ps,*.pdf,*.cmo,*.cmi,*.cmx "Don't complete bin files
set cmdheight=1 "Command line height
set laststatus=2 "When to show status line (2=always)
set ruler "Show line,col in statusbar
set number "Show lines
set showcmd "Show beginning of normal commands (try d and see at bottom-right)

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.job

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" A good trick to take the hjkl-use habit
" nmap <left> :echo "Left is 'h' !"<cr>
" nmap <down> :echo "Down is 'j' !"<cr>
" nmap <up> :echo "Up is 'k' !"<cr>
" nmap <right> :echo "Right is 'l' !"<cr>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType cmake            let b:comment_leader = '# '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


