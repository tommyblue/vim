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
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim.git'

" vim-scripts repos
Bundle 'L9' 
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!

" Shortcut for tcomment
map <leader>c <c-_><c-_>

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set smartindent
set autoindent
set expandtab
set cinkeys=0{,0},:,0#,!,!^F

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

" NERDTree settings
nmap wm :NERDTree<cr>
let NERDTreeIgnore=['\.swp$']
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
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"statusline setup
set statusline=%f       "tail of the filename

"Git
set statusline+=%{fugitive#statusline()}

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"turn off needless toolbar on gvim/mvim
set guioptions-=T

" Supertab with OmniComplete (http://mirnazim.org/writings/vim-plugins-i-use/)
let g:SuperTabDefaultCompletionType = "context"

" Color scheme
if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    colorscheme railscasts
    set guitablabel=%M%t
    set lines=40
    set columns=115

    if has("gui_gnome")
        set term=gnome-256color
        colorscheme railscasts
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
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1

    "set railscasts colorscheme when running vim in gnome terminal
    if $COLORTERM == 'gnome-terminal'
        set term=gnome-256color
        colorscheme railscasts
    else
        if $TERM == 'xterm'
            set term=xterm-256color
            colorscheme railscasts
        else
            colorscheme default
        endif
    endif
endif
