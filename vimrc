
" initialization
call pathogen#infect() 
syntax on
filetype plugin indent on

" visual settings
set guifont=bitstream_vera_sans_mono:h13
set autoindent
set smartindent
set smarttab
set cindent
set spelllang=en_gb
set nocompatible
set ic
set smartcase
set hlsearch
set incsearch 
set laststatus=2
set mousemodel=extend
set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8
set iskeyword+=:
set cot+=menuone
set number
set showmode ruler
set ruler
set showmatch
set shiftwidth=2
set ts=2
set backspace=2
set backup
set backupdir=~/.vim/tmp
set mouse-=a
set diffopt+=iwhite
set noerrorbells
set novisualbell
set nrformats+=alpha
set wildmode=longest:full
set wildmenu
set hidden
"set list listchars=tab:→\ ,trail:·
"set clipboard=unnamed " for MacVim

" colorscheme
set t_Co=256
colorscheme snappylight

" status
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%l,%v][%p%%]\ [LEN=%L]

" alternative mappings
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
map <Leader>. :tabnext<CR>
map <Leader>, :tabprevious<CR>
map <Leader>t :CtrlP<CR>

" enable neocomplcache
let g:neocomplcache_enable_at_startup = 1

" enable ClojureVim syntax
let g:vimclojure#HighlightBuiltins = 1 
let g:vimclojure#ParenRainbow = 1 

" custom syntax highlighting
au BufNewFile,BufRead *.thor set filetype=ruby
au BUfNewFile,BufRead *.sbt set filetype=scala

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir

