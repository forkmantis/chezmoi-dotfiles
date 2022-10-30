#!/bin/sh

OPTPATH=~/.vim/pack/minpac/opt
MPPATH=$OPTPATH/minpac

if [ ! -d $MPPATH ]; then
    mkdir -p $OPTPATH
    cd $OPTPATH
    git clone https://github.com/k-takata/minpac.git
fi
