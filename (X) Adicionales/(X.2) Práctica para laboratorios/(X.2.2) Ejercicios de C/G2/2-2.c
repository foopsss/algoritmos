/* A partir del ejercicio anterior, realizar una función para cargar el arreglo
y otra para mostrarlo por pantalla. */

#include <stdio.h>

void cargar_arreglo(int var_arr[10]) {
    for (int i = 0; i <= 9; i++) {
        printf("Introduzca un número para la posición %d del arreglo: ", i);
        scanf("%d", &var_arr[i]);
    }
}

void mostrar_arreglo(int var_arr[10]) {
    printf("\n");
    printf("Valores cargados\n");
    printf("================\n");

    for (int i = 0; i <= 9; i++) {
        printf("Valor de la posición %d del arreglo: %d\n", i, var_arr[i]);
    }
}

int main(void) {
    int arr_ent[10];
    cargar_arreglo(arr_ent);
    mostrar_arreglo(arr_ent);
    return 0;
}
