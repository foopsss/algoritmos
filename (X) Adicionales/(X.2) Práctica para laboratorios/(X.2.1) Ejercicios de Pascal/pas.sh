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

while getopts l:c:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        c) fpc $OPTARG.pas;;
        r) program=$OPTARG; run_program;;
        d) program=$OPTARG; delete_files;;
    esac
done