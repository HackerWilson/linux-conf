#!/usr/bin/env bash

VIRTUALENV_DIR=$HOME/.virtualenv
if [ -d $VIRTUALENV_DIR  ];then
    VIRTUALENV_CF=$HOME/.virtualenv.conf
    echo '#!/bin/bash' > $VIRTUALENV_CF

    cd $VIRTUALENV_DIR
    for i in `find $VIRTUALENV_DIR -maxdepth 1 -type d`
    do
        if [ `pwd` != $i ];then
            VIRTUAL_DIR=`basename $i`
            echo  "alias virtualenv-"$VIRTUAL_DIR"='source "$VIRTUALENV_DIR"/"$VIRTUAL_DIR"/bin/activate'" >> $VIRTUALENV_CF
        fi
    done
fi
