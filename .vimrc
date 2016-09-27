" Configuration file for vim
set modelines=0    " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
" ---------------------
"　バンドル管理
"----------------------
"Vi管理OFF
set nocompatible  " Use Vim defaults instead of 100% vi compatibility
filetype off
if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim/
 call neobundle#rc(expand('~/.vim/bundle'))
endif

" utiles
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/tpope/vim-surround.git'
NeoBundle 'git://github.com/chrismetcalf/vim-yankring.git'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'git://github.com/msanders/snipmate.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/tsukkee/unite-help.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/tpope/vim-endwise.git'
NeoBundle 'https://github.com/tomasr/molokai.git'

"ruby
"NeoBundle 'git://github.com/tpope/vim-rails.git'
"NeoBundle 'git://github.com/vim-ruby/vim-ruby.git'
"NeoBundle 'git://github.com/tpope/vim-haml.git'

"css, scss
NeoBundle 'git://github.com/cakebaker/scss-syntax.vim.git'

" js, cs
"NeoBundle 'git://github.com/vim-scripts/IndentAnything.git'
"NeoBundle 'git://github.com/othree/javascript-syntax.vim.git'
"NeoBundle 'git://github.com/vim-scripts/Javascript-Indentation.git'
"NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
"NeoBundle 'git://github.com/hallettj/jslint.vim.git'

"ファイル形式別プラグインのロードを有効化
filetype plugin on
filetype indent on

" Installation check.
if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
                    \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
endif

"------------------------------------
"" configure
"------------------------------------
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" 互換モードOFF
set nocompatible
" キーマップリーダー
let mapleader = "\\"
" スクロール時の余白確保
set scrolloff=5
" 一行に長い文章を書いていても自動折り返しをしない
set textwidth=0
" バックアップ取らない
set nobackup
" スワップファイル作らない
set noswapfile
" undofileを作らない
set noundofile
" 他で書き換えられたら自動で読み直す
set autoread
" 編集中でも他のファイルを開けるようにする
set hidden
" バックスペースでなんでも消せるように
set backspace=indent,eol,start
" テキスト整形オプション，マルチバイト系を追加
set formatoptions=lmoq
" ビープをならさない
set vb t_vb=
" Exploreの初期ディレクトリ
set browsedir=buffer
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" コマンドをステータス行に表示
set showcmd
" 現在のモードを表示
set showmode
" モードラインは無効
set modelines=0
" tabを使わない
set expandtab
" インデントを賢く
set smartindent
" 自動でインデント
set autoindent
" tab幅を半角4文字に
set tabstop=4
set shiftwidth=4
set softtabstop=4
" tabを賢く
set smarttab
" 行番号表示
set number
"モード表示
set showmode
"編集中のファイル名を表示
set title
"ルーラーの表示
set ruler
"入力中のコマンドをステータスに表示する
set showcmd
"括弧入力時の対応する括弧を表示
set showmatch
"2バイト半角文字対応
set ambiwidth=double
" カラー表示
syntax on
" search
set nohlsearch
set ignorecase
set smartcase
set incsearch
" encoding
set enc=utf8
set fileencodings+=sjis,cp932
" 特殊文字見せる
set list
set listchars=tab:>.,trail:_,nbsp:%,extends:>,precedes:<

" Use native clipboard
set clipboard+=unnamed
set clipboard=unnamed

" Ev/Rv edit/reload vimrc
command! Ev edit $HOME/.vimrc
command! Rv source $HOME/.vimrc

" 矩形選択で自由に移動する
set virtualedit+=block

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" カラースキーマ
colorscheme molokai

"------------------------------------
" autocmd
"------------------------------------
"" remove last space
autocmd BufWritePre * :%s/\s\+$//ge
" auto save
set autowriteall
set updatetime=1500
au CursorHold * silent! wall
au CursorHoldI * silent! wall

"------------------------------------
" keymap
"------------------------------------
"Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>

"Ctrl-hでヘルプ
nnoremap <C-h>  :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" 最後に編集された位置に移動
nnoremap gb '[
nnoremap gp ']

" 対応する括弧に移動
nnoremap [ %
nnoremap ] %

"ビジュアルモード時vで行末まで選択
vnoremap v $h

" 括弧を自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ` ``<LEFT>

"------------------------------------
"" use functions
"------------------------------------
"" magic comment
function! MagicComment()
    let magic_comment = "# -*- coding: utf-8 -*-\n"
    let pos = getpos(".")
    call cursor(1, 0)
    execute ":normal i" . magic_comment
    call setpos(".", pos)
endfunction
map <silent> <Leader># :call MagicComment()<CR>

"------------------------------------
" filetype
"------------------------------------
autocmd BufNewFile,BufRead *.ctp set filetype=php.html
autocmd BufNewFile,BufRead *.erb set filetype=eruby.html
autocmd BufNewFile,BufRead *.ejs set filetype=eruby.html

"" 対象のファイルタイプの場合、保存時にtabをスペースに変換する
autocmd FileType html,css,javascript,php,ruby,eruby,python,coffee,vim :%s/\t/  /ge

" ruby.spec
augroup RSpec
   autocmd!
   autocmd BufWinEnter, BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
"------------------------------------
" vim-quickrun
"------------------------------------
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec' }

"------------------------------------
" VimShell
"------------------------------------
let g:vimshell_enable_interactive = 1
let g:vimshell_enable_auto_slash = 1
nnoremap <C-W><C-W> :VimShell<CR>

"------------------------------------
" SnipMate
"------------------------------------
let g:snippets_dir = '~/.vim/snippets'

"------------------------------------
" neocomplcache
"------------------------------------
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字小文字を区別する
let g:neocomplcache_enable_smart_case = 1
" キャメルケース補完を有効にする
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー補完を有効にする
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Set minimum keyword length
let g:neocomplcache_min_keyword_length = 3
" Set manual completion length.
let g:NeoComplCache_manual_completion_start_length = 2
" 最初の候補を自動選択
let g:neocomplcache_enable_auto_select = 1
" Define snippets directory.
let g:neocomplcache_snippets_dir = '~/.vim/snippets'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'java' : '~/.vim/dict/java.dict',
    \ 'javascript' : '~/.vim/dict/javascript.dict',
    \ 'php' : '~/.vim/dict/php.dict',
   \ 'vim' : '~/.vim/dict/vim.dict'}

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <expr><CR> neocomplcache#smart_close_popup()."\<CR>"
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
"\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
    "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
endif

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\v\h\w*'

"------------------------------------
" surround.vim
"------------------------------------
" s, ssで選択範囲を指定文字でくくる
nmap s <Plug>Ysurround
nmap ss <Plug>Yssurround

"------------------------------------
" unite.vim
"------------------------------------
" 入力モードで開始する
let g:unite_enable_start_insert=0
" バッファ一覧
noremap <C-U><C-B> :Unite buffer<CR>
" ファイル一覧
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
" 最近使ったファイルの一覧
noremap <C-U><C-R> :Unite file_mru<CR>
" レジスタ一覧
noremap <C-U><C-Y> :Unite -buffer-name=register register<CR>
" ファイルとバッファ
noremap <C-U><C-U> :Unite buffer file_mru<CR>
" 全部
noremap <C-U><C-A> :Unite UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"------------------------------------
" rails.vim
"------------------------------------
let g:rails_level=4
let g:rails_default_database='mysql'

"=====================
" neocomplcache設定
"=====================
"辞書ファイル
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dictionaries/php.dict filetype=php
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'
