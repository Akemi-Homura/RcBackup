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
tmuxdirs='tmux'
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
        mkdir $1
    fi
}

checkdir $vimdirs
checkdir $zshdirs
checkdir $tmuxdirs

echo "[$proname `date`] check dirctories done"

# copy config files
cp ~/{.vimrc,.vimrc.bundles} $vimdirs/
cp ~/.vim/.ycm_extra_conf.py $vimdirs/
cp ~/.zshrc $zshdirs/
cp ~/.tmux.conf $tmuxdirs/

echo "[$proname `date`] copy config files done"

# upload
#  cmmsg="backup config files "
#  git add .
#  git commit -a -m "$cmmsg" > /dev/null >> /dev/null
#  git push > /dev/null >> /dev/null
nohup sh upload.sh

echo "[$proname `date`] backup config files done!"
