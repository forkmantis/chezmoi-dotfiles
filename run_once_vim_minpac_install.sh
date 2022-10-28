#!/bin/sh

OPTPATH=~/.vim/pack/minpac/opt
MPPATH=$OPTPATH/minpac

if [ ! -d $MPPATH ]; then
    cd $OPTPATH
    git clone https://github.com/k-takata/minpac.git
fi
