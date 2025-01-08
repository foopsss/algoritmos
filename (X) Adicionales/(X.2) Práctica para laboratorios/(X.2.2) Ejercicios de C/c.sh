#!/bin/bash

compile_program() {
    if [ "$platform" == "mgw" ]
    then
        x86_64-w64-mingw32-gcc $program.c -o $program.exe
    else
        gcc $program.c -o $program
    fi
}

compile_debugging() {
    if [ "$platform" == "mgw" ]
    then
        x86_64-w64-mingw32-gcc -g $program.c -o "$program-dbg".exe
    else
        gcc -g $program.c -o "$program-dbg"
    fi
}

run_program() {
    compile_program
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        if [ "$platform" == "mgw" ]
        then
            wine $program.exe
        else
            ./$program
        fi
    fi
}

delete_files() {
    if [ "$platform" == "mgw" ]
    then
        rm $program.exe
    else
        rm $program
    fi
}

while getopts l:p:c:g:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        p) platform=$OPTARG;;
        c) program=$OPTARG; compile_program;;
        g) program=$OPTARG; compile_debugging;;
        r) program=$OPTARG; run_program;;
        d) program=$OPTARG; delete_files;;
    esac
done