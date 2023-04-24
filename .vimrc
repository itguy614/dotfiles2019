set nocompatible						    " We want the latest vim options

so ~/.vim/plugins.vim						" Include all plugins

syntax enable                               " Turn on syntax highlighting

set nocompatible                            " Fix the backspace keys
set backspace=indent,eol,start				" Make backspace behave like every other editor
let mapleader = ','						    " The default leader is \, but a comma is much better
set number							        " Activate line numbers
set numberwidth=6                           " Create a little wider number width area
set ch=2                                    " Make the command line two lines
set noerrorbells visualbell t_vb=           " No more bells
set backspace=2                             " Allow backspacing over indent, eol, and the start of an indent
set nowrap                                  " Do not autowrap long lines
set sidescroll=5                            " Scoll left and right by 5 chars at a time
set listchars+=precedes:<,extends:>
set hidden                                  " Allow reuse of the same window
set wildmenu                                " Turn on improved command-line completion
set wildignore=.git,*.swp,*.jpg,*.png,*.gif
set wildmode=longest:full,full
set confirm                                 " Istead of failing a command, ask to save
set mouse=a                                 " Allow the use of the mouse in all modes
set spelllang=en_us                         " Use the English spellings
set lazyredraw                              " Lazyredraw attempts to solve Vim lag by reducing the amount of processing required. When enabled, any action that is not typed will not cause the screen to redraw.
set ttyfast                                 "
set autoread                                " Auto reload a file if it has changed
set autowriteall                            " Auto write the file when switching buffers
set complete=.,w,b,u,t,i                    " Set our desirec autocompleteion matching



" -- Status Line ---------------------------------------------------"
set laststatus=2
set showcmd



" -- Printing ------------------------------------------------------"
set printoptions=header:0,duplex:long,paper:letter



" -- Visuals ------------------------------------------------------"
set background=light                         " Use a light background
set t_Co=16                                  " Support 256 colors in the terminal
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme catppuccin-frappe
set guifont=Fira_Code:h12          		    " Use my coding font
" set linespace=12						    " Macvim specific line-height

set guioptions-=l						    " Disable left scroll bar
set guioptions-=L						    " Disable left scroll in a split
set guioptions-=r						    " Disable right scroll bar
set guioptions-=R						    " Disable right scroll bar in a split
set guioptions-=m                           " Remove menu bar
set guioptions-=T                           " Remove toolbar
set guioptions-=e						    " Use non-gui tabs
set nocursorline
set nocursorcolumn
set ruler                                   " Display col/col on statusline

" Make sure there is at least one line below and above the current line when
" scrolling.
if !&scrolloff
    set scrolloff=1
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline

" Color column 80 and everything past 120
" let &colorcolumn="80,".join(range(120,999),",")

if has("gui_running")
    set lines=43 columns=120
else
    if exists("+lines")
    endif
    if exists("+columns")
    endif
endif


" -- Backups ------------------------------------------------------"
set noswapfile
set nobackup



" -- Tabs ---------------------------------------------------------"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smarttab



" -- Search -------------------------------------------------------"
set hlsearch							" Highlight search results
set incsearch							" Do incremental searching
set wrapscan                            " Set the search scan to wrap long lines
set ignorecase                          " Ignore case when searching



" -- Split Management ---------------------------------------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



" -- Mappings -----------------------------------------------------"

" Make it easy to edit Vimrc file
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Make it easy to edit Plugins file
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Quickly search for a tag
nmap <leader>f :tag<space>

" Toggle spell checking
nmap <leader>ss :set spell!<cr>

" Open Journal
nmap <leader>jj :call Journal()<cr>

" Bubble line up and down
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V``]
vmap <C-Down> xp`[V`]

" Indent lines in visual mode using tab
vmap <tab> >gv
vmap <tab> <gv

" Indent lines in normal mode
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>



" -- Laravel Specific ---------------------------------------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lc :e app/Http/Controllers/<cr>
nmap <Leader>lm :e app/<cr>
nmap <Leader>lv :e resources/views/<cr>
nmap <Leader>la :!php artisan
nmap <Leader>lam :!php artisan make:
" nmap <Leader>lar :new | r !php artisan route:list
nmap <Leader><leader>lc :CtrlP<cr>app/Http/Controllers/
nmap <Leader><leader>lm :CtrlP<cr>app/
nmap <Leader><leader>lv :CtrlP<cr>resources/views/



nmap <Leader>d i##X## <esc>

" -- Auto-Commands ------------------------------------------------"

" Automatically source tese files on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
    autocmd BufWritePost plugins.vim source %
augroup END

" Set syntac highlighting for certain files
augroup autofiletype
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown|set wrap|set linebreak|set nolist|set textwidth=0|set wrapmargin=0|let &colorcolumn=0
augroup END


" -- Functions ---------------------------------------------------"

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! Journal()
    let filepath = expand("~") . "/journal/" . strftime("%Y") . "/" . strftime("%m")
    let filename = strftime("%Y%m%d") . ".md"
    let fullpath = filepath . "/" . filename

    " If the file path does not exist, then create it
    if !isdirectory(filepath)
        call mkdir(filepath, "p")
    endif

    " If the file exists, open it
    if filereadable(fullpath)
        execute "vsplit" fullpath
    endif

    return ""
endfunction
