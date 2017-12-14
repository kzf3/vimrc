"----------------------
" NeoBundle Settings
"----------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  " Be iMproved
  set nocompatible
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'  " NeoBundle 必須アイテム
NeoBundle 'Shougo/unite.vim'           " ファイル移動などの必須アイテム
NeoBundle 'Shougo/neomru.vim'          " uniteで履歴を見るためのファイル
NeoBundle 'Shougo/neocomplcache.vim'          " uniteで履歴を見るためのファイル
NeoBundle 'mattn/emmet-vim'            " Emmet
NeoBundle 'nanotech/jellybeans.vim'    " テーマカラー
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tpope/vim-obsession'        " tmuxと一緒にsessionを残す
NeoBundle 'slim-template/vim-slim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

 " Required:
filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

"----------------------
" Configure
"----------------------
" スクロール時の余白確保
set scrolloff=5
" 他で書き換えられた自動で読み直す
set autoread
" バックアップは作らない
set nobackup
" 番号表示
set number
" タブをスペースへ変換
set expandtab

"let extensions = ["vim", "rb", "html", "css", "scss", "js", 'yml', 'erb']
let extensions = ["php", "ctp"]
let checkfiles = [".vimrc", ".gvimrc"]
let indent = 0

" ファイル別にインデントを修正
for extension in extensions
  if (extension == expand("%:e"))
    let indent = 1
  endif
endfor

for checkfile in checkfiles
  if (checkfile == expand("%"))
    let indent = 1
  endif
endfor

if (indent) 
  " ファイル上のタブ文字の幅
  set tabstop=4
  " 自動で挿入されるインデントのスペース幅
  set shiftwidth=4
else
  set tabstop=2
  set shiftwidth=2
endif

" 縦分割時に右側に開く
set splitright
" 連続した空白に対してタブキーやバックスペースキーで動く幅
set softtabstop=4
" 行頭の余白内で打ち込むとshiftwidth分だけインデントされる。
" 行頭以外ではtabstopの数だけ空白が挿入される。オフのときは<tab>を打ち込むと常にtabstopの数だけインデントされる
set smarttab
" 改行時に前のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせてスペースを増減させる
set smartindent
" swapをつくらない
set noswapfile
" backupfile~を作らない
set nobackup
" undofileを作らない
set noundofile
" ビープ音を消す
set vb t_vb=
" ルーラーの表示
set ruler
"2バイト半角文字対応
set ambiwidth=double
" vim内部の文字encording
set enc=utf8
"ファイル書き込み時の文字コード
set fileencodings+=sjis,cp932
" タブ文字を CTRL-I で表示し、行末に $ で表示する。（有効:list/無効:nolist）
set list
" Listモード (訳注: オプション 'list' がオンのとき) に使われる文字を設定する。
set listchars=tab:>.,eol:¬
" 検索が最後までいったら先頭へ折り返す
set wrapscan
" 編集中の行をハイライト
set cursorline
" バックスペースでなんでも消す
set backspace=indent,eol,start
" 文字列検索をハイライト
set hlsearch
" クリップボード設定
set clipboard=unnamed,autoselect
" ペースト設定
"set paste
"----------------------
" Default keymap
"----------------------
" ESCを２回押してハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR>
" 対応した括弧に移動
nnoremap [ %
nnoremap { %
" ビジュアルモードで全選択
vnoremap v $h
" 括弧の自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` `<LEFT>
inoremap <% <% %><RIGHT>
inoremap <? <?php<LEFT>
"----------------------
" color scheme
"----------------------
let g:hybrid_use_iTerm_colors = 1
let g:hybrid_reduced_contrast = 1
syntax on
colorscheme jellybeans
"----------------------
" Unite
"----------------------
" 入力モードで開始する
let g:unite_eneble_start_insert=0
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" ファイルの使用履歴
noremap <C-U><C-R> :Unite file_mru<CR>

"----------------------
" Emmet
"----------------------
"let g:user_emmet_leader_key='<c-w>'
let space = indent ? '    ' : '  '

let g:user_emmet_settings = {
            \   'variables':{
            \       'lang' : "ja"
            \   },
            \   'html' : {
            \       'indentation': space
            \    }
            \}

"----------------------
" Neocomplcache
"----------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
