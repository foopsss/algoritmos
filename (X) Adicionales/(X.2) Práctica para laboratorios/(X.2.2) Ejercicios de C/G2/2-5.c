/* Crear una función que sume los elementos de un arreglo de enteros de 10
posiciones y devuelva el resultado. */

// NOTA: para cargar el arreglo opté por reutilizar la mecánica de carga de
// valores al azar que utilicé en el ejercicio 2-3, con una cota superior en el
// número 101, con la diferencia de que esta vez no le sumo nada al número
// entregado por el generador.

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void cargar_arreglo(int var_arr[10]) {
    // Preparación (seeding) del generador de números aleatorios.
    srand(time(NULL));

    for (int i = 0; i <= 9; i++) {
        // La cota superior del intervalo de números deseados es 101, entonces
        // el número 100 queda incluido en dicho intervalo.
        var_arr[i] = (rand() % 101) + 1;
    }
}

int sumar_elementos(int var_arr[10]) {
    int suma = 0;
    for (int i = 0; i <= 9; i++) {
        printf("Posición del arreglo: %d|Número: %d\n", i, var_arr[i]);
        suma += var_arr[i];
    }
    return suma;
}

int main(void) {
    int arr_ent[10], suma_elem = 0;
    cargar_arreglo(arr_ent);
    suma_elem = sumar_elementos(arr_ent);
    printf("Valor de la suma de los elementos del arreglo: %d\n", suma_elem);
    return 0;
}
