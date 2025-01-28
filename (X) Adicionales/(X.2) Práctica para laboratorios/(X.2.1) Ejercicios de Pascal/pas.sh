#!/bin/bash

print_line() {
    echo "------------------------------------------------------------"
}

run_program() {
    fpc $OPTARG.pas
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        print_line
        ./$OPTARG
    fi
}

debug_program() {
    fpc -g $OPTARG.pas
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        print_line
        gdb ./$OPTARG
    fi
}

delete_files() {
    if [ $OPTARG = "functions" ]
    then
        rm $OPTARG.ppu $OPTARG.o
    else
        rm $OPTARG $OPTARG.o
    fi
}

while getopts l:c:g:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        c) fpc $OPTARG.pas;;
        g) debug_program;;
        r) run_program;;
        d) delete_files;;
    esac
done
