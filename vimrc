"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

"necessary on some Linux distros for pathogen to properly load bundles
filetype on
filetype off

"load pathogen managed plugins
call pathogen#infect()

" Syntax
syntax on

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" github
Bundle 'scrooloose/nerdtree.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-surround.git'
Bundle 'rstacruz/sparkup.git'
Bundle 'Lokaltog/vim-easymotion.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'docunext/closetag.vim.git'
"Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'kchmck/vim-coffee-script.git'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype indent on     " required!
filetype plugin on     " Snipmate

" Shortcut for tcomment
map <leader>c <c-_><c-_>

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"Line numbers
set number

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000
set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase  "case-insensitive search

"turn off needless toolbar on gvim/mvim
set guioptions-=T

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cindent
set smartindent
set autoindent
set expandtab

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

" NERDTree settings
nmap wm :NERDTree<cr>
let NERDTreeIgnore=['\.swp$', '\.pyc$']
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>

"nnoremap <Esc>A <up>
"nnoremap <Esc>B <down>
"nnoremap <Esc>C <right>
"nnoremap <Esc>D <left>
"inoremap <Esc>A <up>
"inoremap <Esc>B <down>
"inoremap <Esc>C <right>
"inoremap <Esc>D <left>


"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
nmap <Down> gj
nmap <Up> gk
set fo=l

" Tagbar
"let g:tagbar_usearrows = 1
"nnoremap <leader>l :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" Vim tabs navigation
nmap <leader>] :tabn<CR>
nmap <leader>[ :tabp<CR>

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

" Rails
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

" when press { + Enter, the {} block will expand.
imap {<CR> {}<ESC>i<CR><ESC>O

" Supertab with OmniComplete (http://mirnazim.org/writings/vim-plugins-i-use/)
"let g:SuperTabDefaultCompletionType = "context"

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

"snipmate setup
try
  source ~/.vim/snippets/support_functions.vim
endtry
" autocmd vimenter * call s:SetupSnippets()
" function! s:SetupSnippets()
"
"     "if we're in a rails env then read in the rails snippets
"     if filereadable("./config/environment.rb")
"       try
"         call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
"         call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
"       endtry
"     endif
"
"     try
"       call ExtractSnips("~/.vim/snippets/html", "eruby")
"       call ExtractSnips("~/.vim/snippets/html", "xhtml")
"       call ExtractSnips("~/.vim/snippets/html", "php")
"     endtry
" endfunction

" Color scheme
if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    colorscheme codeschool
    set guitablabel=%M%t
    set lines=999
    set columns=999

    if has("gui_gnome")
        set term=gnome-256color
        colorscheme codeschool
        set guifont=Monospace\ Bold\ 12
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h14
        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        "macmenu &File.New\ Tab key=<nop>
        "map <D-t> :CommandT<CR>
        " make Mac's Option key behave as the Meta key
    endif

    if has("gui_win32") || has("gui_win32s")
        set guifont=Consolas:h12
        set enc=utf-8
    endif
    " Evito la chiusura della GUI
    cnoreabbrev <expr> q ((getcmdtype() is# ':' && getcmdline() is# 'q')?('tabclose'):('q'))
    cnoreabbrev <expr> x ((getcmdtype() is# ':' && getcmdline() is# 'x')?('w<CR>:tabclose'):('q'))
    cnoreabbrev <expr> wq ((getcmdtype() is# ':' && getcmdline() is# 'wq')?('w<CR>:tabclose'):('q'))
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set codeschool colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme codeschool
    else
        if $TERM == 'xterm'
            set term=xterm-256color
            colorscheme codeschool
        else
            colorscheme default
        endif
    endif
endif

