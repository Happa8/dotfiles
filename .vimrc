""""""""""""""
"""個人設定"""
""""""""""""""
syntax on

set number
set title
set ambiwidth=double
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set nolist
set hidden
set virtualedit=all
set backspace=indent,eol,start
set showmatch
set mouse=a
set ruler
set pumheight=10
set encoding=utf8
set fileencoding=utf8
set wrap
set whichwrap=b,s,[,],,~
set laststatus=2
set statusline=%F%r%h%=
set nocompatible
set noswapfile

set nohlsearch
set incsearch
set hlsearch

set showcmd
set scrolloff=5
set wildmenu wildmode=list:full
set cursorline

set history=200

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

noremap <C-R><C-R> :source ~/.vimrc<CR>
nnoremap <C-N><C-N> :NERDTreeToggle<CR>
""""""""""""""
"""dein設定"""
""""""""""""""

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))
call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/vimproc.vim', 'make')

call dein#add('Shougo/Unite.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('scrooloose/nerdtree')
call dein#add('tomasr/molokai')
let g:molokai_original = 1
colorscheme molokai
call dein#add('itchyny/lightline.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('kien/ctrlp.vim')
call dein#add('mattn/emmet-vim')
call dein#add('othree/html5.vim')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('jelera/vim-javascript-syntax')
call dein#add('hokaccha/vim-html5validator')
call dein#add('tpope/vim-fugitive')

call dein#end()

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

"""""""""""""""
"""Unite設定"""
"""""""""""""""
" 最近使ったファイル&バッファ一覧
noremap <C-O> :Unite buffer file_mru file<CR>

" Esc二回打ちで終了
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FIletype unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"""""""""""""""""""""
"""NeoComplete設定"""
"""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""
"""NeoSnippet設定"""
""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""
"""IndentGuides設定"""
""""""""""""""""""""""

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
