#!/bin/bash

compile_program() {
    if [ "$platform" == "mgw" ]
    then
        x86_64-w64-mingw32-gcc $OPTARG.c -o $OPTARG.exe
    else
        gcc $OPTARG.c -o $OPTARG
    fi
}

compile_debugging() {
    if [ "$platform" == "mgw" ]
    then
        x86_64-w64-mingw32-gcc -g $OPTARG.c -o "$OPTARG-dbg.exe"
    else
        gcc -g $OPTARG.c -o "$OPTARG-dbg"
        coderr=$?

        if [ "$coderr" -eq 0 ]
        then
            gdb ./"$OPTARG-dbg"
        fi
    fi
}

run_program() {
    compile_program
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        if [ "$platform" == "mgw" ]
        then
            wine $OPTARG.exe
        else
            ./$OPTARG
        fi
    fi
}

delete_files() {
    if [ "$platform" == "mgw" ]
    then
        rm $OPTARG.exe
    else
        rm $OPTARG
    fi
}

while getopts l:p:c:g:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        p) platform=$OPTARG;;
        c) compile_program;;
        g) compile_debugging;;
        r) run_program;;
        d) delete_files;;
    esac
done