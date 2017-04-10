OLD_SHELL=$SHELL
export SHELL="/bin/sh"

CF_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

for d in `find $CF_DIR -maxdepth 1 -type d`
do
    if [ $d != $CF_DIR ] && [ $d != $CF_DIR/'.git' ];then
        cd $d
        for f in `find $d -maxdepth 1 -type f`
        do
            if [ ${f##*.} != 'sh' ];then  # 排除后缀为.sh的可执行文件
                ln -sf $f $HOME/'.'`basename $f`
            fi
        done
    fi
done

# bash_completion.d
sh $CF_DIR/bash_completion.d/bash_completion.sh

# VIM
# Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ `uname` = "Linux" ];then
    # Ultisnips
    ln -sfn $CF_DIR/vim/UltiSnips $HOME/.vim/UltiSnips
    # Monaco_Fonts
    FONTS_DIR=/usr/share/fonts/monaco
    if [ ! -d $FONTS_DIR ]; then
        mkdir $FONTS_DIR
        ln -sf $CF_DIR/vim/fonts/Monaco_Linux.ttf $FONTS_DIR
        fc-cache -fv
    fi
else
    # Ultisnips
    ln -sfh $CF_DIR/vim/UltiSnips $HOME/.vim/UltiSnips
fi
vim -u $HOME/.vimrc +PlugInstall +PlugClean +PlugUpdate +qa

source $HOME/.bashrc
export SHELL=$OLD_SHELL
