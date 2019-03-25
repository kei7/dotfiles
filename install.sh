#!/bin/sh
set -u
DOT_DIR=$(cd $(dirname $0); pwd)
cd $DOT_DIR
git submodule init
git submodule update

for f in .??*
do 
		[[ "$f" == ".git"]] && continue
		[[ "$f" == ".DS_Store"]] && continue
		[[ "$f" == ".gitignore"]] && continue
		[[ "$f" == ".gitconfig"]] && continue
		ln -snfv ~/dotfiles/"$f" ~/
done

