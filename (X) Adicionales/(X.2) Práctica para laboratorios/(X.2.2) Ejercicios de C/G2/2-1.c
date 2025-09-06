/* Realizar un algoritmo que cargue un arreglo de 10 enteros y lo muestre por
pantalla. */

#include <stdio.h>

int main(void) {
    int arr_ent[10], i;

    for (i = 0; i <= 9; i++) {
        printf("Introduzca un número para la posición %d del arreglo: ", i);
        scanf("%d", &arr_ent[i]);
    }

    printf("\n");
    printf("Valores cargados\n");
    printf("================\n");

    for (i = 0; i <= 9; i++) {
        printf("Valor de la posición %d del arreglo: %d\n", i, arr_ent[i]);
    }

    return 0;
}
