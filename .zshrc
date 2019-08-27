export LANG=ja_JP.UTF-8

eval "$(dircolors -b)"

autoload colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_no_store
setopt appendhistory		     # HISTFILEを上書きせずに追記
setopt hist_ignore_all_dups         # 重複したとき、古い履歴を削除
setopt hist_ignore_space	     # 先頭にスペースを入れると履歴を保存しない
setopt hist_reduce_blanks           # 余分なスペースを削除して履歴を保存
setopt share_history		     # 履歴を共有する

# 補完
autoload -Uz compinit
compinit -u
## 補完候補を一覧表示
setopt auto_list
## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## カッコの対応などを自動的に補完
setopt auto_param_keys
## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=2
## 補完候補の色づけ
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## 補完候補を詰めて表示
setopt list_packed
## スペルチェック
setopt correct
## ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
## 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash
## 大文字と小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
## ビープを鳴らさない
setopt nobeep
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups
## --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
## ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
## 出力時8ビットを通す
setopt print_eight_bit
## ディレクトリ名だけで cd
setopt auto_cd
## コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
#alias
##auto ls
function chpwd() {
	    ls --color=auto -C
}
## vi=vim
alias vi='vim'
## link error gcc
## c++11 c
alias gcc='gcc -Wall'
alias g++='g++ -std=c++11 -O3 -Wall -Wextra -Wconversion'
function ggl() {g++ "$@" -I/usr/include/GL -std=c++11 -O3 -Wall -Wextra -Wconversion -lglut -lGLU -lGL -lm}
function cgl() {gcc "$@" -I/usr/include/GL -O3 -Wall -Wextra -Wconversion -lglut -lGLU -lGL -lm}
##python
alias py='python'
alias py3='python3'
alias ipy='ipython'
alias ipy3='ipython3'
## ２個以上上のディレクトリへ
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='../../../..'
## interactive
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
## 短形
alias ls='ls --color=auto -C'
alias la='ls -a --color=auto -C'
alias ll='ls -la --color=auto -C'
## 拡張子でsuffix
## matlab octave 
alias -s m="octave"
## auto gcc g++ -11
alias -s c='gcc -O3 -std=c99 -Wall -Wextra -Wconversion -lglut -lGL -lGLU -lm'
alias -s cpp='g++ -O3 -std=c++11 -Wall -Wextra -Wconversion -lglut -lGL -lGLU -lm' 
## python
alias -s py=python3
## 音楽
alias -s mp3=vlc
## 動画
alias -s {mp4,MTS,org}=vlc
## 画像
if [ 'uname' = 'Darwin' ];then
	alias geeqie='open -a Preview'
fi
alias -s {png,jpg,jpeg,bmp,PNG,JPG,JPEG,BMP}=geeqie
alias -s gif=eog
## pdf
alias -s pdf=qpdfview
## txt
alias -s txt=gedit
## 圧縮ファイルを自動で展開
function extract() {
	case $1 in
    	*.tar.gz|*.tgz) tar xzvf $1;;
    	*.tar.xz) tar Jxvf $1;;
    	*.zip) unzip $1;;
        *.lzh) lha e $1;;
        *.tar.bz2|*.tbz) tar xjvf $1;;
        *.tar.Z) tar zxvf $1;;
        *.gz) gzip -d $1;;
        *.bz2) bzip2 -dc $1;;
        *.Z) uncompress $1;;
        *.tar) tar xvf $1;;
        *.arj) unarj $1;;
    esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract
##global
##alias -g G= ' | grep'
##プロンプト
##autoload -Uz vcs_info

##zstyle ':vcs_info:*' formats '[%b]'
##zstyle ':vcs_info:*' actionformats '[%b|%a]'

# PROMPTの設定
##PROMPT用の色を256色で設定する
#例
# 例4
# 以下のように文字色を定義しておくと便利
#COLOR_FG="%{^[[38;5;001m%}"      # 表を赤に
#COLOR_BG="%{^[[30;48;5;082m%}"   # 背景を緑に
#COLOR_END="%{^[[0m%}"            # 色を元に戻す
#PROMPT="${COLOR_BG}${COLOR_FG}Red on Green Backgroun${COLOR_END}"
# 注意! ^[ は特殊文字。Vim上で Ctrl+Vした後にESCを押せば入力できる。
COL_L_CYAN_FG="%{[38;5;087m%}" #Light_Cyan
COL_L_MAGENTA_FG="%{[38;5;198m%}"
COL_YELLOW_FG="%{[38;5;226m%}"
COL_BLUEPURPLE_FG="%{[38;5;021m%}"
COL_L_RED="%{[38;5;008m%}"
COL_BLACK_BG="%{[30;48;5;000m%}"
COL_BLUE_BG="%{[30;48;5;017m%}"
COL_REDORANGE_BG="%{[30;48;5;160m%}"
COL_YELLOW_BG="%{[30;48;5;011m%}"
COL_GREEN_BG="%{[30;48;5;082m%}"
COL_END="%{[0m%}" #元に戻す

#PROMPT="%{${fg[white]}%}[%*]%{${fg[reset_color]}%}%{${fg[cyan]}%}[%~]%{${reset_color}%}
#%{${fg[yellow]}%}(*\"･⑧ ･)/ $%{${reset_color}%} "
#PROMPT2="%B%{${fg[yellow]}%}%_>%{${reset_color}%}%b "
#SPROMPT="%B%{$fg[red]%}%{$suggest%}ヽ(#･ω･)ﾉ < もしかして%b %{${fg[green]}%}%r %B%{$fg[red]%}? [うん!(y), ちゃう(n),a,e]:${reset_color}%b "
PROMPT="${COL_REDORANGE_BG}${COL_L_CYAN_FG}[%*]${COL_END}${COL_L_CYAN_FG}[%~]${COL_END}
${COL_BLACK_BG}${COL_L_MAGENTA_FG}♪ (*\"･⑧ ･)/ $ ${COL_END} "
PROMPT2="${COL_BLUE_BG}${COL_YELLOW_FG}_>${COL_END}"
SPROMPT="${COL_GREEN_BG}${COL_BLUEPURPLE_FG}%{$suggest%}ヽ(#･ω･)ﾉ < もしかして  ${COL_YELLOW_BG}${COL_L_RED_FG}%r ${COL_GREEN_BG}${COL_BLUEPURPLE_FG}? [うん(y), ちゃう(n),a,e]:${COL_END} "
function precmd() {
	psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
##RPROMPTにメモをする関数　memo で機能 memoで脱出
#RPROMPT='%{[38;5;013m%}[%m]%{[0m%}'
RPROMPT=' '
#function memo(){
#	if[ $# -eq 0] then 
#		unset memotxt
#		return;
#	fi
#	for str in $@
#	do
#	memotxt="${memotxt} ${str}"
#	done
#}
##バージョン管理についてのプロンプト
autoload -Uz vcs_info
setopt transient_rprompt
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
RPROMPT='${vcs_info_msg_0_}'$RPROMPT

