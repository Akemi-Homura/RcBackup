#!/bin/bash

#
# backupconf
# backup conf files including
# .vimrc `.vimrc.bundles`，`.vim/.ycm_extra_conf.py`，`.zshrc`
# 

proname=BACKUP

echo "[$proname `date`] backup config files"

vimdirs='vim'
zshdirs='zsh'
workdir='.'

if [ $# -gt 0 ]
then
    workdir=$1
fi

# change directory first
cd $workdir

# check if there are directories of vim and zsh
echo "[$proname `date`] check dirctores now"
function checkdir(){
    if [ ! -e $1 ]
    then
        echo mkdir $1
        mkdir $1
    fi
}

checkdir $vimdirs
checkdir $zshdirs

echo "[$proname `date`] check dirctories done"

# copy config files
cp ~/{.vimrc,.vimrc.bundles} $vimdirs/
cp ~/.vim/.ycm_extra_conf.py $vimdirs/
cp ~/.zshrc $zshdirs/

echo "[$proname `date`] copy config files done"

# upload
cmmsg="backup config files "
git add .
git commit -a -m "$cmmsg" > /dev/null
git push

echo "[$proname `date`] backup config files done!"
