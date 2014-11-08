#!/bin/bash
set -e # if any shell return value not equal 0, stop the script
set -u # if any variable is not Initialization, stop the script

echo "Begin to install ctags...\n"
echo "Begin to configure...\n"
sleep 3

CTAGS_EXIT_STATUS=1
SUBLIME_CONFIG=${1}

tar xzvf exuberant-ctags_5.8.orig.tar.gz
cd ctags-5.8
./configure

if [ $? -ne 0 ]; then
    echo 'Configure ctags failed...'
    exit $CTAGS_EXIT_STATUS
fi

echo "\n"
echo "Begin to install...\n"
sleep 3

make && make install && make clean

if [ $? -ne 0 ]; then
    echo 'Install ctags failured'
    exit $CTAGS_EXIT_STATUS
else
    echo "\n"
    echo 'Do make clean...'
    echo 'Install ctags success...'
    make clean
fi

# If you want to uninstall ctags, just go to the source folder and execute  "sudo make uninstall"
# Or " make -n install" to show steps of install, and reverse the steps

# Begin to install ctag plugin of sublime

set +u
if [ ! -z $SUBLIME_CONFIG ]; then
    echo "\n"
    echo 'Begin to install ctags plugin of sublime...'
    tar xzvf CTags-development.tar.gz
    mv CTags-development $SUBLIME_CONFIG/Packages/CTags

    if [ $?==0 ]; then
        echo 'Install ctag plugin of sublime success...'
    fi
fi

# install ctags success
CTAGS_EXIT_STATUS=0
exit $CTAGS_EXIT_STATUS

