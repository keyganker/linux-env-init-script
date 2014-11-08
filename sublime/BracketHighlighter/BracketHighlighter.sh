#!/bin/bash
set -e

BRACKET_EXIT_STATUS=1
SUBLIME_CONFIG=${1}

if [ ! -z $SUBLIME_CONFIG ]; then
    echo "\n"
    echo 'Begin to install BracketHighlighter plugin of sublime...'
    tar xzvf BracketHighlighter.tar.gz
    mv BracketHighlighter $SUBLIME_CONFIG/Packages/BracketHighlighter

    if [ $?==0 ]; then
        echo 'Install BracketHighlighter plugin of sublime success...'
    else
        echo 'Install BracketHighlighter failed...'
        exit $BRACKET_EXIT_STATUS
    fi
else
    echo "\n"
    echo 'No sublime configure folder to install BracketHighlighter...'
fi