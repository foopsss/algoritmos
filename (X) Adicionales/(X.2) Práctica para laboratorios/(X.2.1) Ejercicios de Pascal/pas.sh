#!/bin/bash

run_program() {
    fpc $program.pas
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        echo "------------------------------------------------------------"
        ./$program
    fi
}

delete_files() {
    if [ $program = "functions" ]
    then
        rm $program.ppu $program.o
    else
        rm $program $program.o
    fi
}

while getopts l:c:g:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        c) fpc $OPTARG.pas;;
        g) fpc -g $OPTARG.pas;;
        r) program=$OPTARG; run_program;;
        d) program=$OPTARG; delete_files;;
    esac
done