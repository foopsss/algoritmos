#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "Uso: . goto.sh <proyecto>"
    echo "Para ir a Pascal, proyecto debe ser igual a 'pas'."
    echo "De lo contrario, se va a C con cualquier otro argumento."
else
    if [ "$1" == "pas" ]
    then
        cd "(X) Adicionales"/"(X.2) Práctica para laboratorios"/"(X.2.1) Ejercicios de Pascal"
    else
        cd "(X) Adicionales"/"(X.2) Práctica para laboratorios"/"(X.2.2) Ejercicios de C"
    fi
fi