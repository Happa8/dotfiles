echo "==================="
echo "| Welcome to \e[36mzsh\e[m! |"
echo "| \e[1;32mHAPPA8\e[m's shell! |"
echo "==================="
echo "         |         "
echo "         |         "
echo "        ---        "
echo "                   "

#UTF-8有効化
export LANG=ja_JP.UTF-8

#自動補完設定
autoload -Uz compinit
compinit

#補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}''}}'''

#色を利用できるように
autoload -Uz colors
colors 

PROMPT="%F{green}[${USER}]%f%~ %# "

#履歴ファイル設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt hist_expand
setopt inc_append_history

#cdショートカット
setopt auto_cd

setopt auto_pushd
setopt pushd_ignore_dups

#typo修正
setopt correct

#詰めて表示
setopt list_packed

#先方予測機能
autoload predict-on
predict-on

#リダイレクト設定
setopt multios

#カラースキーム設定
source ~/molokai/molokai.sh

export LSCOLORS=gxfxcxdxbxegedabagacag
export LS_COLORS='di=36;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;46'
alias ls="ls -F --color"

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#拡張glob有効化
setopt extended_glob

#日本語ファイル名を表示可能に
setopt print_eight_bit

if [ -z $TMUX ]; then
  # tmuxのオプションに-2を付けないとubuntuのtmux上でvimがカラーにならない
  tmux -2 
fi
