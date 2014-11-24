
" initialization
call pathogen#infect() 
syntax on
filetype plugin indent on

" visual settings
set guifont=bitstream_vera_sans_mono:h13
set autoindent
"set expandtab
set smartindent
set smarttab
set softtabstop=2
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
set backupdir=~/.vim/bkp
set mouse-=a
set diffopt+=iwhite
set noerrorbells
set novisualbell
set nrformats+=alpha
set wildmode=longest:full
set wildmenu
set hidden
set autowrite
"set list listchars=tab:→\ ,trail:·
"set clipboard=unnamed " for MacVim

" colorscheme
set t_Co=256
colorscheme snappylight

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
au BufNewFile,BufRead *.nf set filetype=groovy
au BufNewFile,BufRead *.sparql set filetype=sparql

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

" Airline showing tabs and buffers
let g:airline#extensions#tabline#enabled = 1

" Change directory to the current buffer when opening files.
set autochdir

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif "
