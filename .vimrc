let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone git@github.com:Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

call dein#begin(s:dein_dir)

call dein#add('Shougo/dein.vim')
"call dein#add('Shougo/neocomplete.vim')
call dein#add('mattn/emmet-vim')
call dein#add('surround.vim')
call dein#add('kana/vim-smartinput')
call dein#add('scrooloose/syntastic')
call dein#add('scrooloose/nerdtree')
call dein#add('myhere/vim-nodejs-complete')
call dein#add('thinca/vim-quickrun')

call dein#end()

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
"
set backspace=indent,eol,start

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
 

" RLogin 利用時に Insertモードのときカーソルの形状を変更
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"


" キーバインド
" 入力モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
"inoremap <C-h> <Left>
inoremap <C-l> <Right>
" jjでエスケープ
inoremap <silent>jj <ESC>
" 日本語入力で っj と入力してもEnterキーで確定させればインサートモードを抜ける
inoremap <silent>っｊ <ESC>
" 行頭行末へ移動
nnoremap <Space>h  ^
nnoremap <Space>l  $
"
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" インサートモードに入らずに、カーソル行の下もしくは上に空行を挿入
nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'),'') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1,'') \| endfor<CR>
" 暴発しないように無効化
nnoremap ZZ <Nop>
nnoremap Q <Nop>
" backspaceキーで文字が消せるようにする ※Normalモードでまだ文字消せない
"noremap   
"inoremap   
"noremap 
"noremap! 

" オムニ補完 のショートカット
imap <C-f> <C-x><C-o>
" NERDTree のショートカット
map <C-n> :NERDTreeToggle<CR>


"syntastic & eslint 関連
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript'],
                           \ 'passive_filetypes': [] }
" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行しない
let g:syntastic_check_on_open = 0
 

"vim-nodejs-completeの設定
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
      let g:neocomplcache_omni_functions = {}
  endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'
let g:node_usejscomplete = 1


" quickrun 実行時の実行時間の表示をオン
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}


"カラーテーマの設定
set t_Co=256
colorscheme atom-dark-256     
