#!/bin/sh

mv ~/.vimrc ~/.vimrc.old
cp _vimrc ~/.vimrc
mkdir -p ~/.vim/plugin
cp -fr _vimrc/* ~/.vim/
