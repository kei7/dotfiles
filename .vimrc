"** システム設定 **
set nocompatible
set noswapfile                      "swpの作成無効化
set nobackup                        "~の作成無効化
set writebackup                     "上書き成功時に~を削除
set clipboard+=unnamed,autoselect   "クリップボードを共有
set wildignorecase
set wildmode = list
"** 文字コード設定 **
set encoding=utf-8                  "vim
set fileencoding=utf-8              "保存するファイル
set fencs=iso-2022-jp,enc-jp,cp932  "開くファイル
 
"** 表示設定 **
syntax on                           "ハイライト表示
set title                           "タイトル
set number                          "行番号
set cursorline                      "カーソル行
set laststatus=2					"ステータス行
"set list							"不可視文字表示
"** カラースキーマ設定 **
set t_Co=256
colorscheme molokai
let g:molokai_original=1
set background=dark
 
set tabstop=4                       "タブ文字幅
set shiftwidth=4                    "インデント幅
set noexpandtab                     "挿入モードでタブ文字有効
set smartindent
set smarttab
set whichwrap+=h,l
set incsearch
set hlsearch 
"** ファイル別設定 **
filetype on
autocmd FileType c,cpp,perl,html set cindent
