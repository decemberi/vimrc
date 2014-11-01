set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" End of the example VI settings
map \n <ESC>:tabnew<CR>
map \1 <ESC>:tabn 1<CR>
map \2 <ESC>:tabn 2<CR>
map \3 <ESC>:tabn 3<CR>
map \4 <ESC>:tabn 4<CR>
map \5 <ESC>:tabn 5<CR>
map \6 <ESC>:tabn 6<CR>
map \7 <ESC>:tabn 7<CR>
map \8 <ESC>:tabn 8<CR>
map \9 <ESC>:tabn 9<CR>
map \0 <ESC>:tabn 0<CR>
map \C <ESC>:q!<CR>
map \C <ESC>:q!<CR>
map \c <ESC>:q<CR>
map \e <ESC>:edit 

map <F2> <ESC>:set nu!<CR>
map <F3> <ESC>:set paste!<CR>


"set tenc=euc-kr
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp949,euc-kr

colo darkblue
set background=dark

if has("gui_macvim")
  set guifont=Monaco:h13
  set columns=125
  set lines=45
endif

set cindent
set showmatch
set nu
set ts=4 sw=4 sts=4 et
