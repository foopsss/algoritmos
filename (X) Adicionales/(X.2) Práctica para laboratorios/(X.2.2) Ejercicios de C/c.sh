#!/bin/bash

run_program() {
    gcc $program.c -o $program
    coderr=$?

    if [ "$coderr" -eq 0 ]
    then
        ./$program
    fi
}

delete_files() {
    rm $program
}

while getopts l:c:r:d: flag;
do
    case "${flag}" in
        l) cd "$OPTARG";;
        c) gcc $OPTARG.c -o $OPTARG;;
        r) program=$OPTARG; run_program;;
        d) program=$OPTARG; delete_files;;
    esac
done
