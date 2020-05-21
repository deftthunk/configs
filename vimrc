" code syntax highlighting
syntax on

" tab size measured in number of spaces
set ts=2

" insert space characters whenever the tab key is pressed
" after the 'expandtab' option is set, all the new tab characters
" entered will be changed to spaces
" this will not affect existing tab characters. to change all the
" existing tab characters to match the current tab settings, use ':retab'
"set noexpandtab
"retab

" control the number of space characters that will be inserted when
" the tab key is pressed
set tabstop=2

" number of space characters inserted for indentation
set shiftwidth=2

" line numbering
set number

" enable auto-indenting
set autoindent

" enable vim commandline completion (ie. :color <TAB>)
set wildmenu

" search result highlighting
set hlsearch

" make searches ignore case by default
set ignorecase

" be case sensitive in search if any caps are used in pattern
set smartcase

" show match(s) as search proceeds
set incsearch

" file ruler w/ current line info, cursor location, etc
set ruler

" draw horizontal line to always show where cursor is in file
"set cursorline

" auto-finds, highlights, and briefly jumps to the matching brace
set showmatch

" always keep 'x' number of lines at top or bottom of screen when scrolling
set scrolloff=4

" enable the 'filetype' feature in vim
filetype plugin on

" auto-indent based on knowledge of file extension
filetype indent on
au FileType python setl sw=2 sts=2 et

"----------------------------------------------------------------------------
" 'advanced' features, plugins, external dependencies:
"----------------------------------------------------------------------------

" Vim's OMNI code completion feature along w/ the SyntaxComplete plugin
set omnifunc=syntaxcomplete#Complete

" below will enable realitme pattern highlighting for similar words
" to what the cursor is over
" it is not currently language specific, so matches on all words, strings, etc
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"----------------------------------------------------------------------------
" key mappings:
"----------------------------------------------------------------------------

" below maps the sequence 'jk' (typed quickly in 'Insert Mode') to ESCAPE
:imap jk <ESC>


"----------------------------------------------------------------------------
" notes/reminders:
"----------------------------------------------------------------------------

" #1 baseic insert commands:
"	'a'		start insert mode one character right of the cursor
"	'A'		start insert mode at end of line
"	'o'		start insert mode on new line below current (inserts new line)
"	'O'		start insert mode on new line above current (inserts new line)
"	'i'		start insert mode at current cursor position
"	'I'		start insert mode at beginning of current line
"
" #2 text removal commands:
" 	'yy'	yanks a whole new line
" 	'p'		paste below cursor
" 	'P'		paste above cursor
" 	'dd'	deletes entire current line
" 	'd$'	delete from cursor to end of line (think regex EOL anchor)
" 	'd^'	delete from cursor to beginning of line (think regex anchor)
" 	'u'		undo last change
" 	'U'		redo last change (un-undo; restore)
"
" #3 '*' highlights all instances of the word under the cursor
" 	 ':nohl' removes the highlighting. see also the ':autocmd' line
" 	 above for realtime highlighting
"
" #4 to jump to a specific line (ex. line 41)
" 	'41G' or '41gg' or ':41<CR>'
"
" #5 ':/' pattern search (forwards); use 'n' (next) to step through matches
" 	 ':?' pattern search (backwards); use 'n' (next) to step through matches
"
" #6 search and replace command (search/replace == regex patterns)
" 	'%s/search/replace/g'
"
" #7 'yanked' data is put into the '"0' register (ie. '"0p' pastes
"	 from '"0' register)
"
" #8 'CTRL-X CTRL-O brings up the omni syntax completion menu, and 
" 	 'CTRL-N' and 'CTRL-P' scroll through the dialog (next/previous)
"
" #9 ':reg' shows all registers
"
" #10 to bring the current line to the center (or top or bottom) of the screen
" 'zt' (top); 		'z.' (middle);		'zb' (bottom)
"
" #11 more cursor movement commands
" 	>to move the cursor around the visible part of the file:
" 	'H'	(high/top);		'M' (middle);		'L' (low bottom)
"
" 	>move cursor to the end of current line (think regex anchor):
" 	'$'
"
" 	>move cursor to beginning of current line (think regex anchor):
" 	'^'
"
" 	>move cursor forward or backward one word at a time:
" 	'w' (forward);		'b' (backward)
"
" #12 move cursor without leaving the home row (in command mode):
" 	'h'j'k'l'	'h' (left);		'j' (down);		'k' (up);	'l' (right)


